USE master;
GO

DROP DATABASE [2024_PROG3_RPGMANAGER];
GO
-- Script de creation de la base de donnees
CREATE DATABASE [2024_PROG3_RPGMANAGER];
GO

-- Selection de la base de donnees pour travailler dessus
USE [2024_PROG3_RPGMANAGER];
GO

-- Table JOUEUR
CREATE TABLE JOUEUR (
    NoJoueur        INT				IDENTITY(1,1),  -- Cle primaire
    Mail            VARCHAR(100),  -- Not NULL et UNIQUE
    Mdp             BINARY(64),  -- Not NULL
	Sel				UNIQUEIDENTIFIER
);
GO

-- Table PERSONNAGE
CREATE TABLE PERSONNAGE (
    NoPersonnage    INT				IDENTITY(1,1),  -- Cle primaire
    NoJoueur        INT, --Not NULL
    NomPerso        CHAR(15),  -- Not NULL
    Experience      INT,  -- Valeur par defaut
    Argent          INT,  -- Valeur par defaut
    VieMax          DECIMAL(5,2),  -- Not NULL
    VieRestante     DECIMAL(5,2),-- Not NULL
    Levels          INT -- Not NULL
);
GO

-- Table ARME
CREATE TABLE ARME (
    NoArme          INT				IDENTITY(1,1),  -- Cle primaire
    NomArme         VARCHAR(100)  ,  -- Not NULL
    TypeArme        VARCHAR(100)  ,  -- Not NULL
    Niveau          INT  ,  -- Not NULL
    Descriptions    VARCHAR(100)  ,  -- Not NULL
    Degats          INT    -- Not NULL
);
GO

-- Table ARMURE
CREATE TABLE ARMURE (
    NoArmure        INT				IDENTITY(1,1),  -- Cle primaire
    NomArmure       VARCHAR(100)  ,  -- Not NULL
    TypeArmure      VARCHAR(100)  ,  -- Not NULL
    Niveau          INT  ,  -- Not NULL
    Descriptions    VARCHAR(100)  ,  -- Not NULL
    Resistance      INT    -- Not NULL
);
GO

-- Table NIVEAU
CREATE TABLE NIVEAU (
    Levels          INT				IDENTITY(1,1),  -- Cle primaire
    ExpRequis       INT  ,  -- Not NULL
    Titre           VARCHAR(15)  ,  -- Not NULL
    GainVie         INT    -- Not NULL
);
GO

-- Table CLASSE
CREATE TABLE CLASSE (
    NoClasse        INT				IDENTITY(1,1),  -- Cle primaire
    Descriptions    VARCHAR(100)  ,  -- Not NULL
    BonusResistance INT  ,  -- Not NULL
    BonusAttaque    INT  ,  -- Not NULL
    BonusVie        INT  ,  -- Not NULL
    NoArme          INT  ,  -- Not NULL -- Foreign Key
    NoArmure        INT   -- Not NULL	-- Foreign Key
)
GO

-- Table PROFIL (Table d'intersection entre PERSONNAGE et CLASSE)
CREATE TABLE PROFIL (
    NoPersonnage    INT  NOT NULL,  -- Not NULL
    NoClasse        INT  NOT NULL,  -- Not NULL
	  -- Cle primaire composee
);
GO
