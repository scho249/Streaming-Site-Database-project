CREATE TABLE tblStreamingSite
(StreamingSiteID INTEGER IDENTITY(1,1) primary key,
StreamingSiteName varchar(50) NOT NULL,
StreamingSiteDescr varchar(500) NULL)
GO

CREATE TABLE tblSubscriptionPlan
(SubsciptionPlanID INTEGER IDENTITY(1,1) primary key,
StreamingSiteID INTEGER NOT NULL, 
Price FLOAT NOT NULL,
SubsciptionPlanName varchar(50) NOT NULL,
SubsciptionPlanDescr varchar(500) NULL)
GO

CREATE TABLE tblProgram_StreamingSite
(Program_StreamSiteID INTEGER IDENTITY(1,1) primary key,
ProgramID INTEGER NOT NULL,
BeginDate DATE NOT NULL,
EndDate DATE NOT NULL)
GO

CREATE TABLE tblProgramType
(ProgramTypeID INTEGER IDENTITY(1,1) primary key,
ProgramTypeName varchar(50) NOT NULL,
ProgramTypeDescr varchar(500) NULL)
GO

ALTER TABLE tblSubscriptionPlan
ADD CONSTRAINT FK_tblSubscription_StreamingSiteID
FOREIGN KEY (StreamingSiteID) REFERENCES tblStreamingSite(StreamingSiteID)

ALTER TABLE tblProgram_StreamingSite
ADD CONSTRAINT FK_tblProgram_StreamingSite_ProgramID
FOREIGN KEY (ProgramID) REFERENCES tblProgram(ProgramID)