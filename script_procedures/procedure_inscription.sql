use BDDorianOwen;
GO

CREATE PROCEDURE Inscription(@mail VARCHAR(100), @mdp VARCHAR(50)) AS
BEGIN                                                                   -- verifie si il existe un joueur avec cet adresse mail                                                     
    SET NOCOUNT ON;                                                         -- empêche les message lors du lancement du script
    DECLARE @sel UNIQUEIDENTIFIER=NEWID();
    IF NOT EXISTS (SELECT Mail  FROM JOUEUR WHERE Mail = @mail)         -- si non cree le joueur
    BEGIN
        INSERT INTO JOUEUR (Mail, Mdp)
            VALUES(HASHBYTES('SHA2_512', @mail +CAST(@sel AS NVARCHAR(36))), HASHBYTES('SHA2_512', @mdp +CAST(@sel AS NVARCHAR(36)))); -- insertion du mdp et du mail encrypte dans joueur
        RETURN @Mail;
    END;
    IF EXISTS (SELECT Mail  FROM JOUEUR WHERE Mail = @mail)             -- si oui retourner -1
    BEGIN
        RETURN -1;
    END;
END;
GO
