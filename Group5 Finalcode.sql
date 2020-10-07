USE Proj_A5

--Store procedures

-- Insert new row to Program_Keyword table

CREATE PROCEDURE PA5INSERT_tblProgram
@ProgramTitle varchar(100), 
@ProgramDesc varchar(500), 
@Runtime INTEGER,
@ViewCount INTEGER,
@ReleaseDate DATE,
@Season INTEGER,
@ProgramTypeName varchar(50),
@ProgramCompanyName varchar(50),
@AgeRatingName varchar(50),
@RegionName varchar(50)

AS 
DECLARE @PT_ID INT, @PC_ID INT, @Reg_ID INT, @Age_ID INT



SET @PT_ID = (SELECT ProgramTypeID FROM tblProgramType WHERE ProgramTypeName = @ProgramTypeName)

IF @PT_ID IS NULL
	BEGIN
	PRINT 'Error present in @PT_ID';
	THROW 51007, '@PT_ID cannot be NULL; process terminated', 1;
END

SET @PC_ID = (SELECT ProgramCompanyID FROM tblProgramCompany WHERE ProgramCompanyName = @ProgramCompanyName)

IF @PT_ID IS NULL
	BEGIN
	PRINT 'Error present in @PC_ID';
	THROW 51007, '@PC_ID cannot be NULL; process terminated', 1;
END

SET @Reg_ID = (SELECT RegionID FROM tblRegion WHERE RegionName = @RegionName)

IF @Reg_ID IS NULL
	BEGIN
	PRINT 'Error present in @Reg_ID';
	THROW 51007, '@Reg_ID cannot be NULL; process terminated', 1;
END

SET @Age_ID = (SELECT AgeRatingID FROM tblAgeRating WHERE AgeRatingName = @AgeRatingName)

IF @Age_ID IS NULL
	BEGIN
	PRINT 'Error present in @Age_ID';
	THROW 51007, '@Age_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A6
INSERT INTO tblProgram(ProgramTypeID, ProgramCompanyID, AgeRatingID, RegionID, ProgramTitle, ProgramDesc, Runtime, ViewCount, ReleaseDate, Season)
VALUES(@PT_ID, @PC_ID, @Age_ID, @Reg_ID, @ProgramTitle, @ProgramDesc, @Runtime, @ViewCount, @ReleaseDate, @Season)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A6
ELSE
	COMMIT TRANSACTION A6
GO

Execute PA5INSERT_tblProgram
@ProgramTitle = 'Avengers: Infinity War', 
@ProgramDesc = 'Iron Man, Thor, the Hulk and the rest of the Avengers unite to battle their most powerful enemy yet -- the evil Thanos.', 
@Runtime = 160,
@ViewCount = 230000000,
@ReleaseDate = '2018-04-23',
@Season = NULL,
@ProgramTypeName = 'Movie',
@ProgramCompanyName = 'Marvel Studios',
@AgeRatingName = 'PG-13',
@RegionName = 'U.S'
GO

Execute PA5INSERT_tblProgram
@ProgramTitle = 'Frozen 2', 
@ProgramDesc = 'Second series of Frozen; After hearing a mysterious voice call out to her, Elsa travels to the enchanted forests and dark seas beyond her kingdom', 
@Runtime = 160,
@ViewCount = 137477920,
@ReleaseDate = '2019-11-22',
@Season = NULL,
@ProgramTypeName = 'Movie',
@ProgramCompanyName = 'The Walt Disney Pictures',
@AgeRatingName = 'PG',
@RegionName = 'U.S'
GO

Execute PA5INSERT_tblProgram
@ProgramTitle = 'Money Heist', 
@ProgramDesc = 'A criminal mastermind who goes by "The Professor" has a plan to pull off the biggest heist in recorded history',
@Runtime = NULL,
@ViewCount = NULL,
@ReleaseDate = '2017-05-02',
@Season = 2,
@ProgramTypeName = 'TV Drama',
@ProgramCompanyName = 'Netflix Originals',
@AgeRatingName = 'R',
@RegionName = 'Spain'
GO

Execute PA5INSERT_tblProgram
@ProgramTitle = 'Parasite', 
@ProgramDesc = 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan',
@Runtime = 132,
@ViewCount = 20000000,
@ReleaseDate = '2019-10-05',
@Season = NULL,
@ProgramTypeName = 'Movie',
@ProgramCompanyName = 'Barunson E&A',
@AgeRatingName = 'R',
@RegionName = 'South Korea'
GO

Execute PA5INSERT_tblProgram
@ProgramTitle = 'The Vampire Diaries 2', 
@ProgramDesc = 'he second season focuses on the return of doppelgänger of Elena Gilbert, the introduction of werewolves, the sun and moon curse, and the arrival of the original vampires.',
@Runtime = NULL,
@ViewCount = NULL,
@ReleaseDate = '2010-09-09',
@Season = 2,
@ProgramTypeName = 'TV Drama',
@ProgramCompanyName = 'The CW',
@AgeRatingName = 'TV-14',
@RegionName = 'U.S'
GO


--Insert new row into Professional Table

CREATE PROCEDURE PA5INSERT_tblProfessional 
@PFname varchar(20), 
@PLname varchar(20), 
@PBirth Date,
@G_Name varchar(50)

AS 
DECLARE @G_ID INT



SET @G_ID = (SELECT GenderID FROM tblGender WHERE GenderName = @G_Name)

IF @G_ID IS NULL
	BEGIN
	PRINT 'Error present in @G_ID';
	THROW 51007, '@G_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A1
INSERT INTO tblProfessional(ProfessionalFname, ProfessionalLname, ProfessionalBirth, GenderID)
VALUES(@PFname, @PLname, @PBirth, @G_ID)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A1
ELSE
	COMMIT TRANSACTION A1
GO

Execute PA5INSERT_tblProfessional
@PFname = 'Robert',
@PLname = 'Downey Jr',
@PBirth = '1965-04-04',
@G_Name = 'Male'

Execute PA5INSERT_tblProfessional
@PFname = 'Jennifer',
@PLname = 'Lee',
@PBirth = '1971-10-22',
@G_Name = 'Female'

Execute PA5INSERT_tblProfessional
@PFname = 'Joon-ho',
@PLname = 'Bong',
@PBirth = '1969-9-14',
@G_Name = 'Male'

Execute PA5INSERT_tblProfessional
@PFname = 'Julie',
@PLname = 'Plec',
@PBirth = '1972-5-26',
@G_Name = 'Female'

Execute PA5INSERT_tblProfessional
@PFname = 'Alvaro',
@PLname = 'Morte',
@PBirth = '1975-02-23',
@G_Name = 'Male'

--Insert new row to Professional_Program_Role

CREATE PROCEDURE PA5INSERT_tblProfessional_Program_Role 
@PFname varchar(50),
@PLname varchar(50),
@PBday Date,
@RName varchar(50), 
@PTitle varchar(100)

AS 
DECLARE @Prof_ID INT, @R_ID INT, @Prog_ID INT

SET @Prof_ID = (SELECT ProfessionalID FROM tblProfessional WHERE ProfessionalFname = @PFname AND ProfessionalLname = @PLname AND ProfessionalBirth = @PBday)

IF @Prof_ID IS NULL
BEGIN
	PRINT 'Error present in @Prof_ID';
	THROW 51007, '@Prof_ID cannot be NULL; process terminated', 1;
END

SET @R_ID = (SELECT RoleID FROM tblRole WHERE Rolename = @RName)

IF @R_ID IS NULL
BEGIN
	PRINT 'Error present in @R_ID';
	THROW 51007, '@R_ID cannot be NULL; process terminated', 1;
END

SET @Prog_ID = (SELECT ProgramID FROM tblProgram WHERE ProgramTitle = @PTitle)

IF @Prog_ID IS NULL
BEGIN
	PRINT 'Error present in @Prog_ID';
	THROW 51007, '@Prog_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A2
INSERT INTO tblProfessional_Program_Role (ProgramID, ProfessionalID, RoleID)
VALUES(@Prog_ID, @Prof_ID, @R_ID)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A2
ELSE
	COMMIT TRANSACTION A2
GO

Execute PA5INSERT_tblProfessional_Program_Role 
@PFname = 'Robert',
@PLname = 'Downey Jr',
@PBday = '1965-04-04',
@RName = 'Main cast', 
@PTitle = 'Avengers: Infinity War'

Execute PA5INSERT_tblProfessional_Program_Role 
@PFname = 'Jennifer',
@PLname = 'Lee',
@PBday = '1971-10-22',
@RName = 'Director', 
@PTitle = 'Frozen 2'

Execute PA5INSERT_tblProfessional_Program_Role 
@PFname = 'Joon-ho',
@PLname = 'Bong',
@PBday = '1969-09-14',
@RName = 'Director', 
@PTitle = 'Parasite'

Execute PA5INSERT_tblProfessional_Program_Role 
@PFname = 'Julie',
@PLname = 'Plec',
@PBday = '1972-05-26',
@RName = 'Producer', 
@PTitle = 'The Vampire Diaries 2'

Execute PA5INSERT_tblProfessional_Program_Role 
@PFname = 'Álvaro',
@PLname = 'Morte',
@PBday = '1974-02-23',
@RName = 'Main cast', 
@PTitle = 'Money Heist'

-- Insert new row into member table

CREATE PROCEDURE PA5INSERT_tblMember
@MemberFname varchar(50),
@MemberLname varchar(50),
@MemberBirthDate DATE,
@GName varchar(20)
AS

DECLARE @G_ID INT

SET @G_ID = (SELECT GenderID FROM tblGender WHERE GenderName = @GName)

IF @G_ID IS NULL
BEGIN
	PRINT 'Error present in @G_ID';
	THROW 51007, '@G_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A3
INSERT INTO tblMember(MemberFname, MemberLname, MemberBirthDate, GenderID)
VALUES(@MemberFname, @MemberLname, @MemberBirthDate, @G_ID)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A3
ELSE
	COMMIT TRANSACTION A3
GO

Execute PA5INSERT_tblMember 
@MemberFname = 'John',
@MemberLname = 'Smith',
@MemberBirthDate = '1988-07-15',
@GName = 'Male'

Execute PA5INSERT_tblMember 
@MemberFname = 'Sarah',
@MemberLname = 'Bains',
@MemberBirthDate = '2000-10-11',
@GName = 'Female'

Execute PA5INSERT_tblMember 
@MemberFname = 'James',
@MemberLname = 'Kim',
@MemberBirthDate = '1967-05-31',
@GName = 'Male'

Execute PA5INSERT_tblMember 
@MemberFname = 'Seoyoung',
@MemberLname = 'Cho',
@MemberBirthDate = '2000-03-02',
@GName = 'Female'

Execute PA5INSERT_tblMember 
@MemberFname = 'Cierra',
@MemberLname = 'Vega',
@MemberBirthDate = '1993-01-17',
@GName = 'Undeclared'

Execute PA5INSERT_tblMember 
@MemberFname = 'Eric',
@MemberLname = 'White',
@MemberBirthDate = '1989-04-12',
@GName = 'Male'

Execute PA5INSERT_tblMember 
@MemberFname = 'Jessie',
@MemberLname = 'Lee',
@MemberBirthDate = '1997-07-29',
@GName = 'Female'

Execute PA5INSERT_tblMember 
@MemberFname = 'Megan',
@MemberLname = 'Wills',
@MemberBirthDate = '1987-09-14',
@GName = 'Female'

Execute PA5INSERT_tblMember 
@MemberFname = 'Peter',
@MemberLname = 'Stark',
@MemberBirthDate = '2005-11-12',
@GName = 'Male'


-- Insert new row into Subscription table

ALTER PROCEDURE PA5INSERT_tblSubscription
@SubscriptionName varchar(50),
@MemberFname varchar(50),
@MemberLname varchar(50),
@MemberBirthDate DATE,
@BeginDate DATE,
@EndDate DATE
AS

DECLARE @M_ID INT

SET @M_ID = (SELECT MemberID FROM tblMember WHERE MemberFname = @MemberFname AND MemberLname = @MemberLname AND MemberBirthDate = @MemberBirthDate)

IF @M_ID IS NULL
BEGIN
	PRINT 'Error present in @M_ID';
	THROW 51007, '@M_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A4
INSERT INTO tblSubscription(SubscriptionName, MemberID, BeginDate, EndDate)
VALUES(@SubscriptionName, @M_ID, @BeginDate, @EndDate)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A4
ELSE
	COMMIT TRANSACTION A4
GO


Execute PA5INSERT_tblSubscription 
@SubscriptionName = 'JS88@gmail.com',
@MemberFname = 'John',
@MemberLname = 'Smith',
@MemberBirthDate = '1988-07-15',
@BeginDate = '2017-03-20',
@EndDate = NULL

Execute PA5INSERT_tblSubscription
@SubscriptionName = 'SB00@gmail.com',
@MemberFname = 'Sarah',
@MemberLname = 'Bains',
@MemberBirthDate = '2000-10-11',
@BeginDate = '2019-11-02',
@EndDate = '2020-06-05'

Execute PA5INSERT_tblSubscription 
@SubscriptionName = 'JK67@yahoo.com',
@MemberFname = 'James',
@MemberLname = 'Kim',
@MemberBirthDate = '1967-05-31',
@BeginDate = '2019-07-11',
@EndDate = NULL

Execute PA5INSERT_tblSubscription 
@SubscriptionName = 'SC249@gmail.com',
@MemberFname = 'Seoyoung',
@MemberLname = 'Cho',
@MemberBirthDate = '2000-03-02',
@BeginDate = '2019-05-22',
@EndDate = NULL

Execute PA5INSERT_tblSubscription 
@SubscriptionName = 'CV93@gmail.com',
@MemberFname = 'Cierra',
@MemberLname = 'Vega',
@MemberBirthDate = '1993-01-17',
@BeginDate = '2017-08-20',
@EndDate = NULL

Execute PA5INSERT_tblSubscription
@SubscriptionName = 'EW89@gmail.com',
@MemberFname = 'Eric',
@MemberLname = 'White',
@MemberBirthDate = '1989-04-12',
@BeginDate = '2019-09-02',
@EndDate = '2020-06-05'

Execute PA5INSERT_tblSubscription
@SubscriptionName = 'JL97@gmail.com',
@MemberFname = 'Jessie',
@MemberLname = 'Lee',
@MemberBirthDate = '1997-07-29',
@BeginDate = '2018-06-10',
@EndDate = NULL

Execute PA5INSERT_tblSubscription
@SubscriptionName = 'MW87@gmail.com',
@MemberFname = 'Megan',
@MemberLname = 'Wills',
@MemberBirthDate = '1987-09-14',
@BeginDate = '2018-01-28',
@EndDate = '2020-07-06'

Execute PA5INSERT_tblSubscription
@SubscriptionName = 'PS05@gmail.com',
@MemberFname = 'Peter',
@MemberLname = 'Stark',
@MemberBirthDate = '2005-11-12',
@BeginDate = '2020-06-02',
@EndDate = NULL

--Insert new row to SubscriptionPlan table

CREATE PROCEDURE PA5INSERT_tblSubscriptionPlan
@SubsName varchar(50), 
@SubsDescr varchar(500), 
@Price decimal (6,2),
@StreamingSiteName varchar(50)

AS 
DECLARE @SS_ID INT



SET @SS_ID = (SELECT StreamingSiteID FROM tblStreamingSite WHERE StreamingSiteName = @StreamingSiteName)

IF @SS_ID IS NULL
	BEGIN
	PRINT 'Error present in @SS_ID';
	THROW 51007, '@SS_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A5
INSERT INTO tblSubscriptionPlan(SubscriptionPlanName, SubscriptionPlanDescr, Price, StreamingSiteID)
VALUES(@SubsName, @SubsDescr, @Price, @SS_ID)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A5
ELSE
	COMMIT TRANSACTION A5
GO

Execute PA5INSERT_tblSubscriptionPlan
@SubsName = 'Premium', 
@SubsDescr = 'HD video quality, up to 4 devices, downloading contents available', 
@Price = 15.99,
@StreamingSiteName = 'Netflix'

Execute PA5INSERT_tblSubscriptionPlan
@SubsName = 'Hulu', 
@SubsDescr = 'HD video quality, up to 2 devices, 6 profiles', 
@Price = 5.99,
@StreamingSiteName = 'Hulu'

Execute PA5INSERT_tblSubscriptionPlan
@SubsName = 'Disney+, Hulu, and ESPN+', 
@SubsDescr = 'Bundle and save. HD video quality, up to 4 devices, Hulu ad supported', 
@Price = 12.99,
@StreamingSiteName = 'Disney Plus'

Execute PA5INSERT_tblSubscriptionPlan
@SubsName = 'HBO Max', 
@SubsDescr = 'Stream all of HBO together with so much more. 7 day free', 
@Price = 14.99,
@StreamingSiteName = 'HBO NOW'

Execute PA5INSERT_tblSubscriptionPlan
@SubsName = 'Prime Video', 
@SubsDescr = 'Video downloads for offline viewing, 4K Ultra HD videos, Behind-the-scenes content', 
@Price = 12.99,
@StreamingSiteName = 'Amazon Prime Video'



--Insert new row into tblProgram_Genre

CREATE PROCEDURE PA5INSERT_tblProgram_Genre
@GenreName varchar(50), 
@ProgramName varchar(500)

AS 
DECLARE @P_ID INT, @GR_ID INT

SET @P_ID = (SELECT ProgramID FROM tblProgram WHERE ProgramTitle = @ProgramName)

IF @P_ID IS NULL
	BEGIN
	PRINT 'Error present in @P_ID';
	THROW 51007, '@P_ID cannot be NULL; process terminated', 1;
END

SET @GR_ID = (SELECT GenreID FROM tblGenre WHERE GenreName = @GenreName)

IF @GR_ID IS NULL
	BEGIN
	PRINT 'Error present in @GR_ID';
	THROW 51007, '@GR_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A6
INSERT INTO tblProgram_Genre(ProgramID, GenreID)
VALUES(@P_ID, @GR_ID)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A6
ELSE
	COMMIT TRANSACTION A6
GO

Execute PA5INSERT_tblProgram_Genre
@GenreName = 'Action', 
@ProgramName = 'Avengers: Infinity War'
GO

Execute PA5INSERT_tblProgram_Genre
@GenreName = 'Animation', 
@ProgramName = 'Frozen 2'
GO

Execute PA5INSERT_tblProgram_Genre
@GenreName = 'Suspense', 
@ProgramName = 'Money Heist'
GO

Execute PA5INSERT_tblProgram_Genre
@GenreName = 'Horror', 
@ProgramName = 'The Vampire Diaries 2'
GO

Execute PA5INSERT_tblProgram_Genre
@GenreName = 'Thriller', 
@ProgramName = 'Parasite'
GO

--Insert a row into Program_Keyword table

CREATE PROCEDURE PA5INSERT_tblProgram_Keyword
@KeywordName varchar(50), 
@ProgramName varchar(500)

AS 
DECLARE @P_ID INT, @K_ID INT

SET @P_ID = (SELECT ProgramID FROM tblProgram WHERE ProgramTitle = @ProgramName)

IF @P_ID IS NULL
	BEGIN
	PRINT 'Error present in @P_ID';
	THROW 51007, '@P_ID cannot be NULL; process terminated', 1;
END

SET @K_ID = (SELECT KeywordID FROM tblKeyword WHERE KeywordName = @KeywordName)

IF @K_ID IS NULL
	BEGIN
	PRINT 'Error present in @K_ID';
	THROW 51007, '@K_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A7
INSERT INTO tblProgram_Keyword(ProgramID, KeywordID)
VALUES(@P_ID, @K_ID)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A7
ELSE
	COMMIT TRANSACTION A7
GO

Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'hero', 
@ProgramName = 'Avengers: Infinity War'
GO

Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'futuristic', 
@ProgramName = 'Avengers: Infinity War'
GO

Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'time travel', 
@ProgramName = 'Avengers: Infinity War'
GO


Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'magical', 
@ProgramName = 'Frozen 2'
GO

Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'crime', 
@ProgramName = 'Money Heist'
GO

Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'humanity',
@ProgramName = 'Parasite'
GO

Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'crime',
@ProgramName = 'Parasite'
GO

Execute PA5INSERT_tblProgram_Keyword
@KeywordName = 'supernatural', 
@ProgramName = 'The Vampire Diaries 2'
GO


ALTER PROCEDURE PA5INSERT_tblProgram_StreamingSite
@SubscriptionName varchar(50), 
@ProgramName varchar(500),
@StreamingSiteName varchar(50)

AS 
DECLARE @Sub_ID INT, @P_ID INT, @St_ID INT

SET @Sub_ID = (SELECT SubscriptionID FROM tblSubscription WHERE SubscriptionName = @SubscriptionName)

IF @Sub_ID IS NULL
	BEGIN
	PRINT 'Error present in @Sub_ID';
	THROW 51007, '@Sub_ID cannot be NULL; process terminated', 1;
END

SET @P_ID = (SELECT ProgramID FROM tblProgram WHERE ProgramTitle = @ProgramName)

IF @P_ID IS NULL
	BEGIN
	PRINT 'Error present in @P_ID';
	THROW 51007, '@P_ID cannot be NULL; process terminated', 1;
END

SET @St_ID = (SELECT StreamingSiteID FROM tblStreamingSite WHERE StreamingSiteName = @StreamingSiteName)

IF @St_ID IS NULL
	BEGIN
	PRINT 'Error present in @St_ID';
	THROW 51007, '@St_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A8
INSERT INTO tblProgram_StreamingSite(SubscriptionID, ProgramID, StreamingSiteID)
VALUES(@Sub_ID, @P_ID, @St_ID)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A8
ELSE
	COMMIT TRANSACTION A8
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'JS88@gmail.com', 
@ProgramName = 'Parasite',
@StreamingSiteName = 'Netflix'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'SB00@gmail.com', 
@ProgramName = 'Parasite',
@StreamingSiteName = 'Hulu'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'JK67@yahoo.com', 
@ProgramName = 'Avengers: Infinity War',
@StreamingSiteName = 'Disney Plus'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'SC249@gmail.com', 
@ProgramName = 'Money Heist',
@StreamingSiteName = 'Netflix'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'CV93@gmail.com', 
@ProgramName = 'The Vampire Diaries 2',
@StreamingSiteName = 'HBO NOW'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'EW89@gmail.com', 
@ProgramName = 'Frozen 2',
@StreamingSiteName = 'Disney Plus'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'JL97@gmail.com', 
@ProgramName = 'Frozen 2',
@StreamingSiteName = 'Amazon Prime Video'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'MW87@gmail.com', 
@ProgramName = 'The Vampire Diaries 2',
@StreamingSiteName = 'Hulu'
GO

Execute PA5INSERT_tblProgram_StreamingSite
@SubscriptionName = 'PS05@gmail.com', 
@ProgramName = 'Avengers: Infinity War',
@StreamingSiteName = 'Netflix'
GO



ALTER PROCEDURE PA5INSERT_tblReview
@SubscriptionName varchar(50), 
@ProgramName varchar(50), 
@StreamingSiteName varchar(50),
@RatingName varchar(50),
@ReviewBody varchar(200),
@ReviewDate DATE


AS 
DECLARE @PSS_ID INT, @R_ID INT

SET @PSS_ID = (SELECT Program_StreamSiteID FROM tblProgram_StreamingSite PSS
											JOIN tblProgram P ON PSS.ProgramID = P.ProgramID
											JOIN tblSubscription S ON PSS.SubscriptionID = S.SubscriptionID
											JOIN tblStreamingSite SS ON PSS.StreamingSiteID = SS.StreamingSiteID
											WHERE ProgramTitle = @ProgramName
											AND SubscriptionName = @SubscriptionName
											AND StreamingSiteName= @StreamingSiteName)

IF @PSS_ID IS NULL
	BEGIN
	PRINT 'Error present in @PSS_ID';
	THROW 51007, '@PSS_ID cannot be NULL; process terminated', 1;
END

SET @R_ID = (SELECT RatingID FROM tblRating WHERE RatingName = @RatingName)

IF @R_ID IS NULL
	BEGIN
	PRINT 'Error present in @R_ID';
	THROW 51007, '@R_ID cannot be NULL; process terminated', 1;
END

BEGIN TRANSACTION A9
INSERT INTO tblReview(Program_StreamSiteID, RatingID, ReviewBody, ReviewDate)
VALUES(@PSS_ID, @R_ID, @ReviewBody, @ReviewDate)
IF @@ERROR <> 0
	ROLLBACK TRANSACTION A9
ELSE
	COMMIT TRANSACTION A9
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'JS88@gmail.com', 
@ProgramName = 'Parasite',
@StreamingSiteName = 'Netflix',
@RatingName = 'Somewhat Good',
@ReviewBody = 'Very interesting! Was a bit dark.',
@ReviewDate = '2019-12-19'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'SB00@gmail.com', 
@ProgramName = 'Parasite',
@StreamingSiteName = 'Hulu',
@RatingName = 'Good',
@ReviewBody = 'Wonderful movie.',
@ReviewDate = '2019-11-15'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'JK67@yahoo.com', 
@ProgramName = 'Avengers: Infinity War',
@StreamingSiteName = 'Disney Plus',
@RatingName = 'Good',
@ReviewBody = 'Had so much fun.',
@ReviewDate = '2019-11-15'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'SC249@gmail.com', 
@ProgramName = 'Money Heist',
@StreamingSiteName = 'Netflix',
@RatingName = 'Moderate',
@ReviewBody = 'Not as good as the first season',
@ReviewDate = '2020-05-04'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'CV93@gmail.com', 
@ProgramName = 'The Vampire Diaries 2',
@StreamingSiteName = 'HBO NOW',
@RatingName = 'Somewhat Bad',
@ReviewBody = 'Got bored.',
@ReviewDate = '2018-03-29'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'EW89@gmail.com', 
@ProgramName = 'Frozen 2',
@StreamingSiteName = 'Disney Plus',
@RatingName = 'Good',
@ReviewBody = 'Whole family enjoyed it',
@ReviewDate = '2019-09-03'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'JL97@gmail.com', 
@ProgramName = 'Frozen 2',
@StreamingSiteName = 'Amazon Prime Video',
@RatingName = 'Moderate',
@ReviewBody = 'Liked the songs',
@ReviewDate = '2019-12-25'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'MW87@gmail.com', 
@ProgramName = 'The Vampire Diaries 2',
@StreamingSiteName = 'Hulu',
@RatingName = 'Moderate',
@ReviewBody = 'Fun.',
@ReviewDate = '2018-01-31'
GO

Execute PA5INSERT_tblReview
@SubscriptionName = 'PS05@gmail.com', 
@ProgramName = 'Avengers: Infinity War',
@StreamingSiteName = 'Netflix',
@RatingName = 'Somewhat Bad',
@ReviewBody = 'Got shocked',
@ReviewDate = '2020-07-01'
GO



/*
constraints: 
Only people over 18 can subscribe to Disney Plus
Members under age 13 cannot write reviews on programs rated PG-13
Memebrs under age 17 cannot write reviews on programs rated R
One member cannot review the same program more than three times
Each program can't have more than 5 program keywords
Each program can't have more than 5 Genres

*/

ALTER FUNCTION fn_Over18_joinDP()
RETURNS INT
AS 
BEGIN
	DECLARE @DP INT = 0
	IF EXISTS (SELECT M.MemberID
				FROM tblMember M
				JOIN tblSubscription SM ON M.MemberID = SM.MemberID
				JOIN tblProgram_StreamingSite PSS ON SM.SubscriptionID = PSS.SubscriptionID
				JOIN tblStreamingSite SS ON PSS.StreamingSiteID = SS.StreamingSiteID
				WHERE DATEDIFF(year, M.MemberBirthdate, GETDATE()) < 18
				AND SS.StreamingSiteName = 'Disney Plus'
				)
	BEGIN
		SET @DP = 1
	END
RETURN @DP
END
GO

ALTER TABLE tblSubscription
ADD CONSTRAINT CK_Over18
CHECK (dbo.fn_Over18_joinDP() = 0)
GO


ALTER FUNCTION fn_Under13_NoRating_PG13()
RETURNS INT 
AS
BEGIN
	DECLARE @Rat13 INT = 0
	IF EXISTS (SELECT *
				FROM  tblReview R
				JOIN tblProgram_StreamingSite PS ON R.Program_StreamSiteID = PS.Program_StreamSiteID
				JOIN tblProgram P ON PS.ProgramID = P.ProgramID
				JOIN tblAgeRating A ON P.AgeRatingID = A.AgeRatingID					
				JOIN tblSubscription SM ON PS.SubscriptionID = SM.SubscriptionID
				JOIN tblMember M ON SM.MemberID = M.MemberID
				WHERE DATEDIFF(year, M.MemberBirthdate, GETDATE()) < 13
				AND A.AgeRatingName = 'PG-13'
				)
	BEGIN 
		SET @Rat13 = 1
	END
RETURN @Rat13
END
GO


ALTER TABLE tblReview
ADD CONSTRAINT CK_Under13
CHECK (dbo.fn_Under13_NoRating_PG13() = 0)
GO



ALTER FUNCTION fn_Under17_NoRating_R()
RETURNS INT 
AS
BEGIN
	DECLARE @Rat17 INT = 0
	IF EXISTS (SELECT *
				FROM  tblReview R
				JOIN tblProgram_StreamingSite PS ON R.Program_StreamSiteID = PS.Program_StreamSiteID
				JOIN tblProgram P ON PS.ProgramID = P.ProgramID
				JOIN tblAgeRating A ON P.AgeRatingID = A.AgeRatingID					
				JOIN tblSubscription SM ON PS.SubscriptionID = SM.SubscriptionID
				JOIN tblMember M ON SM.MemberID = M.MemberID
				WHERE DATEDIFF(year, M.MemberBirthdate, GETDATE()) < 17
				AND A.AgeRatingName = 'R'
				)
	BEGIN 
		SET @Rat17 = 1
	END
RETURN @Rat17
END
GO

ALTER TABLE tblReview
ADD CONSTRAINT CK_Under17
CHECK (dbo.fn_Under17_NoRating_R() = 0)
GO



CREATE FUNCTION fn_NoMore5Keywords()
RETURNS INT 
AS
BEGIN
	DECLARE @NK INT = 0
	IF EXISTS (SELECT P.ProgramID, COUNT(K.KeywordID)
				FROM tblKeyword K
					JOIN tblProgram_Keyword PK ON K.KeywordID = PK.KeywordID
					JOIN tblProgram P ON PK.ProgramID = P.ProgramID
				GROUP BY P.ProgramID
			    HAVING COUNT(K.KeywordID) > 5
				)
	BEGIN 
		SET @NK = 1
	END
RETURN @NK 
END
GO

ALTER TABLE tblProgram_Keyword
ADD CONSTRAINT CK_no5keywords
CHECK (dbo.fn_NoMore5Keywords() = 0)
Go


CREATE FUNCTION fn_NoMore5Genres()
RETURNS INT 
AS
BEGIN
	DECLARE @NG INT = 0
	IF EXISTS (SELECT P.ProgramID, COUNT(G.GenreID)
				FROM tblGenre G
					JOIN tblProgram_Genre PG ON G.GenreID = PG.GenreID
					JOIN tblProgram P ON PG.ProgramID = P.ProgramID
				GROUP BY P.ProgramID
			    HAVING COUNT(G.GenreID) > 5
				)
	BEGIN 
		SET @NG = 1
	END
RETURN @NG 
END
GO

ALTER TABLE tblProgram_Genre
ADD CONSTRAINT CK_no5Genres
CHECK (dbo.fn_NoMore5Genres() = 0)
GO



CREATE FUNCTION fn_ThreeRatingperProgram()
RETURNS INT 
AS
BEGIN
	DECLARE @OR INT = 0
	IF EXISTS (SELECT *
				FROM tblProgram P
					JOIN tblProgram_StreamingSite PS ON P.ProgramID = PS.ProgramID
					JOIN tblSubscription SM ON PS.SubscriptionID = SM.SubscriptionID
					JOIN tblMember M ON SM.MemberID = M.MemberID
					JOIN tblReview RE ON PS.Program_StreamSiteID = RE.Program_StreamSiteID
					JOIN tblRating RA ON RE.RatingID = RA.RatingID
				GROUP BY P.ProgramID
			    HAVING COUNT(*) > 3
				)
	BEGIN 
		SET @OR = 1
	END
RETURN @OR 
END
GO

ALTER TABLE tblReview
ADD CONSTRAINT CK_no3reviews
CHECK (dbo.fn_ThreeRatingperProgram() = 0)
GO



--Queries 

--View to find the average rating for the movie that is directed by Jennifer Lee
ALTER VIEW vw_action3
AS
SELECT Pr.ProfessionalID, Pr.ProfessionalFname, Pr.ProfessionalLname, Ro.Rolename, AVG(SR.StarRating) AS AvgMovieRating
FROM tblProfessional Pr
JOIN tblProfessional_Program_Role PPR ON Pr.ProfessionalID = PPR.ProfessionalID
JOIN tblRole Ro ON PPR.RoleID = Ro.RoleID
JOIN tblProgram P ON PPR.ProgramID = P.ProgramID
JOIN tblProgram_StreamingSite PSS ON P.ProgramID = PSS.ProgramID
JOIN tblReview R ON R.Program_StreamSiteID = PSS.Program_StreamSiteID
JOIN tblRating SR ON R.RatingID = SR.RatingID
GROUP BY Pr.ProfessionalID, Pr.ProfessionalFname, Pr.ProfessionalLname, Ro.Rolename
GO

SELECT *
FROM vw_action3
WHERE ProfessionalFname = 'Jennifer'
AND ProfessionalLname = 'Lee'
AND RoleName = 'director'



--Query to find the average number of subscription date for each streaming site --> longer average subscription days means more satisfied with streaming site
SELECT St.StreamingSiteID, St.StreamingSiteName, AVG((DATEDIFF(day, S.BeginDate, ISNULL(S.EndDate,GETDATE())))) AS AverageSubscriptionDays
FROM tblStreamingSite ST
JOIN tblProgram_StreamingSite PSS ON ST.StreamingSiteID = PSS.StreamingSiteID
JOIN tblSubscription S ON PSS.SubscriptionID = S.SubscriptionID
GROUP BY St.StreamingSiteID, St.StreamingSiteName
ORDER BY AverageSubscriptionDays DESC


--Query to find the comments of programs based on their review numbers
--If a program has <2 review, label as 'Experimental'
--IF a program has 2 to 4 reviews, label as 'Ordinary'
--If a program has 5+ revies, label as 'Award-winning'
SELECT A.ProgramID, A.ProgramTitle, A.ViewCount,(CASE
		WHEN numReview < 2
			THEN 'Experimental'
		WHEN numReview BETWEEN 2 AND 4
			THEN 'Ordinary'
		ELSE 'Award-winning'
		END) AS ProgramComment
FROM (SELECT P.ProgramID, P.ProgramTitle, P.ViewCount, COUNT(R.ReviewID) AS numReview
	 FROM tblProgram P
	 JOIN tblProgram_StreamingSite PSS ON P.ProgramID = PSS.ProgramID
	 JOIN tblReview R ON PSS.Program_StreamSiteID = R.Program_StreamSiteID
	 GROUP BY P.ProgramID, P.ProgramTitle, P.ViewCount) AS A
GROUP BY A.ProgramID, A.ProgramTitle, A.ViewCount, (CASE
		WHEN numReview < 2
			THEN 'Experimental'
		WHEN numReview BETWEEN 2 AND 4
			THEN 'Ordinary'
		ELSE 'Award-winning'
		END)



--Query to find a program of action genre with average rating above 3 and that have 3 keywords
SELECT P.ProgramID, P.ProgramTitle, NumKeywords, AVG(SR.StarRating) AS AverageRating
FROM (SELECT P.ProgramID, P.ProgramTitle, COUNT(K.KeywordName) AS NumKeywords
	FROM tblProgram P
	JOIN tblProgram_Keyword PK ON P.ProgramID = PK.ProgramID
	JOIN tblKeyword K ON PK.KeywordID = K.KeywordID
	JOIN tblProgram_Genre PG ON P.ProgramID = PG.ProgramID
	JOIN tblGenre G ON PG.GenreID = G.GenreID
	WHERE G.GenreName = 'action'
	GROUP BY P.ProgramID, P.ProgramTitle
	HAVING COUNT(K.KeywordName) = 3) SQ
JOIN tblProgram P ON SQ.ProgramID = P.ProgramID
JOIN tblProgram_StreamingSite PSS ON P.ProgramID = PSS.ProgramID
JOIN tblReview R ON PSS.Program_StreamSiteID = R.Program_StreamSiteID
JOIN tblRating SR ON R.RatingID = SR.RatingID
GROUP BY P.ProgramID, P.ProgramTitle, NumKeywords
HAVING AVG(SR.StarRating) >= 3


--Query to show the count of the subscriptions of each streaming site every year. --> tells the increase in subscription 
SELECT YEAR(SC.BeginDate) AS YEAR, subq1.StreamingSiteName AS StreamingSite, subq1.num_subscription As Number_subscriptions
FROM tblProgram_StreamingSite PS 
	JOIN tblStreamingSite SS ON PS.StreamingSiteID = SS.StreamingSiteID
	JOIN tblSubscription SC ON PS.SubscriptionID = SC.SubscriptionID
JOIN (SELECT SS.StreamingSiteID, SS.StreamingSiteName, COUNT(SC.SubscriptionID) AS num_subscription
		FROM tblProgram_StreamingSite PS 
		JOIN tblStreamingSite SS ON PS.StreamingSiteID = SS.StreamingSiteID
		JOIN tblSubscription SC ON PS.SubscriptionID = SC.SubscriptionID
		GROUP BY SS.StreamingSiteID, SS.StreamingSiteName) As subq1 ON SS.StreamingSiteID = subq1.StreamingSiteID
GROUP BY YEAR(SC.BeginDate), subq1.StreamingSiteName, subq1.num_subscription
ORDER BY subq1.StreamingSiteName


--Query to find the programs and the region of programs that has at least 2 keywords 
SELECT P.ProgramID, P.ProgramTitle, R.RegionName, COUNT(K.KeywordID) As num_keyword
FROM tblProgram_Keyword PK
JOIN tblProgram P ON PK.ProgramID = P.ProgramID
JOIN tblProgramType PT ON P.ProgramTypeID = PT.ProgramTypeID
JOIN tblKeyword K ON PK.KeywordID = K.KeywordID
JOIN tblRegion R ON P.RegionID = R.RegionID
WHERE PT.ProgramTypeName = 'Movie'
GROUP BY P.ProgramTitle, P.ProgramID, R.RegionName
HAVING COUNT(K.KeywordID) >= 2


-- Query to find which streamingsite has the most program with 5-star rating
SELECT TOP 1 WITH ties SS.StreamingSiteID, SS.StreamingSiteName, COUNT(subq1.ProgramID) AS num_program, COUNT(subq1.num_ratings) AS num_rating
FROM tblReview RV
JOIN tblRating RT ON RV.RatingID = RT.RatingID
JOIN tblProgram_StreamingSite PS ON RV.Program_StreamSiteID = PS.Program_StreamSiteID
JOIN tblProgram P ON PS.ProgramID = P.ProgramID
JOIN tblStreamingSite SS ON PS.StreamingSiteID = SS.StreamingSiteID
JOIN
	(SELECT P.ProgramID, COUNT(RT.RatingID) As num_ratings
	FROM tblReview RV
	JOIN tblRating RT ON RV.RatingID = RT.RatingID
	JOIN tblProgram_StreamingSite PS ON RV.Program_StreamSiteID = PS.Program_StreamSiteID
	JOIN tblProgram P ON PS.ProgramID = P.ProgramID
	JOIN tblStreamingSite SS ON PS.StreamingSiteID = SS.StreamingSiteID
	WHERE RT.StarRating = 5
	GROUP BY P.ProgramID) AS subq1 ON P.ProgramID = subq1.ProgramID
GROUP BY SS.StreamingSiteID, SS.StreamingSiteName
ORDER BY COUNT(subq1.ProgramID) DESC




--Query to find the least searched keyword for the program that was released in the past year
SELECT TOP 1 K.KeywordID, K.KeywordName, Count(DISTINCT K.KeywordID) AS Freq_Keyword
FROM tblProgram P
JOIN tblProgram_Keyword PK ON P.ProgramID = PK.ProgramID
JOIN tblKeyword K ON PK.KeywordID = K.KeywordID
WHERE P.ReleaseDate < DateAdd(year, -1, GetDate())
GROUP BY K.KeywordID, K.KeywordName
ORDER BY Freq_Keyword DESC



/*
BACKUP DATABASE Proj_A5 TO DISK = 'C:\SQL\INFO330_Proj_A5.bak'
WITH DIFFERENTIAL
*/