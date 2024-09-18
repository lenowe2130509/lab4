INSERT INTO NIVEAU(Levels, ExpRequis, Titre, GainVie)
    VALUES(1, 50, 'Aspirant', 50);
INSERT INTO NIVEAU(Levels, ExpRequis, Titre, GainVie)
    VALUES(2, 100, 'Novice', 125);
INSERT INTO NIVEAU(Levels, ExpRequis, Titre, GainVie)
    VALUES(3, 200, 'Aprentis', 250);
INSERT INTO NIVEAU(Levels, ExpRequis, Titre, GainVie)
    VALUES(4, 400, 'Confirmé', 375);
INSERT INTO NIVEAU(Levels, ExpRequis, Titre, GainVie)
    VALUES(5, 800, 'Maitre', 500);

INSERT INTO ARME(NomArme, TypeArme, Niveau, Descriptions, Degats)
    VALUES('Aiguillon pur', 'épée courte', 1, 'une épée légère et maniable', 25);
INSERT INTO ARME(NomArme, TypeArme, Niveau, Descriptions, Degats)
    VALUES("Dragon slayer", 'épée à deux mains', 1, "une lourde épée capable de trancher les armure", 65);
INSERT INTO ARME(NomArme, TypeArme, Niveau, Descriptions, Degats)
    VALUES("Destructrice de toure", 'hache de gerre', 1, "une grosse hache qui écrase plus qu'elle" , 75);
INSERT INTO ARME(NomArme, TypeArme, Niveau, Descriptions, Degats)
    VALUES('Diplomate', 'dague', 1, 'une dague discrète et extrêmement maniable qui ne fait jamais de bruit', 15);

INSERT INTO ARMURE(NomArmure, TypeArmure, Niveau, Descriptions, Resistance)
    VALUES("Morceau d'armure", 'métale', 1, "l'équilibre parfait entre résistance et légèrté", 10);
INSERT INTO ARMURE(NomArmure, TypeArmure, Niveau, Descriptions, Resistance)
    VALUES("Armure de plate", 'métale', 1, "lourde et résistante", 15);
INSERT INTO ARMURE(NomArmure, TypeArmure, Niveau, Descriptions, Resistance)
    VALUES("seinture de cuire", 'cuire', 1, "très peu de résistance mais une grande légèrté", 2);
INSERT INTO ARMURE(NomArmure, TypeArmure, Niveau, Descriptions, Resistance)
    VALUES("Tunique matelassé", 'tissu', 1, "protège raisonablement son porteur", 7);

INSERT INTO CLASSE(Descriptions, BonusResistance, BonusAttaque, BonusVie, NoArme, NoArmure)
    VALUES("Le guerrier: un combatant vaillant et très polyvalent", 5, 5, 5, 1, 1);
INSERT INTO CLASSE(Descriptions, BonusResistance, BonusAttaque, BonusVie, NoArme, NoArmure)
    VALUES("Le paladins: un chevalier puissant fidèle à sa divinité", 7, 8, 4, 2, 2);
INSERT INTO CLASSE(Descriptions, BonusResistance, BonusAttaque, BonusVie, NoArme, NoArmure)
    VALUES("Le barbare: un combatant violant et fort", 9, 8, 3, 3, 3);
INSERT INTO CLASSE(Descriptions, BonusResistance, BonusAttaque, BonusVie, NoArme, NoArmure)
    VALUES("L'assassin: un combatant discret et agile", 2, 5, 9, 4, 4);

INSERT INTO JOUEUR(Mail, Mdp)
    VALUES("tatayoyo@gmail.com", "j'aipasd'idee")

INSERT INTO PERSONNAGE(NomPerso, VieMax, VieRestante, NoJoueur, Levels)
    VALUES('Theophil', 0, 0, 1, 1);
INSERT INTO PERSONNAGE(NomPerso, VieMax, VieRestante, NoJoueur, Levels)
    VALUES('Julius', 0, 0, 1, 1);
INSERT INTO PERSONNAGE(NomPerso, VieMax, VieRestante, NoJoueur, Levels)
    VALUES('Jorund', 0, 0, 1, 1);
INSERT INTO PERSONNAGE(NomPerso, VieMax, VieRestante, NoJoueur, Levels)
    VALUES('Bob', 0, 0, 1, 1);

INSERT INTO PROFIL(NoPersonnage, NoClasse)
    VALUES(1, 1);
INSERT INTO PROFIL(NoPersonnage, NoClasse)
    VALUES(2, 2);
INSERT INTO PROFIL(NoPersonnage, NoClasse)
    VALUES(3, 3);
INSERT INTO PROFIL(NoPersonnage, NoClasse)
    VALUES(4, 4);