USE [2024_PROG3_RPGMANAGER];
GO



UPDATE PERSONNAGE SET Experience = 100
	WHERE NoPersonnage = 1;


SELECT *
FROM PERSONNAGE;

SELECT * FROM AUGMENTER_VIE;



DECLARE @pReponse NVARCHAR(250);

-- Appel de la proc�dure salage pour ins�rer un joueur
EXEC salage
    @Mail = 'test@example.com',
    @Mdp = 'Password123',  -- Mot de passe � saler
    @pReponse = @pReponse OUTPUT;

-- Affichage de la r�ponse pour voir si l'op�ration a r�ussi
SELECT @pReponse AS Reponse; 
GO