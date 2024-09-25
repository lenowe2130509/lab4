USE 2024_PROG3_RPGMANAGER;
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

CREATE VIEW AMELIORER_ARME AS																								-- cette vue recupere le niveau de l'arme ansi que l'argent et le level du perso pour ameliorer l'arme
    SELECT  Levels, Argent, Niveau
    FROM PERSONNAGE
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse
    JOIN ARME
        ON CLASSE.NoArme = ARME.NoArme
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

CREATE VIEW AUGMANTER_VIE AS																								-- cette vue perme de savoir quelle sera la vie maximale du perso après un gain de niveau
    SELECT SUM(VieMax + GainVie) AS Amelioration_vie
    FROM PERSONNAGE
    JOIN NIVEAU
        ON PERSONNAGE.Levels = NIVEAU.Levels;
GO