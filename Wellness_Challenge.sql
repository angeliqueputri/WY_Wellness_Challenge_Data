--Wellness Challenge
USE Wellness_Challenge_2022_WY
GO

SELECT *
FROM Scorepoints_Wellness_Challenge

--Setting null values to 0
UPDATE [Scorepoints_Wellness_Challenge]
SET [IdeaPoints]=0, [Week1] = 0, [Week2]=0, [Week3]=0, [Week4]=0, [Week5]=0, [Week6]=0,
    [Week7]=0, [Week8]=0, [Week9]=0, [Week10]=0, [Week11]=0, [Week12]=0
WHERE [IdeaPoints] IS NULL OR [Week1] IS NULL OR [Week2] IS NULL OR [Week3] IS NULL
    OR [Week4] IS NULL OR [Week5] IS NULL OR [Week6] IS NULL OR [Week7] IS NULL OR [Week8] IS NULL
    OR [Week9] IS NULL OR [Week10] IS NULL OR [Week11] IS NULL OR [Week12] IS NULL;

--find number of people playing in each team

SELECT Team, COUNT(*) AS People_Per_Team
FROM Scorepoints_Wellness_Challenge
GROUP BY Team

--find names of people who did not submit ideas 
SELECT Name, Team, IdeaPoints
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints = '0'

--find how many people in both teams did not submit any ideas
SELECT COUNT(Name) AS No_Ideas_Submitted
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints = '0' AND (Team = 'SAP' OR Team = 'CIB')

--find how many people in CIB didn't get idea points
SELECT COUNT(Name) AS No_Ideas_Submitted_CIB
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints = '0' AND Team = 'CIB'

--find how many people in SAP didn't get idea points
SELECT COUNT(Name) AS No_Ideas_Submitted_SAP
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints = '0' AND Team = 'SAP'

--find how many people DID submit ideas
SELECT COUNT(Name) AS Submitted_Ideas
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints != '0' AND (Team = 'SAP' OR Team = 'CIB')

--find out how many people from CIB submitted ideas
SELECT COUNT(Name) AS Submitted_Ideas_CIB
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints != '0' AND Team = 'CIB'

--find out how many people from SAP submitted ideas
SELECT COUNT(Name) AS Submitted_Ideas_SAP
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints != '0' AND Team = 'SAP'


--find out quantity of people who got the most and least idea points
SELECT IdeaPoints, Team, COUNT(Name) AS Most_And_Least
FROM Scorepoints_Wellness_Challenge
GROUP BY IdeaPoints, Team

--find out which team had the most points 
SELECT Team, SUM(Score) AS Total_Scores_By_Team
FROM Scorepoints_Wellness_Challenge
GROUP BY Team

-----------------------------
-----------WEEK 1------------
-----------------------------

--find how many people participated in week 1
SELECT COUNT(Week1) AS Week1_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week1 != '0' 

--find out how manhy points most people scored on week 1
SELECT Week1, COUNT(*) AS Week1_MaxPoints
FROM Scorepoints_Wellness_Challenge
GROUP BY Week1

--find which team participated most in week 1
SELECT COUNT(Week1) AS Team_Most_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week1 != '0' AND Team = 'CIB'

SELECT COUNT(Week1) AS Team_Most_ParticipationS
FROM Scorepoints_Wellness_Challenge
WHERE Week1 != '0' AND Team = 'SAP'

-----------------------------
-----------WEEK 2------------
-----------------------------

--find how many people participated in week 2
SELECT COUNT(Week2) AS Week2_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week2 != '0'

--find out how manhy points most people scored on week 2
SELECT Week2, COUNT(*) AS Week2_MaxPoints
FROM Scorepoints_Wellness_Challenge
GROUP BY Week2

-----------------------------
-----------WEEK 3------------
-----------------------------

--find how many people participated in week 3
SELECT COUNT(Week3) AS Week3_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week3 != '0'

--find out how manhy points most people scored on week 3
SELECT Week3, COUNT(*) AS Week3_MaxPoints
FROM Scorepoints_Wellness_Challenge
GROUP BY Week3

-----------------------------
-----------WEEK 4------------
-----------------------------

--find how many people participated in week 4
SELECT COUNT(Week4) AS Week4_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week4 != '0'

--find out how manhy points most people scored on week 4
SELECT Week4, COUNT(*) AS Week4_MaxPoints
FROM Scorepoints_Wellness_Challenge
GROUP BY Week4

-----------------------------
-----------WEEK 5------------
-----------------------------

--find how many people participated in week 5
SELECT COUNT(Week5) AS Week5_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week5 != '0'

--find out how manhy points most people scored on week 5
SELECT Week5, COUNT(*) AS Week5_MaxPoints
FROM Scorepoints_Wellness_Challenge
GROUP BY Week5

-----------------------------
-----------WEEK 6------------
-----------------------------

--find how many people participated in week 6
SELECT COUNT(Week6) AS Week6_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week6 != '0'

--find out how manhy points most people scored on week 6
SELECT Week6, COUNT(*) AS Week6_MaxPoints
FROM Scorepoints_Wellness_Challenge
GROUP BY Week6


-----------------------------
-----------WEEK 7------------
-----------------------------

--find how many people participated in week 7
SELECT COUNT(Week7) AS Week7_Participation
FROM Scorepoints_Wellness_Challenge
WHERE Week6 != '0'

--find out how manhy points most people scored on week 7
SELECT Week7, COUNT(*) AS Week7_MaxPoints
FROM Scorepoints_Wellness_Challenge
GROUP BY Week7 

----count the total rows in the table, along with showing how many patients are in each state in ascending order
--find number of patients per state in ascending order



--SELECT PatientState, COUNT (*) AS Patient_Per_State
--from TestTable
--GROUP BY PatientState
--ORDER BY PatientState ASC

ALTER TABLE Scorepoints_Wellness_Challenge 
ADD Committee_Member VARCHAR(25)

ALTER TABLE Scorepoints_Wellness_Challenge 
DROP COLUMN Participation_Amount 



UPDATE [Scorepoints_Wellness_Challenge]
SET [Committee_Member]= 'No'
WHERE [Committee_Member] IS NULL; 

UPDATE [Scorepoints_Wellness_Challenge]
SET [Committee_Member]= 'Yes'
WHERE [Name] ='PutriA@weyerhaeuser.com' OR [Name] =
'OlbricT@weyerhaeuser.com' OR [Name] = 
'HamiltoB@weyerhaeuser.com' OR [Name] =
                'GishL@weyerhaeuser.com' OR [Name] = 
                'ThomasJ8@weyerhaeuser.com' OR [Name] = 
                'DeranleL@weyerhaeuser.com'


/*SELECT DISTINCT
    PatientID
    ,PatientName
    ,PatientState
    ,CASE
        WHEN PatientState = 'GA' THEN 'Southern State'
        WHEN PatientState = 'AL' THEN 'Southern State'
        WHEN PatientState = 'AK' THEN 'Alaska'
        WHEN PatientState = 'AZ' THEN 'Arizona'
        WHEN PatientState = 'UT' THEN 'Utah'
        ELSE PatientState
        END AS 'PatientState'
FROM TestTable
WHERE PatientState IN ('GA','AL', 'AK', 'AZ', 'UT')*/

--find how many people in both teams did not submit any ideas
SELECT COUNT(Name) AS Namez
FROM Scorepoints_Wellness_Challenge
WHERE IdeaPoints = '0' AND (Team = 'SAP' OR Team = 'CIB')

SELECT *,
CASE 
    WHEN Name = 'Putria@weyerhaeuser.com' THEN 'Yes'
    WHEN Name = 'OlbricT@weyerhaeuser.com' THEN 'Yes'
    WHEN Name = 'HamiltoB@weyerhaeuser.com' THEN 'Yes'
    WHEN Name = 'GishL@weyerhaeuser.com' THEN 'Yes'
    WHEN Name = 'ThomasJ8@weyerhaeuser.com' THEN 'Yes'
    WHEN Name = 'ThomasJ8@weyerhaeuser.com' THEN 'Yes'
    ELSE 'No' 
    END AS 'Wellness Committee Member?'
FROM Scorepoints_Wellness_Challenge
ORDER BY Team







