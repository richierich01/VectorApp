CREATE PROCEDURE [dbo].[SP_Add_Student]
	@Id     	int output,
	@FirstName	varchar(50),
	@MiddleName	varchar(50),
	@LastName	varchar(50),	
	@Email		varchar(100)
AS
BEGIN
		INSERT INTO [dbo].[Students]
           ([FirstName],
		    [MiddleName],
            [LastName],
            [Email])
		VALUES
           (@FirstName,
		   @MiddleName,
           @LastName, 
           @Email);
		SET @Id = cast(scope_identity() as int)

		SELECT * FROM Students WHERE id = @Id;
END;