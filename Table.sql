
CREATE TABLE country (
    CountryID CHAR(4) NOT NULL,
    CountryName VARCHAR(25) NOT NULL,
    PRIMARY KEY (CountryID)
);


CREATE TABLE aState (
    StateID CHAR(4) NOT NULL,
    StateName VARCHAR(25) NOT NULL,
    PRIMARY KEY (StateID)
);


CREATE TABLE town (
    TownID CHAR(4) NOT NULL,
    TownName VARCHAR(25) NOT NULL,
    -- Foreign Keys
    StateID CHAR(4) NOT NULL,
    CountryID CHAR(4) NOT NULL,
    PRIMARY KEY (TownID),
    FOREIGN KEY (StateID) REFERENCES aState(StateID),
    FOREIGN KEY (CountryID) REFERENCES country(CountryID)
);


CREATE TABLE meetingSchedule (
    MeetID CHAR(4) NOT NULL,
    MeetingLoc VARCHAR(50) NOT NULL,
    MeetDate DATE NOT NULL,
    PRIMARY KEY (MeetID)
);


CREATE TABLE aLanguage(
    LanguageID CHAR(4) NOT NULL,
    LanguageName VARCHAR(25) NOT NULL,
    Category VARCHAR(25) NOT NULL,
    PRIMARY KEY (LanguageID)
);


CREATE TABLE accountLevel(
    LevelID CHAR(4) NOT NULL,
    LevelName VARCHAR(25) NOT NULL,
    PRIMARY KEY (LevelID)
);


CREATE TABLE account(
    AccID INT NOT NULL,
    YearJoined INT NOT NULL,
    Email VARCHAR(50) NOT NULL,
    TimeOnPlatform INT,
    -- Foreign Key
    AccountLevel CHAR(4) NOT NULL,
    PRIMARY KEY (AccID),
    FOREIGN KEY (AccountLevel) REFERENCES accountLevel(LevelID)
);


CREATE TABLE person(
    PersonID CHAR(4) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    SkillLevel INT NOT NULL,
    -- Foreign Keys
    TownID CHAR(4) NOT NULL,
    TeachesPersonID CHAR(4),
    MeetingID CHAR(4) NOT NULL,
    LanguageID CHAR(4) NOT NULL,
    AccID INT NOT NULL,
    PRIMARY KEY (PersonID),
    UNIQUE (Email),
    FOREIGN KEY (TownID) REFERENCES town(TownID),
    FOREIGN KEY (TeachesPersonID) REFERENCES person(PersonID),
    FOREIGN KEY (MeetingID) REFERENCES meetingSchedule(MeetingID),
    FOREIGN KEY (LanguageID) REFERENCES aLanguage(LanguageID)
);
