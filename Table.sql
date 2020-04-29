/*
Country
- CountryID = Primary
- CountryName
*/

/*
Town
- TownID = Primary
- TownName
> Located in Country
> Located in State
*/

/*
State
- StateID = Primary
- StateName
*/

/*
MeetingSchedule
- MeetID = Primary
- MeetingLoc
- Date
*/

/*
Language
- LangID = Primary
- LangName
- Category
*/

/*
Account
- AccID = Primary
- YearJoined
- Email
- TimeOnPlatform (O)
> Is of Account Level
*/

/*
AccountLevel
- LevelID = Primary
- LevelName
*/

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
