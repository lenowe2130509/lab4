CREATE VIEW STATS AS
    SELECT NomPerso, VieMax, Levels, Degats, Resistance, Descriptions, BonusResistance, BonusAttaque, BonusVie
    FROM PERSONNAGE
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse
    JOIN ARME
        ON CLASSE.NoArme = ARME.NoArme
    JOIN ARMURE
        ON CLASSE.NoArmure = ARMURE.NoArmure;

CREATE VIEW AMELIORER_ARME AS
    SELECT  Levels, Argent, Niveau
    FROM PERSONNAGE
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse
    JOIN ARME
        ON CLASSE.NoArme = ARME.NoArme

CREATE VIEW AMELIORER_ARMURE AS
    SELECT Levels, Argent, Niveau
    FROM PERSONNAGE
    JOIN PROFIL
        ON PERSONNAGE.NoPersonnage = PROFIL.NoPersonnage
    JOIN CLASSE
        ON PROFIL.NoClasse = CLASSE.NoClasse
    JOIN ARMURE
        ON CLASSE.NoArmure = ARMURE.NoArmure;

CREATE VIEW AUGMANTER_VIE AS
    SELECT CONCAT(VieMax + GainVie)
    FROM PERSONNAGE
    JOIN NIVEAU
        ON PERSONNAGE.Levels = NIVEAU.Levels;