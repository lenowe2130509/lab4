USE BDDorianOwen;
GO

DECLARE @pReponse NVARCHAR(250);

-- Appel de la procédure salage pour insérer un joueur
EXEC salage
    @Mail = 'test@example.com',
    @Mdp = 'Password123',  -- Mot de passe à saler
    @pReponse = @pReponse OUTPUT;

-- Affichage de la réponse pour voir si l'opération a réussi
SELECT @pReponse AS Reponse; 
GO