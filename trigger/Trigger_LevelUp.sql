USE [2024_PROG3_RPGMANAGER];
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
	DECLARE cUpdate CURSOR FOR 
	SELECT Experience, ExpRequis, PERSONNAGE.Levels, VieMax, VieRestante 
		FROM PERSONNAGE 
		JOIN NIVEAU ON NIVEAU.Levels = PERSONNAGE.Levels;
	OPEN cUpdate;
	FETCH cUpdate INTO @Experience, @ExpRequis, @Levels, @VieMax, @VieRestante;
	--Tant que le status n'a pas d'erreur on fait 
	While (@@FETCH_STATUS=0) BEGIN
	-- Si l'experience est egale ou superieur a l'experience Requise alors on update toutes les statistiques necessaire 
		IF (@Experience >= @ExpRequis) BEGIN
			UPDATE PERSONNAGE SET Experience = 0, Levels = @Levels+1;
			UPDATE PERSONNAGE SET VieMax = (SELECT * FROM AUGMENTER_VIE), VieRestante = (SELECT * FROM AUGMENTER_VIE);
		END;
		FETCH cUpdate INTO @Experience, @ExpRequis, @Levels, @VieMax, @VieRestante; --Ligne Suivante
	END;
END;