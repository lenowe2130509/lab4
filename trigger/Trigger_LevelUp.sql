USE [2024_PROG3_RPGMANAGER];
GO

DROP TRIGGER IF EXISTS LevelUp;
GO

CREATE TRIGGER LevelUp
ON PERSONNAGE
AFTER UPDATE AS
IF UPDATE (Experience) BEGIN
	DECLARE @Experience AS INT
	DECLARE @ExpRequis AS INT
	DECLARE @Levels AS INT
	DECLARE @VieMax AS DECIMAL
	DECLARE @VieRestante AS DECIMAL
	DECLARE @NoPerso AS INT
	DECLARE cUpdate CURSOR LOCAL FOR 
	SELECT Experience, ExpRequis, PERSONNAGE.Levels, VieMax, VieRestante, NoPersonnage
		FROM PERSONNAGE 
		JOIN NIVEAU ON NIVEAU.Levels = PERSONNAGE.Levels;
	OPEN cUpdate;
	FETCH cUpdate INTO @Experience, @ExpRequis, @Levels, @VieMax, @VieRestante, @NoPerso;
	--Tant que le status n'a pas d'erreur on fait 
	WHILE (@@FETCH_STATUS=0) BEGIN
	-- Si l'experience est egale ou superieur a l'experience Requise alors on update toutes les statistiques necessaire 
		IF (@Experience >= @ExpRequis) BEGIN
			UPDATE PERSONNAGE SET VieMax = (SELECT * FROM AUGMENTER_VIE WHERE NoPersonnage = @NoPerso), VieRestante = (SELECT * FROM AUGMENTER_VIE WHERE NoPersonnage = @NoPerso);
			UPDATE PERSONNAGE SET Experience = 0, Levels = @Levels+1;
		END;
		FETCH cUpdate INTO @Experience, @ExpRequis, @Levels, @VieMax, @VieRestante, @NoPerso; --Ligne Suivante
	END;
	CLOSE cUpdate;
	DEALLOCATE cUpdate;
END;