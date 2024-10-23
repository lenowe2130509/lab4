DROP VIEW IF EXISTS STATISTIQUE, AMELIORER_ARME, AMELIORER_ARMURE, AUGMENTER_VIE
GO

USE [2024_PROG3_RPGMANAGER];
GO

DROP VIEW IF EXISTS STATISTIQUE;
GO

CREATE VIEW STATISTIQUE AS																									-- cette vue sert a afficher les info generale du perso
    SELECT NomPerso, VieMax, Levels, Degats, Resistance, CLASSE.Descriptions, BonusResistance, BonusAttaque, BonusVie
    FROM PERSONNAGE
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse
    JOIN ARME
        ON CLASSE.NoArme = ARME.NoArme
    JOIN ARMURE
        ON CLASSE.NoArmure = ARMURE.NoArmure;
GO

DROP VIEW IF EXISTS AMELIORER_ARME;
GO

CREATE VIEW AMELIORER_ARME AS																								-- cette vue recupere le niveau de l'arme ansi que l'argent et le level du perso pour ameliorer l'arme
    SELECT  Levels, Argent, Niveau
    FROM PERSONNAGE
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse
    JOIN ARME
        ON CLASSE.NoArme = ARME.NoArme;
GO

DROP VIEW IF EXISTS AMELIORER_ARMURE;
GO

CREATE VIEW AMELIORER_ARMURE AS																								-- cette vue recupere le niveau de l'armure ansi que l'argent et le level du perso pour ameliorer l'armure
    SELECT Levels, Argent, Niveau
    FROM PERSONNAGE
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse
    JOIN ARMURE
        ON CLASSE.NoArmure = ARMURE.NoArmure;
GO

DROP VIEW IF EXISTS AUGMENTER_VIE;
GO


CREATE VIEW AUGMENTER_VIE AS																								-- cette vue permet de savoir quelle sera la vie maximale du perso apres un gain de niveau
    SELECT PERSONNAGE.NoPersonnage AS NoPerso, (VieMax + GainVie) AS Amelioration_vie
    FROM PERSONNAGE
    JOIN NIVEAU
        ON PERSONNAGE.Levels = NIVEAU.Levels
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse;
GO
