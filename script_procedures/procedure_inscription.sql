use BDDorianOwen
GO

CREATE PROCEDURE inscription(@mail VARCHAR(100), @mdp VARCHAR(50)) AS
BEGIN                                                                   -- verifie si il existe un joueur avec cet adresse mail
    IF NOT EXISTS (SELECT Mail  FROM JOUEUR WHERE Mail = @mail)         -- si non cree le joueur
    BEGIN
        INSERT INTO JOUEUR (Mail, Mdp)
            VALUES(@mail, @mdp);
        RETURN @Mail;
    END;
    IF EXISTS (SELECT Mail  FROM JOUEUR WHERE Mail = @mail)             -- si oui retourner -1
    BEGIN
        RETURN -1;
    END;
END;
GO
