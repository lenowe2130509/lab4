-- Script pour ajouter toutes les contraintes CHECK et les cles etrangeres apres la creation des tables

USE [2024_PROG3_RPGMANAGER]; 
GO

	-- NOT NULL de la Table Joueur
ALTER TABLE JOUEUR
ALTER COLUMN Mail VARCHAR(100) NOT NULL;
ALTER TABLE JOUEUR
ALTER COLUMN Mdp BINARY(64) NOT NULL;
GO
-- Contrainte pour la table JOUEUR
ALTER TABLE JOUEUR
ADD CONSTRAINT PK_JOUEUR PRIMARY KEY (NoJoueur);  -- Cle primaire
ALTER TABLE JOUEUR
ADD CONSTRAINT UC_JOUEUR_Mail UNIQUE (Mail);  -- Contrainte UNIQUE
ALTER TABLE JOUEUR
ADD CONSTRAINT CHK_JOUEUR_Mdp CHECK (LEN(Mdp) >= 8);  -- Contrainte CHECK pour avoir un mdp de minimum 8 caracteres

-- Contrainte pour la table PERSONNAGE
ALTER TABLE PERSONNAGE
ADD CONSTRAINT PK_PERSONNAGE PRIMARY KEY (NoPersonnage);  -- Cle primaire
ALTER TABLE PERSONNAGE
ADD CONSTRAINT FK_PERSONNAGE FOREIGN KEY (NoJoueur) REFERENCES JOUEUR(NoJoueur); -- Cle etrangere vers JOUEUR
ALTER TABLE PERSONNAGE
ADD CONSTRAINT CHK_PERSONNAGE_VieMax CHECK (VieMax >= 0);  -- Contrainte CHECK pour VieMax, La vie maximale doit etre positive
ALTER TABLE PERSONNAGE
ADD CONSTRAINT CHK_PERSONNAGE_VieRestante CHECK (VieRestante >= 0 AND VieRestante <= VieMax);  -- Contrainte CHECK pour VieRestante, Vie restante entre 0 et VieMax
ALTER TABLE PERSONNAGE
ADD CONSTRAINT CHK_PERSONNAGE_Level CHECK (Levels > 0 AND Levels <= 5); -- Contrainte CHECK pour vérifier que level se trouve dans l'intervale voulu
-- Contrainte DEFAULT pour avoir un niveau d'experience par defaut
ALTER TABLE PERSONNAGE
ADD CONSTRAINT df_Experience		
DEFAULT '0' FOR Experience;
ALTER TABLE PERSONNAGE
ADD CONSTRAINT df_Argent
DEFAULT '100' FOR Argent;

	-- NOT NULL de la Table Personnage
ALTER TABLE PERSONNAGE
ALTER COLUMN NomPerso CHAR(15) NOT NULL;
ALTER TABLE PERSONNAGE
ALTER COLUMN VieMax DECIMAL(5,2) NOT NULL; 
ALTER TABLE PERSONNAGE
ALTER COLUMN VieRestante DECIMAL(5,2) NOT NULL;  
ALTER TABLE PERSONNAGE
ALTER COLUMN NoJoueur INT NOT NULL;
GO

-- Contrainte pour la table ARME
ALTER TABLE ARME
ADD CONSTRAINT PK_ARME PRIMARY KEY (NoArme);  -- Cle primaire
ALTER TABLE ARME
ADD CONSTRAINT CHK_ARME_Niveau CHECK (Niveau >= 1);  -- Contrainte CHECK pour Niveau, Le niveau doit etre au moins 1
ALTER TABLE ARME
ADD CONSTRAINT CHK_ARME_Degats CHECK (Degats >= 0);  -- Contrainte CHECK pour Degats, Les degats ne peuvent pas etre negatifs

	-- NOT NULL de la Table ARME
ALTER TABLE ARME
ALTER COLUMN NomArme VARCHAR(100) NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN TypeArme VARCHAR(100) NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN Niveau INT NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN Descriptions VARCHAR(100) NOT NULL;  
ALTER TABLE ARME
ALTER COLUMN Degats INT NOT NULL; 
GO

-- Contrainte pour la table ARMURE
ALTER TABLE ARMURE
ADD CONSTRAINT PK_ARMURE PRIMARY KEY (NoArmure);  -- Cle primaire
ALTER TABLE ARMURE
ADD CONSTRAINT CHK_ARMURE_Niveau CHECK (Niveau >= 1);  -- Contrainte CHECK pour Niveau, Le niveau doit etre au moins 1
ALTER TABLE ARMURE
ADD CONSTRAINT CHK_ARMURE_Resistance CHECK (Resistance >= 0);  -- Contrainte CHECK pour Resistance, La resistance ne peut pas etre negative

	-- NOT NULL de la Table ARMURE
ALTER TABLE ARMURE
ALTER COLUMN NomArmure VARCHAR(100) NOT NULL;
ALTER TABLE ARMURE
ALTER COLUMN TypeArmure VARCHAR(100) NOT NULL; 
ALTER TABLE ARMURE
ALTER COLUMN Niveau INT NOT NULL; 
ALTER TABLE ARMURE
ALTER COLUMN Descriptions VARCHAR(100) NOT NULL; 
ALTER TABLE ARMURE
ALTER COLUMN Resistance INT NOT NULL;
GO

-- Contrainte pour la table NIVEAU
ALTER TABLE NIVEAU
ADD CONSTRAINT PK_NIVEAU PRIMARY KEY (Levels);  -- Cle primaire
ALTER TABLE NIVEAU
ADD CONSTRAINT CHK_NIVEAU_ExpRequis CHECK (ExpRequis >= 0);  -- Contrainte CHECK pour ExpRequis, L'experience requise ne peut pas etre negative
ALTER TABLE NIVEAU
ADD CONSTRAINT CHK_NIVEAU_GainVie CHECK (GainVie >= 0);  -- Contrainte CHECK pour GainVie, Le gain de vie doit etre positif ou nul

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
ADD CONSTRAINT PK_CLASSE PRIMARY KEY (NoClasse);  -- Cle primaire
	-- Les bonus ne peuvent pas etre negatifs
ALTER TABLE CLASSE
ADD CONSTRAINT CHK_CLASSE_BonusResistance CHECK (BonusResistance >= 0);  -- Contrainte CHECK pour BonusResistance
ALTER TABLE CLASSE
ADD CONSTRAINT CHK_CLASSE_BonusAttaque CHECK (BonusAttaque >= 0);  -- Contrainte CHECK pour BonusAttaque
ALTER TABLE CLASSE
ADD CONSTRAINT CHK_CLASSE_BonusVie CHECK (BonusVie >= 0);  -- Contrainte CHECK pour BonusVie

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

	-- Cle etrangeres de la table CLASSE
ALTER TABLE CLASSE
ADD CONSTRAINT FK_CLASSE_NoArme FOREIGN KEY (NoArme) REFERENCES ARME(NoArme);  -- Cle etrangere vers ARME
ALTER TABLE CLASSE
ADD	CONSTRAINT FK_CLASSE_NoArmure FOREIGN KEY (NoArmure) REFERENCES ARMURE(NoArmure);  -- Cle etrangere vers ARMURE
GO

-- Contrainte pour la table PROFIL

	-- Cle etrangere de la table PROFIL
ALTER TABLE PROFIL
ADD CONSTRAINT FK_PROFIL_NoPersonnage FOREIGN KEY (NoPersonnage) REFERENCES PERSONNAGE(NoPersonnage) ON DELETE CASCADE;  -- Cle etrangere avec suppression en cascade
ALTER TABLE PROFIL
ADD CONSTRAINT FK_PROFIL_NoClasse FOREIGN KEY (NoClasse) REFERENCES CLASSE(NoClasse) ON DELETE CASCADE;  -- Cle etrangere avec suppression en cascade
GO
	-- Cle primaire de la table PROFIL
ALTER TABLE PROFIL
ADD CONSTRAINT PK_PROFIL PRIMARY KEY (NoPersonnage, NoClasse);
