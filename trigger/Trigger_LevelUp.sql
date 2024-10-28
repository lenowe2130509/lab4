USE [2024_PROG3_RPGMANAGER];
GO

DROP TRIGGER IF EXISTS LevelUp;
GO

CREATE TRIGGER LevelUp
ON PERSONNAGE
AFTER UPDATE AS
BEGIN
    IF UPDATE (Experience)
    BEGIN
        DECLARE @Experience AS INT;
        DECLARE @ExpRequis AS INT;
        DECLARE @Levels AS INT;
        DECLARE @NoPerso AS INT;

        DECLARE cUpdate CURSOR LOCAL FOR 
        SELECT p.Experience, n.ExpRequis, p.Levels, p.NoPersonnage
        FROM PERSONNAGE p
        JOIN NIVEAU n ON n.Levels = p.Levels
        WHERE p.NoPersonnage IN (SELECT NoPersonnage FROM inserted); 

        OPEN cUpdate;
        FETCH cUpdate INTO @Experience, @ExpRequis, @Levels, @NoPerso;

        WHILE (@@FETCH_STATUS = 0) 
        BEGIN
            IF (@Experience >= @ExpRequis) 
            BEGIN
                BEGIN TRANSACTION;


                UPDATE PERSONNAGE 
                SET 
                    Levels += 1 ,
                    VieMax = (SELECT Amelioration_vie FROM AUGMENTER_VIE JOIN PERSONNAGE ON PERSONNAGE.NoPersonnage = AUGMENTER_VIE.NoPerso WHERE NoPersonnage = @NoPerso),
                    VieRestante = (SELECT Amelioration_vie FROM AUGMENTER_VIE JOIN PERSONNAGE ON PERSONNAGE.NoPersonnage = AUGMENTER_VIE.NoPerso WHERE NoPersonnage = @NoPerso), 
                    Experience = 0
                WHERE NoPersonnage = @NoPerso;

                COMMIT TRANSACTION;
            END;

            FETCH cUpdate INTO @Experience, @ExpRequis, @Levels, @NoPerso; -- Next row
        END;

        CLOSE cUpdate;
        DEALLOCATE cUpdate;
    END;
END;
