USE [2024_PROG3_RPGMANAGER];
GO



UPDATE PERSONNAGE SET Experience = 100
	WHERE NoPersonnage = 1;


SELECT *
FROM PERSONNAGE;

SELECT * FROM AUGMENTER_VIE;



DECLARE @pReponse NVARCHAR(250);

-- Appel de la procédure salage pour insérer un joueur
EXEC salage
    @Mail = 'test@example.com',
    @Mdp = 'Password123',  -- Mot de passe à saler
    @pReponse = @pReponse OUTPUT;

-- Affichage de la réponse pour voir si l'opération a réussi
SELECT @pReponse AS Reponse; 
GO