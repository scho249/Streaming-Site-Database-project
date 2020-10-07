/*
CREATE DATABASE Proj_A5
GO
*/

USE Proj_A5

CREATE TABLE tblProgram
(ProgramID INTEGER IDENTITY(1,1) primary key, 
 
ProgramTypeID INTEGER NOT NULL, 
ProgramCompanyID INTEGER NOT NULL, 
AgeRatingID INTEGER NOT NULL, 
RegionID INTEGER NOT NULL, 
ProgramTitle varchar(100) NOT NULL,
ProgramDesc varchar(500) NOT NULL, 
Runtime INTEGER NULL,
Season INTEGER NULL,
ViewCount INTEGER NULL, 
ReleaseDate Date NOT NULL)
GO



CREATE TABLE tblProfessional_Program_Role
(Professional_Program_RoldID INTEGER IDENTITY(1,1) primary key, 
ProgramID INTEGER NOT NULL, 
ProfessionalID INTEGER NOT NULL, 
RoleID INTEGER NOT NULL)
GO



CREATE TABLE tblProfessional
(ProfessionalID INTEGER IDENTITY(1,1) primary key,
GenderID INTEGER NOT NULL,
ProfessionalFname varchar(20) NOT NULL,
ProfessionalLname varchar(20) NOT NULL,
ProfessionalBirth Date NOT NULL)
GO



CREATE TABLE tblRole
(RoleID INTEGER IDENTITY(1,1) primary key, 
Rolename varchar(50) NOT NULL,
RoleDescr varchar(500) NULL)
GO


CREATE TABLE tblKeyword
(KeywordID INTEGER IDENTITY(1,1) primary key, 
KeywordName varchar(50) NOT NULL,
KeywordDescr varchar(500) NULL)
GO


CREATE TABLE tblProgram_Keyword
(Program_KeywordD INT IDENTITY(1,1) primary key, 
ProgramID INTEGER NOT NULL,
KeywordID INTEGER NOT NULL)
GO


CREATE TABLE tblGenre
(GenreID INTEGER IDENTITY(1,1) primary key, 
GenreName varchar(50) NOT NULL,
GenreDescr varchar(500) NULL)
GO

CREATE TABLE tblProgram_Genre
(Program_GenreID INT IDENTITY(1,1) primary key, 
ProgramID INTEGER NOT NULL,
GenreID INTEGER  NOT NULL)
GO



CREATE TABLE tblProgramCompany
(ProgramCompanyID INTEGER IDENTITY(1,1) primary key, 
ProgramCompanyName varchar(50) NOT NULL,
ProgramCompanyDescr varchar(500) NULL)
GO


CREATE TABLE tblStreamingSite
(StreamingSiteID INTEGER IDENTITY(1,1) primary key,
StreamingSiteName varchar(50) NOT NULL,
StreamingSiteDescr varchar(500) NULL)
GO



CREATE TABLE tblSubscriptionPlan
(SubscriptionPlanID INTEGER IDENTITY(1,1) primary key,
StreamingSiteID INTEGER NOT NULL, 
Price DECIMAL(6,2) NOT NULL,
SubscriptionPlanName varchar(50) NOT NULL,
SubscriptionPlanDescr varchar(500) NULL)
GO


CREATE TABLE tblProgram_StreamingSite
(Program_StreamSiteID INTEGER IDENTITY(1,1) primary key,
ProgramID INTEGER NOT NULL,
SubscriptionID INTEGER NOT NULL,
StreamingSiteID INTEGER NOT NULL)
GO



CREATE TABLE tblProgramType
(ProgramTypeID INTEGER IDENTITY(1,1) primary key,
ProgramTypeName varchar(50) NOT NULL,
ProgramTypeDescr varchar(500) NULL)
GO

CREATE TABLE tblRegion
(RegionID INTEGER IDENTITY(1,1) primary key,
RegionName varchar(50) NOT NULL,
RegionDescr varchar(500) NULL)
GO

CREATE TABLE tblGender
(GenderID INTEGER IDENTITY(1,1) primary key,
GenderName varchar(50) NOT NULL,
GenderDescr varchar(500) NULL)
GO

CREATE TABLE tblMember
(MemberID INTEGER IDENTITY(1,1) primary key,
GenderID INTEGER NOT NULL,
MemberFName varchar(50) NOT NULL,
MemberLName varchar(50) NOT NULL,
MemberBirthdate Date NOT NULL)
GO



CREATE TABLE tblSubscription
(SubscriptionID INTEGER IDENTITY(1,1) primary key,
SubscriptionName varchar(20) NOT NULL,
MemberID INTEGER NOT NULL, 
BeginDate DATE NULL,
EndDate DATE NULL)
GO



CREATE TABLE tblReview
(ReviewID INTEGER IDENTITY(1,1) primary key,
RatingID INTEGER NOT NULL,
Program_StreamSiteID INTEGER NOT NULL,
ReviewBody varchar(500) NULL,
ReviewDate Date NOT NULL)
GO


CREATE TABLE tblRating
(RatingID INTEGER IDENTITY(1,1) primary key,
RatingName varchar(20) NOT NULL,
StarRating INTEGER NOT NULL,
StarRatingDescr varchar(50) NULL)
GO


CREATE TABLE tblAgeRating
(AgeRatingID INTEGER IDENTITY(1,1) primary key,
AgeRatingName varchar(50) NOT NULL,
AgeRange varchar(20) NOT NULL, 
AgeRatingDesc varchar(500) NULL)
GO


--End of script Alter table

ALTER TABLE tblProgram                 
ADD CONSTRAINT FK_tblProgram_ProgramTypeID
FOREIGN KEY (ProgramTypeID) REFERENCES tblProgramType(ProgramTypeID)
GO

ALTER TABLE tblProgram                 
ADD CONSTRAINT FK_tblProgram_ProgramCompanyID
FOREIGN KEY (ProgramCompanyID) REFERENCES tblProgramCompany(ProgramCompanyID)
GO

ALTER TABLE tblProgram                 
ADD CONSTRAINT FK_tblProgram_AgeRatingID
FOREIGN KEY (AgeRatingID) REFERENCES tblAgeRating(AgeRatingID)
GO

ALTER TABLE tblProgram                 
ADD CONSTRAINT FK_tblProgram_RegionID
FOREIGN KEY (RegionID) REFERENCES tblRegion(RegionID)
GO

ALTER TABLE tblProfessional                 
ADD CONSTRAINT FK_tblProfessional_GenderID
FOREIGN KEY (GenderID) REFERENCES tblGender(GenderID)
GO

ALTER TABLE tblProgram_Keyword
ADD CONSTRAINT FK_tblProgram_Keyword_PrgoramID
FOREIGN KEY (ProgramID) REFERENCES tblProgram(ProgramID)
GO

ALTER TABLE tblProgram_Keyword
ADD CONSTRAINT FK_tblProgram_Keyword_GenreID
FOREIGN KEY (KeywordID) REFERENCES tblKeyword(KeywordID)
GO

ALTER TABLE tblProgram_Genre
ADD CONSTRAINT FK_tblProgram_Genre_PrgoramID
FOREIGN KEY (ProgramID) REFERENCES tblProgram(ProgramID)
GO

ALTER TABLE tblProgram_Genre
ADD CONSTRAINT FK_tblProgram_Genre_GenreID
FOREIGN KEY (GenreID) REFERENCES tblGenre(GenreID)
GO

ALTER TABLE tblReview
ADD CONSTRAINT FK_tblReview_RatingID
FOREIGN KEY (RatingID) REFERENCES tblRating(RatingID)
GO 

ALTER TABLE tblReview
ADD CONSTRAINT FK_tblReview_Program_StreamSiteID		 
FOREIGN KEY (Program_StreamSiteID) REFERENCES tblProgram_StreamingSite(Program_StreamSiteID)
GO

ALTER TABLE tblSubscriptionPlan
ADD CONSTRAINT FK_tblSubscription_StreamingSiteID
FOREIGN KEY (StreamingSiteID) REFERENCES tblStreamingSite(StreamingSiteID)



ALTER TABLE tblProgram_StreamingSite
ADD CONSTRAINT FK_tblProgram_StreamingSite_ProgramID
FOREIGN KEY (ProgramID) REFERENCES tblProgram(ProgramID)


ALTER TABLE tblProgram_StreamingSite
ADD CONSTRAINT FK_tblProgram_StreamingSite_SubscriptionID
FOREIGN KEY (SubscriptionID) REFERENCES tblSubscription(SubscriptionID)
GO

ALTER TABLE tblProgram_StreamingSite
ADD CONSTRAINT FK_tblProgram_StreamingSite_StreamingSiteID
FOREIGN KEY (StreamingSiteID) REFERENCES tblStreamingSite(StreamingSiteID)
GO



ALTER TABLE tblSubscription
ADD CONSTRAINT FK_tblSubscription_MemberID
FOREIGN KEY (MemberID) REFERENCES tblMember(MemberID)
GO 


ALTER TABLE tblMember
ADD CONSTRAINT FK_tblMember_GenderID
FOREIGN KEY (GenderID) REFERENCES tblGender(GenderID)
GO 
 

ALTER TABLE tblProfessional_Program_Role                 
ADD CONSTRAINT FK_tblProfessional_Program_Role_RoleID
FOREIGN KEY (RoleID) REFERENCES tblRole(RoleID)
GO

ALTER TABLE tblProfessional_Program_Role                 
ADD CONSTRAINT FK_tblProfessional_Program_Role_ProfessionalID
FOREIGN KEY (ProfessionalID) REFERENCES tblProfessional(ProfessionalID)
GO

ALTER TABLE tblProfessional_Program_Role                 
ADD CONSTRAINT FK_tblProfessional_Program_Role_ProgramID
FOREIGN KEY (ProgramID) REFERENCES tblProgram(ProgramID)
GO




--BACKUP DATABASE Proj_A5 TO DISK = 'C:\SQL\INFO330_Proj_A5.bak'
