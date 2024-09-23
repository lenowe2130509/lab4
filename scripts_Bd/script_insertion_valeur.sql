USE BDDorianOwen;
GO

INSERT INTO NIVEAU(ExpRequis, Titre, GainVie)
    VALUES(50, 'Aspirant', 50),
		  (100, 'Novice', 125),
		  (200, 'Aprentis', 250),
		  (400, 'Confirmé', 375),
		  (800, 'Maitre', 500);

INSERT INTO ARME(NomArme, TypeArme, Niveau, Descriptions, Degats)
    VALUES('Aiguillon pur', 'épée courte', 1, 'une épée légère et maniable', 25),
		  ('Dragon slayer', 'épée à deux mains', 1, 'une lourde épée capable de trancher les armure', 65),
		  ('Destructrice de toure', 'hache de gerre', 1, 'une grosse hache qui écrase plus qu elle' , 75),
		  ('Diplomate', 'dague', 1, 'une dague discrète et extrêmement maniable qui ne fait jamais de bruit', 15);

INSERT INTO ARMURE(NomArmure, TypeArmure, Niveau, Descriptions, Resistance)
    VALUES('Morceau d armure', 'métale', 1, 'l équilibre parfait entre résistance et légèrté', 10),
		  ('Armure de plate', 'métale', 1, 'lourde et résistante', 15),
		  ('seinture de cuire', 'cuire', 1, 'très peu de résistance mais une grande légèrté', 2),
	      ('Tunique matelassée', 'tissu', 1, 'protège raisonablement son porteur', 7);

INSERT INTO CLASSE(Descriptions, BonusResistance, BonusAttaque, BonusVie, NoArme, NoArmure)
    VALUES('Le guerrier: un combatant vaillant et très polyvalent', 5, 5, 5, 1, 1),
		  ('Le paladins: un chevalier puissant fidèle à sa divinité', 7, 8, 4, 2, 2),
		  ('Le barbare: un combatant violant et fort', 9, 8, 3, 3, 3),
		  ('L assassin: un combatant discret et agile', 2, 5, 9, 4, 4);

INSERT INTO JOUEUR(Mail, Mdp, Sel)
    VALUES('tatayoyo@gmail.com', HASHBYTES('SHA2_512', 'j aipasd idee'), NEWID());  
							 -- Hachage du mot de passe -- Génération d'un identifiant unique pour la colonne Sel);

INSERT INTO PERSONNAGE(NomPerso, VieMax, VieRestante, NoJoueur, Levels)
    VALUES('Theophil', 0, 0, 1, 1),
		  ('Julius', 0, 0, 1, 1),
		  ('Jorund', 0, 0, 1, 1),
		  ('Bob', 0, 0, 1, 1);

INSERT INTO PROFIL(NoPersonnage, NoClasse)
    VALUES(1, 1),
		  (2, 2),
		  (3, 3),
		  (4, 4);