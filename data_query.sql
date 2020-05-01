/* Report 1 */
SELECT s.personname AS student, t.personname AS teacher, meetingloc, meetdate 
FROM person s, person t, meetingschedule
WHERE t.meetingid = s.meetingid AND MONTH(meetdate) = MONTH(CURDATE())
ORDER BY s.meetingid;

/* Report 2 */
SELECT usr.personname, twn.townname, acct.accountlevel, acct.yearjoined, acct.email, acct.timeonplatform
FROM person usr, town twn, account acct
WHERE usr.accid = acct.accid AND acct.timeonplatform > 365
ORDER BY acct.timeonplatform;