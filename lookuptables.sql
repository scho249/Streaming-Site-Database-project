--populating look-up tables

USE Proj_A5

INSERT INTO tblGender (GenderName, GenderDescr)
VALUES ('Male', 'he/him'), ('Female', 'she/her'), ('Undeclared', 'Prefer not to declare')
GO


INSERT INTO tblRating (RatingName, StarRating, StarRatingDescr)
VALUES ('Bad', 1, 'Not satisfied with what watched'), ('Somewhat Bad', 2, 'Somewhat not satisfied' ), ('Moderate', 3, 'Neither satisfed or not satisfied'), ('Somewhat Good', 4, 'Somewhat satisfied'), ('Good', 5, 'Satisfied with what watched')
GO



INSERT INTO tblStreamingSite (StreamingSiteName, StreamingSiteDescr)
VALUES ('Netflix', 'The leading streaming entertainment service, streaming movies and telvision shows'), ('Hulu', 'The leading premium streaming service offering live and on-demand TV and movies'), ('Amazon Prime Video', 'Internet video streaming service by Amazon.'), ('Disney Plus', 'Streaming service with a growing collection of movies and shows from Disney, Pixar, Marvel, etc.' ), ('HBO NOW', 'Stand-alone streaming service with access to HBO original series, movies, etc.')
GO



INSERT INTO tblProgramCompany (ProgramCompanyName, ProgramCompanyDescr)
VALUES ('20th Century Studios', 'American film studio that is a division of The Walt Disney Company'), ('Warner Bros', 'Warner Brothers provides video based entertainment services'), ('Paramount Pictures', 'The fifth oldest company that features film production and distribution'), ('Universal Pictures', 'Americal film studio owned by Comcast and is one of Hollywood Big Six film')
GO
INSERT INTO tblProgramCompany (ProgramCompanyName, ProgramCompanyDescr)
VALUES ('Marvel Studios', 'a subsidiary of The Walt Disney Studios. Marvel Studios is known for the production of the Marvel Cinematic Universe films')
GO
INSERT INTO tblProgramCompany (ProgramCompanyName, ProgramCompanyDescr)
VALUES ('The Walt Disney Pictures', 'Walt Disney Pictures is an American film studio and a subsidiary of The Walt Disney Studios, which is owned by The Walt Disney Company. '), ('Netflix Originals', 'Netflix, Inc. is an American media-services provider and production company')
GO
INSERT INTO tblProgramCompany (ProgramCompanyName, ProgramCompanyDescr)
VALUES('Barunson E&A', 'A South Korea production company that designs and develops online and mobile games'), ('The CW', 'American English-language free-to-air television network that is operated by The CW Network, LLC')
GO



INSERT INTO tblGenre (GenreName, GenreDescr)
VALUES ('Romance', 'love story'), ('Horror', 'scary, jump-scares'), ('Action', 'Exciting'), ('Comedy', 'funny, humor'), ('Animation', 'moving image')
GO
INSERT INTO tblGenre (GenreName, GenreDescr)
VALUES ('Suspense', 'uncertainty'), ('Thriller', 'fiction, having numerous, often overlapping subgenres')
GO




INSERT INTO tblKeyword (KeywordName, KeywordDescr)
VALUES ('Fairy tale', 'fairy tale programs'), ('dystopia', 'theme of dystopia, disastrous'), ('time travel', 'characters traveling in time'), ('futuristic', 'setting in the future')
GO
INSERT INTO tblKeyword (KeywordName, KeywordDescr)
VALUES ('Magical', 'something magical'), ('crime' ,'anything unethical'), ('hero', 'having super powers'), ('humanity', 'human virtual and deep meanings'), ('Supernatural', 'beyond human understanding of nature')
GO



INSERT INTO tblAgeRating (AgeRatingName, AgeRange, AgeRatingDesc)
VALUES ('G', 'All ages' ,'General audiences'), ('PG', 'All age' , 'Parental guidance suggested'), ('PG-13', 'Above 13', 'Some material may be inappropriate for children under 13'), ('R', 'Above 17', 'Restricted; Under 17 requires adult guardian')
GO
INSERT INTO tblAgeRating (AgeRatingName, AgeRange, AgeRatingDesc)
VALUES ('TV-14', 'Above 14', 'Content may be inappropriate for children younger than 14 years of age')
GO


INSERT INTO tblRegion (RegionName, RegionDescr)
VALUES ('U.S', 'North America'), ('France', 'Europe'), ('UK', 'Europe'), ('China', 'Asia'), ('India', 'Asia')
GO
INSERT INTO tblRegion (RegionName, RegionDescr)
VALUES ('Spain', 'Europe'), ('South Korea', 'Asia')
GO


INSERT INTO tblProgramType (ProgramTypeName, ProgramTypeDescr)
VALUES ('Movie', 'shown in a theater or on television'), ('TV Drama', 'Shows that run in series, shown on television'), ('TV Comedy Show', 'Comical shows on TV'), ('Documentary', 'Non-fictional film showing real events')
GO


INSERT INTO tblRole (Rolename, RoleDescr)
VALUES ('Director', 'In charge of shooting/assembly of program'), ('Screenwriter', 'In charge of script writing'), ('Main cast', 'Portraying main character'), ('Cameo', 'Brief appearance')
GO
INSERT INTO tblRole (Rolename, RoleDescr)
VALUES ('Produce', 'a person who oversees film production')
GO

