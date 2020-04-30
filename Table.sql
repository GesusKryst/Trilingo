/*
Country
- CountryID = Primary
- CountryName
*/
CREATE TABLE country (
    CountryID CHAR(4) NOT NULL,
    CountryName VARCHAR(25) NOT NULL,
    PRIMARY KEY (CountryID)
);

/*
State
- StateID = Primary
- StateName
*/
CREATE TABLE aState (
    StateID CHAR(4) NOT NULL,
    StateName VARCHAR(25) NOT NULL,
    PRIMARY KEY (StateID)
);

/*
Town
- TownID = Primary
- TownName
> Located in Country
> Located in State
*/
CREATE TABLE town (
    TownID CHAR(4) NOT NULL,
    TownName VARCHAR(25) NOT NULL,
    PRIMARY KEY (TownID),
    -- Foreign Keys
    StateID CHAR(4) NOT NULL,
    CountryID CHAR(4) NOT NULL,
    FOREIGN KEY (StateID) REFERENCES aState(StateID),
    FOREIGN KEY (CountryID) REFERENCES country(CountryID)
);

/*
MeetingSchedule
- MeetID = Primary
- MeetingLoc
- Date
*/
CREATE TABLE meetingSchedule (
    MeetID CHAR(4) NOT NULL,
    MeetingLoc VARCHAR(50) NOT NULL,
    MeetDate DATE NOT NULL,
    PRIMARY KEY (MeetID)
);

/*
Language
- LangID = Primary
- LangName
- Category
*/
CREATE TABLE aLanguage(
    LanguageID CHAR(4) NOT NULL,
    LanguageName VARCHAR(25) NOT NULL,
    Category VARCHAR(25) NOT NULL,
    PRIMARY KEY (LanguageID)
);

/*
AccountLevel
- LevelID = Primary
- LevelName
*/
CREATE TABLE accountLevel(
    LevelID CHAR(4) NOT NULL,
    LevelName VARCHAR(25) NOT NULL,
    PRIMARY KEY (LevelID)
);

/*
Account
- AccID = Primary
- YearJoined
- Email
- TimeOnPlatform (O)
> Is of Account Level
*/
CREATE TABLE account(
    AccID INT NOT NULL,
    YearJoined INT NOT NULL,
    Email VARCHAR(50) NOT NULL,
    TimeOnPlatform INT,
    PRIMARY KEY (AccID),
    -- Foreign Key
    AccountLevel CHAR(4) NOT NULL,
    FOREIGN KEY (AccountLevel) REFERENCES accountLevel(LevelID)
);


/*
Person
- PersonID = Primary
- Email
- SkillLevel
> Lives in Town
> Teaches Person
> Has Meetings
> Speaks Language
> Owns Account
*/
CREATE TABLE person(
    PersonID CHAR(4) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    UNIQUE (Email),
    SkillLevel INT NOT NULL,
    PRIMARY KEY (PersonID),
    -- Foreign Keys
    TownID CHAR(4) NOT NULL,
    TeachesPersonID CHAR(4),
    MeetingID CHAR(4) NOT NULL,
    LanguageID CHAR(4) NOT NULL,
    AccID INT NOT NULL,
    FOREIGN KEY (TownID) REFERENCES town(TownID),
    FOREIGN KEY (TeachesPersonID) REFERENCES person(PersonID),
    FOREIGN KEY (MeetingID) REFERENCES meetingSchedule(MeetingID),
    FOREIGN KEY (LanguageID) REFERENCES aLanguage(LanguageID)
);
