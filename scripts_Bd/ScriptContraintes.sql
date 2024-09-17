-- Script pour ajouter toutes les contraintes CHECK et les clés étrangères après la création des tables

USE BDDorianOwen;
GO

-- Contrainte pour la table JOUEUR
ALTER TABLE JOUEUR
ADD CONSTRAINT PK_JOUEUR PRIMARY KEY (NoJoueur),  -- Clé primaire
    CONSTRAINT UC_JOUEUR_Mail UNIQUE (Mail),  -- Contrainte UNIQUE
    CONSTRAINT CHK_JOUEUR_Mdp CHECK (LEN(Mdp) >= 8);  -- Contrainte CHECK pour avoir un mdp de minimum 8 caracteres

	-- NOT NULL de la Table Joueur
ALTER TABLE JOUEUR
ALTER COLUMN Mail VARCHAR(100) NOT NULL;
ALTER TABLE JOUEUR
ALTER COLUMN Mdp VARCHAR(50) NOT NULL;
GO

-- Contrainte pour la table PERSONNAGE
ALTER TABLE PERSONNAGE
ADD CONSTRAINT PK_PERSONNAGE PRIMARY KEY (NoPersonnage),  -- Clé primaire
    CONSTRAINT CHK_PERSONNAGE_VieMax CHECK (VieMax >= 0),  -- Contrainte CHECK pour VieMax, La vie maximale doit être positive
    CONSTRAINT CHK_PERSONNAGE_VieRestante CHECK (VieRestante >= 0 AND VieRestante <= VieMax);  -- Contrainte CHECK pour VieRestante, Vie restante entre 0 et VieMax
-- Contrainte DEFAULT pour avoir un niveau d'expérience par defaut
ALTER TABLE PERSONNAGE
ADD CONSTRAINT df_Experience		
DEFAULT '0' FOR Experience,
	CONSTRAINT df_Argent
DEFAULT '100' FOR Argent;

	-- NOT NULL de la Table Personnage
ALTER TABLE PERSONNAGE
ALTER COLUMN NomPerso CHAR(15) NOT NULL;
ALTER TABLE PERSONNAGE
ALTER COLUMN VieMax DECIMAL(5,2) NOT NULL; 
ALTER TABLE PERSONNAGE
ALTER COLUMN VieRestante DECIMAL(5,2) NOT NULL;  
GO

-- Contrainte pour la table ARME
ALTER TABLE ARME
ADD CONSTRAINT PK_ARME PRIMARY KEY (NoArme),  -- Clé primaire
    CONSTRAINT CHK_ARME_Niveau CHECK (Niveau >= 1),  -- Contrainte CHECK pour Niveau, Le niveau doit être au moins 1
    CONSTRAINT CHK_ARME_Degats CHECK (Degats >= 0);  -- Contrainte CHECK pour Degats, Les dégâts ne peuvent pas être négatifs

	-- NOT NULL de la Table ARME
ALTER TABLE ARME
ALTER COLUMN NomArme VARCHAR(20) NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN TypeArme VARCHAR(15) NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN Niveau INT NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN Descriptions VARCHAR(100) NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN Degats INT NOT NULL; 
GO

-- Contrainte pour la table ARMURE
ALTER TABLE ARMURE
ADD CONSTRAINT PK_ARMURE PRIMARY KEY (NoArmure),  -- Clé primaire
    CONSTRAINT CHK_ARMURE_Niveau CHECK (Niveau >= 1),  -- Contrainte CHECK pour Niveau, Le niveau doit être au moins 1
    CONSTRAINT CHK_ARMURE_Resistance CHECK (Resistance >= 0);  -- Contrainte CHECK pour Resistance, La résistance ne peut pas être négative

	-- NOT NULL de la Table ARMURE
ALTER TABLE ARMURE
ALTER COLUMN NomArmure VARCHAR(20) NOT NULL;
ALTER TABLE ARMURE
ALTER COLUMN TypeArmure VARCHAR(15) NOT NULL; 
ALTER TABLE ARMURE
ALTER COLUMN Niveau INT NOT NULL; 
ALTER TABLE ARMURE
ALTER COLUMN Descriptions VARCHAR(100) NOT NULL; 
ALTER TABLE ARMURE
ALTER COLUMN Resistance INT NOT NULL;
GO

-- Contrainte pour la table NIVEAU
ALTER TABLE NIVEAU
ADD CONSTRAINT PK_NIVEAU PRIMARY KEY (Levels),  -- Clé primaire
    CONSTRAINT CHK_NIVEAU_ExpRequis CHECK (ExpRequis >= 0),  -- Contrainte CHECK pour ExpRequis, L'expérience requise ne peut pas être négative
    CONSTRAINT CHK_NIVEAU_GainVie CHECK (GainVie >= 0);  -- Contrainte CHECK pour GainVie, Le gain de vie doit être positif ou nul

	-- NOT NULL de la Table NIVEAU
ALTER TABLE NIVEAU
ALTER COLUMN ExpRequis INT NOT NULL; 
ALTER TABLE NIVEAU
ALTER COLUMN Titre VARCHAR(15) NOT NULL; 
ALTER TABLE NIVEAU
ALTER COLUMN GainVie INT NOT NULL; 
GO

-- Contrainte pour la table CLASSE
ALTER TABLE CLASSE
ADD CONSTRAINT PK_CLASSE PRIMARY KEY (NoClasse),  -- Clé primaire
	-- Les bonus ne peuvent pas être négatifs
    CONSTRAINT CHK_CLASSE_BonusResistance CHECK (BonusResistance >= 0),  -- Contrainte CHECK pour BonusResistance
    CONSTRAINT CHK_CLASSE_BonusAttaque CHECK (BonusAttaque >= 0),  -- Contrainte CHECK pour BonusAttaque
    CONSTRAINT CHK_CLASSE_BonusVie CHECK (BonusVie >= 0);  -- Contrainte CHECK pour BonusVie

	-- NOT NULL de la Table CLASSE
ALTER TABLE CLASSE
ALTER COLUMN Descriptions VARCHAR(100) NOT NULL; 
ALTER TABLE CLASSE
ALTER COLUMN BonusResistance INT NOT NULL;  
ALTER TABLE CLASSE
ALTER COLUMN BonusAttaque INT NOT NULL;  
ALTER TABLE CLASSE
ALTER COLUMN BonusVie INT NOT NULL; 
ALTER TABLE CLASSE
ALTER COLUMN NoArme INT NOT NULL; 
ALTER TABLE CLASSE
ALTER COLUMN NoArmure INT NOT NULL; 

	-- Clé étrangères de la table CLASSE
ALTER TABLE CLASSE
ADD CONSTRAINT FK_CLASSE_NoArme FOREIGN KEY (NoArme) REFERENCES ARME(NoArme),  -- Clé étrangère vers ARME
	CONSTRAINT FK_CLASSE_NoArmure FOREIGN KEY (NoArmure) REFERENCES ARMURE(NoArmure);  -- Clé étrangère vers ARMURE
GO

-- Contrainte pour la table PROFIL
	-- Clé primaire de la table PROFIL
ALTER TABLE PROFIL
ADD CONSTRAINT PK_PROFIL PRIMARY KEY (NoPersonnage, NoClasse);

	-- Clé étrangère de la table PROFIL
ALTER TABLE PROFIL
ADD CONSTRAINT FK_PROFIL_NoPersonnage FOREIGN KEY (NoPersonnage) REFERENCES PERSONNAGE(NoPersonnage) ON DELETE CASCADE,  -- Clé étrangère avec suppression en cascade
	CONSTRAINT FK_PROFIL_NoClasse FOREIGN KEY (NoClasse) REFERENCES CLASSE(NoClasse) ON DELETE CASCADE;  -- Clé étrangère avec suppression en cascade
GO
