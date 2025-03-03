-- Tables and relationships --
--A1--
CREATE TABLE MODULE(
	M_Code varChar(9) NOT NULL UNIQUE,
	M_Name varChar(50) NOT NULL,
	M_Credit int NOT NULL,
	M_Duration int NOT NULL,
	PRIMARY KEY(M_Code)
);

--A2--
CREATE TABLE DEGREE(
	D_Code varChar(8) NOT NULL UNIQUE,
	D_Name varChar(60) NOT NULL UNIQUE,
	D_Min_APS int NOT NULL,
	PRIMARY KEY(D_Code)
);

--A3--
CREATE TABLE STUDENT(
	S_ID varChar(10) NOT NULL UNIQUE,
	S_Name varChar(50) NOT NULL,
	S_Surname varChar(50) NOT NULL,
	S_DOB Date NOT NULL,
	S_Gender varChar(1) NOT NULL,
	D_Code varChar(8) NOT NULL,
	PRIMARY KEY(S_ID),
	FOREIGN KEY(D_Code) REFERENCES DEGREE(D_Code)
);

--A4--
CREATE TABLE BRIDGE(
	S_ID varChar(10) NOT NULL,
	M_Code varChar(9) NOT NULL,
	M_Mark int,
	PRIMARY KEY (S_ID, M_Code),
	FOREIGN KEY(M_Code) REFERENCES MODULE(M_Code),
	FOREIGN KEY(S_ID) REFERENCES STUDENT(S_ID)
);

-- Add the information from the provide tables into to your database --
--B1--
INSERT INTO MODULE(M_Code, M_Name, M_Credit, M_Duration)
SELECT M_CODE, M_NAME, M_CREDIT, M_DURATION
FROM DATAMODULE;

--B2--
INSERT INTO DEGREE(D_Code, D_Name, D_Min_APS)
SELECT D_CODE, D_NAME, D_MIN_APS
FROM DATADEGREE;

--B3--
INSERT INTO STUDENT(S_ID, S_Name, S_Surname, S_DOB, S_Gender, D_Code)
SELECT S_ID, S_NAME, S_SURNAME, S_DOB, S_GENDER, D_CODE
FROM DATASTUDENT;

--B4--
INSERT INTO BRIDGE(S_ID, M_Code)
SELECT S_ID, M_CODE
FROM DATABRIDGE;

--B5--
--UPDATE BRIDGE
--SET M_Mark = (1 + RAND(CHECKSUM(NEWID())) * 100);
UPDATE BRIDGE
SET M_Mark = 
  CASE 
    WHEN BRIDGE.S_ID = '201465128' AND BRIDGE.M_Code = 'IFM1A10' THEN 32 
    WHEN BRIDGE.S_ID = '201465128' AND BRIDGE.M_Code = 'CSC1A10' THEN 91 
    WHEN BRIDGE.S_ID = '201465128' AND BRIDGE.M_Code = 'APM1A10' THEN 94 
    WHEN BRIDGE.S_ID = '201547623' AND BRIDGE.M_Code = 'IFM1A10' THEN 62 
    WHEN BRIDGE.S_ID = '201547623' AND BRIDGE.M_Code = 'CSC2A10' THEN 75 
    WHEN BRIDGE.S_ID = '201553421' AND BRIDGE.M_Code = 'IFM3A10' THEN 80 
    WHEN BRIDGE.S_ID = '201553421' AND BRIDGE.M_Code = 'CSC3A10' THEN 85 
    WHEN BRIDGE.S_ID = '201554321' AND BRIDGE.M_Code = 'IFM3A10' THEN 70 
    WHEN BRIDGE.S_ID = '201554321' AND BRIDGE.M_Code = 'CSC2A10' THEN 88 
    WHEN BRIDGE.S_ID = '201554321' AND BRIDGE.M_Code = 'APM1A1E' THEN 93 
    WHEN BRIDGE.S_ID = '201554987' AND BRIDGE.M_Code = 'IFM3A10' THEN 95 
    WHEN BRIDGE.S_ID = '201556123' AND BRIDGE.M_Code = 'CSC3A10' THEN 77 
    WHEN BRIDGE.S_ID = '201556789' AND BRIDGE.M_Code = 'APM1A10' THEN 82 
    WHEN BRIDGE.S_ID = '201556789' AND BRIDGE.M_Code = 'APM1A1E' THEN 68 
    WHEN BRIDGE.S_ID = '201556789' AND BRIDGE.M_Code = 'IFM1A10' THEN 89 
    WHEN BRIDGE.S_ID = '201568745' AND BRIDGE.M_Code = 'CSC3A10' THEN 74 
    WHEN BRIDGE.S_ID = '201568745' AND BRIDGE.M_Code = 'IFM3A10' THEN 79 
    WHEN BRIDGE.S_ID = '201587643' AND BRIDGE.M_Code = 'CSC3A10' THEN 71 
    WHEN BRIDGE.S_ID = '201587643' AND BRIDGE.M_Code = 'IFM1A10' THEN 96 
    WHEN BRIDGE.S_ID = '201612397' AND BRIDGE.M_Code = 'IFM2A10' THEN 73 
    WHEN BRIDGE.S_ID = '201612397' AND BRIDGE.M_Code = 'CSC2A10' THEN 83 
    WHEN BRIDGE.S_ID = '201626849' AND BRIDGE.M_Code = 'IFM2A10' THEN 84 
    WHEN BRIDGE.S_ID = '201626849' AND BRIDGE.M_Code = 'CSC2A10' THEN 86 
    WHEN BRIDGE.S_ID = '201645682' AND BRIDGE.M_Code = 'IFM1A10' THEN 78 
    WHEN BRIDGE.S_ID = '201645682' AND BRIDGE.M_Code = 'CSC1A10' THEN 80 
    WHEN BRIDGE.S_ID = '201676482' AND BRIDGE.M_Code = 'APM1A10' THEN 87 
    WHEN BRIDGE.S_ID = '201676482' AND BRIDGE.M_Code = 'APM1A1E' THEN 88 
    WHEN BRIDGE.S_ID = '201676482' AND BRIDGE.M_Code = 'APM1A2E' THEN 89 
    WHEN BRIDGE.S_ID = '201676482' AND BRIDGE.M_Code = 'IFM1A10' THEN 90 
    WHEN BRIDGE.S_ID = '201687456' AND BRIDGE.M_Code = 'APM1A10' THEN 91 
    WHEN BRIDGE.S_ID = '201687456' AND BRIDGE.M_Code = 'APM1A1E' THEN 92 
    WHEN BRIDGE.S_ID = '201698765' AND BRIDGE.M_Code = 'APM1A10' THEN 93 
    WHEN BRIDGE.S_ID = '201698765' AND BRIDGE.M_Code = 'APM1A1E' THEN 94 
    WHEN BRIDGE.S_ID = '201712345' AND BRIDGE.M_Code = 'APM1A10' THEN 95 
    WHEN BRIDGE.S_ID = '201712345' AND BRIDGE.M_Code = 'IFM1A10' THEN 96 
	ELSE NULL
 END;


--SHOW THE NEW TABLES--
SELECT * FROM MODULE; --10--
SELECT * FROM DEGREE; --7--
SELECT * FROM STUDENT; --16--
SELECT * FROM BRIDGE; --35--

--All the Degrees that are link to a student--
--C--
SELECT STUDENT.S_ID, DEGREE.D_Code, DEGREE.D_Name FROM STUDENT
INNER JOIN DEGREE 
ON DEGREE.D_Code = STUDENT.D_Code 
ORDER BY DEGREE.D_Code;

--OR--
SELECT DISTINCT DEGREE.* FROM DEGREE,STUDENT
WHERE DEGREE.D_Code = STUDENT.D_Code;

--All the students that have registered for IFM2A10 and CSC2A10--
--D--
SELECT STUDENT.S_ID, T1.M_Code, T2.M_Code 
FROM (
	STUDENT
	INNER JOIN BRIDGE T1
	ON STUDENT.S_ID = T1.S_ID
	)
INNER JOIN BRIDGE T2
ON T1.S_ID = T2.S_ID
WHERE T1.M_Code = 'CSC2A10' AND T2.M_Code = 'IFM2A10';

--OR--
SELECT STUDENT.S_ID, STUDENT.S_Name FROM STUDENT JOIN BRIDGE ON STUDENT.S_ID=BRIDGE.S_ID
WHERE M_Code = 'CSC2A10'
INTERSECT
SELECT STUDENT.S_ID, STUDENT.S_Name FROM STUDENT JOIN BRIDGE ON STUDENT.S_ID=BRIDGE.S_ID
WHERE M_Code = 'IFM2A10';

--OR--
SELECT STUDENT.S_ID, STUDENT.S_Name FROM STUDENT JOIN BRIDGE ON STUDENT.S_ID=BRIDGE.S_ID
WHERE M_Code = 'CSC2A10'
AND STUDENT.S_ID IN
(SELECT STUDENT.S_ID FROM STUDENT JOIN BRIDGE ON STUDENT.S_ID=BRIDGE.S_ID
WHERE M_Code = 'IFM2A10');

--All the students that have registered for IFM2A or CSC2A--
--E--
SELECT S_ID, M_Code FROM BRIDGE
WHERE M_Code = 'CSC2A10' OR M_Code = 'IFM2A10'
ORDER BY S_ID;

--OR--
SELECT STUDENT.S_ID, STUDENT.S_Name, M_Code FROM STUDENT JOIN BRIDGE ON STUDENT.S_ID=BRIDGE.S_ID
WHERE M_Code = 'CSC2A10' OR M_Code = 'IFM2A10';

--Number of students registered for each Degree--
--F--
SELECT D_Code, COUNT(*) 
AS [NO. STUDENTS REGISTERED]
FROM STUDENT
GROUP BY D_Code;

--Average mark for each subject--
--G--
SELECT MODULE.M_Code, AVG(BRIDGE.M_Mark) AS [AVG MARK]
FROM MODULE
LEFT JOIN BRIDGE
ON MODULE.M_Code = BRIDGE.M_Code
GROUP BY MODULE.M_Code;

--All the degrees that have no students--
--H--
SELECT DEGREE.D_Code, DEGREE.D_Name
FROM DEGREE
WHERE NOT EXISTS(
	SELECT STUDENT.D_Code
	FROM STUDENT
	WHERE DEGREE.D_Code = STUDENT.D_Code
);

--Number of modules linked to each degree--
--I--
--GO FROM DEGREE TO STUDENT TO BRIDGE TO MODULE--
--JOIN 1: DEGREE AND STUDENT: THE DEGREE EACH STUDENT IS DOING--
--JOIN 2: DEGREE AND STUDENT AND BRIDGE: THE MODULE EACH STUDENT IS DOING WITH THEIR DEGREES--
--JOIN 3: DEGREE AND STUDENT AND BRIDGE AND MODULE: IN CASE A MODULE IS NOT BEING TAKEN BY ANY STUDENT--
SELECT DEGREE.D_CODE, DEGREE.D_NAME, COUNT(MODULE.M_CODE) AS [TOTAL NO. OF MODULES]
FROM DEGREE
LEFT JOIN STUDENT 
ON DEGREE.D_CODE = STUDENT.D_CODE
	LEFT JOIN BRIDGE 
	ON STUDENT.S_ID = BRIDGE.S_ID
		LEFT JOIN MODULE 
		ON BRIDGE.M_CODE = MODULE.M_CODE
GROUP BY DEGREE.D_CODE, DEGREE.D_NAME;