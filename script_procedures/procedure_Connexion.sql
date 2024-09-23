USE BDDorianOwen;
GO

-- Cree une procedure du nom de Connexion
-- Cette procédure va permettre d'initialiser des variables
CREATE PROCEDURE Connexion (
	@Mail		VARCHAR(100),
	@Mdp		BINARY(64),
	@NoJoueur	INT output
	)
AS 
BEGIN
	-- SETNOCOUNT ON = pas de commentaire
	SET NOCOUNT ON;
	-- Si le Mail existe dans la Table JOUEUR alors 
	IF EXISTS (SELECT Mail FROM JOUEUR WHERE Mail = @Mail)
		BEGIN
			--On selectionne le NoJoueur = a l'initialisation de la variable en haut
			--dans la TABLE JOUEUR si le Joueur existe avec le mail et le Mdp
			SELECT @NoJoueur = NoJoueur 
			FROM JOUEUR 
			WHERE Mail = @Mail AND Mdp = @Mdp;
			SELECT @NoJoueur;
			-- On retourne le @NoJoueur 
			RETURN @NoJoueur;
		END;
	ELSE 
	-- SINON on return -1
		BEGIN
			RETURN -1;
		END;
END;
GO