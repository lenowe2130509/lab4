-- Script de création de la base de données
CREATE DATABASE BDDorianOwen;
GO

-- Sélection de la base de données pour travailler dessus
USE BDDorianOwen;
GO

-- Table JOUEUR
CREATE TABLE JOUEUR (
    NoJoueur        INT				IDENTITY(1,1),  -- Clé primaire
    Mail            VARCHAR(100),  -- Not NULL et UNIQUE
    Mdp             VARCHAR(50)  -- Not NULL
);
GO

-- Table PERSONNAGE
CREATE TABLE PERSONNAGE (
    NoPersonnage    INT				IDENTITY(1,1),  -- Clé primaire
    NomPerso        CHAR(15),  -- Not NULL
    Experience      INT,  -- Valeur par défaut
    Argent          INT,  -- Valeur par défaut
    VieMax          DECIMAL(5,2),  -- Not NULL
    VieRestante     DECIMAL(5,2)-- Not NULL
);
GO

-- Table ARME
CREATE TABLE ARME (
    NoArme          INT				IDENTITY(1,1),  -- Clé primaire
    NomArme         VARCHAR(20)  ,  -- Not NULL
    TypeArme        VARCHAR(15)  ,  -- Not NULL
    Niveau          INT  ,  -- Not NULL
    Descriptions    VARCHAR(100)  ,  -- Not NULL
    Degats          INT    -- Not NULL
);
GO

-- Table ARMURE
CREATE TABLE ARMURE (
    NoArmure        INT				IDENTITY(1,1),  -- Clé primaire
    NomArmure       VARCHAR(20)  ,  -- Not NULL
    TypeArmure      VARCHAR(15)  ,  -- Not NULL
    Niveau          INT  ,  -- Not NULL
    Descriptions    VARCHAR(100)  ,  -- Not NULL
    Resistance      INT    -- Not NULL
);
GO

-- Table NIVEAU
CREATE TABLE NIVEAU (
    Levels          INT				IDENTITY(1,1),  -- Clé primaire
    ExpRequis       INT  ,  -- Not NULL
    Titre           VARCHAR(15)  ,  -- Not NULL
    GainVie         INT    -- Not NULL
);
GO

-- Table CLASSE
CREATE TABLE CLASSE (
    NoClasse        INT				IDENTITY(1,1),  -- Clé primaire
    Descriptions    VARCHAR(100)  ,  -- Not NULL
    BonusResistance INT  ,  -- Not NULL
    BonusAttaque    INT  ,  -- Not NULL
    BonusVie        INT  ,  -- Not NULL
    NoArme          INT  ,  -- Not NULL
    NoArmure        INT   -- Not NULL
)
GO

-- Table PROFIL (Table d'intersection entre PERSONNAGE et CLASSE)
CREATE TABLE PROFIL (
    NoPersonnage    INT  ,  -- Not NULL
    NoClasse        INT  ,  -- Not NULL
	  -- Clé primaire composée
);
GO
