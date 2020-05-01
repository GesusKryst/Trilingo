
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
    AccID CHAR(4) NOT NULL,
    YearJoined INT NOT NULL,
    Email VARCHAR(50) NOT NULL,
    TimeOnPlatform INT,
    AccountLevel CHAR(4) NOT NULL,
    PRIMARY KEY (AccID),
    FOREIGN KEY (AccountLevel) REFERENCES accountLevel(LevelID)
);


CREATE TABLE person(
    PersonID CHAR(4) NOT NULL,
    PersonName VARCHAR(25) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    SkillLevel INT NOT NULL,
    TownID CHAR(4) NOT NULL,
    TeachesPersonID CHAR(4),
    MeetingID CHAR(4) NOT NULL,
    LanguageID CHAR(4) NOT NULL,
    AccID CHAR(4) NOT NULL,
    PRIMARY KEY (PersonID),
    UNIQUE (Email),
    FOREIGN KEY (TownID) REFERENCES town(TownID),
    FOREIGN KEY (TeachesPersonID) REFERENCES person(PersonID),
    FOREIGN KEY (MeetingID) REFERENCES meetingSchedule(MeetingID),
    FOREIGN KEY (LanguageID) REFERENCES aLanguage(LanguageID)
);



-- Sample Data

-- Country Data
INSERT INTO country VALUES ("C001", "United States");

-- State Data
INSERT INTO aState VALUES ("S001", "Arizona");
INSERT INTO aState VALUES ("S002", "Utah");
INSERT INTO aState VALUES ("S003", "Nevada");

-- Town Data
INSERT INTO town VALUES ("T001", "Phoenix", "S001", "C001");
INSERT INTO town VALUES ("T002", "Flagstaff", "S001", "C001");
INSERT INTO town VALUES ("T011", "Salt Lake City", "S002", "C001");
INSERT INTO town VALUES ("T012", "Provo", "S002", "C001");
INSERT INTO town VALUES ("T021", "Reno", "S003", "C001");
INSERT INTO town VALUES ("T022", "Las Vegas", "S003", "C001");

-- Meeting Schedule Data
INSERT INTO meetingSchedule VALUES ("M001", "Starbucks", "03/21/2020");
INSERT INTO meetingSchedule VALUES ("M002", "Cline Library", "06/10/2020");
INSERT INTO meetingSchedule VALUES ("M003", "Green Park", "01/30/2020");

-- Language Data
INSERT INTO aLanguage VALUES ("L001", "English", "One");
INSERT INTO aLanguage VALUES ("L002", "Spanish", "Two");
INSERT INTO aLanguage VALUES ("L003", "French", "Three");

-- Account Level Data
INSERT INTO accountLevel VALUES ("AL01", "Beginner");
INSERT INTO accountLevel VALUES ("AL02", "Intermediate");
INSERT INTO accountLevel VALUES ("AL03", "Advanced");

-- Account Data
INSERT INTO account VALUES ("AC01", 2016, "JohnnyB@aol.com", NULL, "AL01");
INSERT INTO account VALUES ("AC02", 2015, "SoarAbove1962@hotmail.com", 75, "AL02");
INSERT INTO account VALUES ("AC03", 2017, "hahaYes@gmail.com", 100, "AL03" );

-- Person Data
INSERT INTO person VALUES ("P001", "Johnny Bravo", "JohnnyB@aol.com", 1, "T001", NULL, "M001", "L001", "AC01");
INSERT INTO person VALUES ("P002", "Steven Segal", "SoarAbovie1962@hotmail.com", 2, "T002", "P001", "M002", "L002", "AC02");
INSERT INTO person VALUES ("P003", "Lenny Kravitz", "hahaYes@gmail.com", 3, "T003", NULL, "M003", "L003", "AC03");