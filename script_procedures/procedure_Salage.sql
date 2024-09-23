DROP PROCEDURE IF EXISTS salage;
GO

USE BDDorianOwen;
GO

CREATE PROCEDURE salage
	@Mail		VARCHAR(100),
	@Mdp		NVARCHAR(100),
	@pReponse NVARCHAR(250) OUTPUT
AS
BEGIN
		SET NOCOUNT ON

		DECLARE @Sel UNIQUEIDENTIFIER=NEWID();
		BEGIN TRY

			INSERT INTO JOUEUR(Mail, mdp, Sel)
			  VALUES (@Mail, HASHBYTES('SHA2_512', @Mdp + CAST(@Sel AS NVARCHAR(36))), 
                @Sel);
        SET @pReponse = 'Success';

		END TRY
		BEGIN CATCH
			SET @pReponse = ERROR_MESSAGE();
		END CATCH
END