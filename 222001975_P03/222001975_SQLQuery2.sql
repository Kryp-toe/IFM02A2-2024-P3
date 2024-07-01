CREATE TABLE DATAMODULE(
M_CODE VARCHAR(7),
M_NAME VARCHAR(50),
M_CREDIT INT,
M_DURATION INT);

CREATE TABLE DATASTUDENT(
S_ID VARCHAR(10),
S_NAME VARCHAR(50),
S_SURNAME VARCHAR(50),
S_DOB DATE,
S_GENDER VARCHAR(1),
D_CODE VARCHAR(8));

CREATE TABLE DATADEGREE(
D_CODE VARCHAR(7),
D_NAME VARCHAR(60),
D_MIN_APS INT);

CREATE TABLE DATABRIDGE(
S_ID CHAR(9),
M_CODE VARCHAR(9));

INSERT INTO DATAMODULE VALUES
('APM1A10','Introduction to Statics',4,5),
('APM1A1E','Applied Mathematics 1E',4,5),
('APM1A2E','Applied Mathematics 2E',4,5),
('APM1B10','Introduction to Dynamics',4,5),
('CSC1A10','Introduction to algorithm development',4,5),
('CSC2A10','Object oriented programming',4,5),
('CSC3A10','Advanced data structures and algorithms',4,5),
('IFM1A10','Introduction to algorithm development',4,5),
('IFM2A10','Database design',4,5),
('IFM3A10','Introduction to software engineering',4,5);

INSERT INTO DATASTUDENT VALUES
('201465128','Tami','Davis','2006/01/06','F','BSIT01'),
('201547623','Grace','Peterson','1996/09/01','F','BSIT02'),
('201553421','John','Mody','1999/11/02','M','BSITE1'),
('201554321','Dave','Miller','2000/06/18','M','BSIT01'),
('201554987','Mary','Taylor','1996/08/11','F','BSIT02'),
('201556123','Jane','Jackson','1997/02/14','F','BSITE1'),
('201556789','Ron','Harris','1997/01/18','M','BSIT01'),
('201568745','Sheldon','Leatham','1995/06/18','M','BSIT02'),
('201587643','Thabo','Walker','1997/01/29','M','BSITE1'),
('201612397','Lai','Reiser','1996/08/11','F','BSIT01'),
('201626849','Lrigha','Bark','1997/02/14','F','BSIT02'),
('201645682','Wonda','Bosse','1997/01/18','F','BSITE1'),
('201676482','Garry','Woodard','1995/06/18','M','MAEX06'),
('201687456','Cira','Hopson','1997/01/29','F','MAEX10'),
('201698765','Lashay','Barger','1996/08/11','F','MAEX06'),
('201712345','Ty','Stellhorn','1997/02/14','M','BSMA01');

INSERT INTO DATADEGREE VALUES
('BSIT01','Information Technology',30),
('BSIT02','Computer Science and Informatics',30),
('BSITE1','Computer Science',26),
('BSMA01','Applied Mathematics and Computer Science',31),
('BSMA03','Computational Science',31),
('MAEX06','Mathematics and Computer Science',26),
('MAEX10','Mathematics and Informatics',26);

INSERT INTO DATABRIDGE VALUES
('201465128','IFM1A10'),
('201465128','CSC1A10'),
('201465128','APM1A10'),
('201547623','IFM1A10'),
('201547623','CSC2A10'),
('201553421','IFM3A10'),
('201553421','CSC3A10'),
('201554321','IFM3A10'),
('201554321','CSC2A10'),
('201554321','APM1A1E'),
('201554987','IFM3A10'),
('201556123','CSC3A10'),
('201556789','APM1A10'),
('201556789','APM1A1E'),
('201556789','IFM1A10'),
('201568745','CSC3A10'),
('201568745','IFM3A10'),
('201587643','CSC3A10'),
('201587643','IFM1A10'),
('201612397','IFM2A10'),
('201612397','CSC2A10'),
('201626849','IFM2A10'),
('201626849','CSC2A10'),
('201645682','IFM1A10'),
('201645682','CSC1A10'),
('201676482','APM1A10'),
('201676482','APM1A1E'),
('201676482','APM1A2E'),
('201676482','IFM1A10'),
('201687456','APM1A10'),
('201687456','APM1A1E'),
('201698765','APM1A10'),
('201698765','APM1A1E'),
('201712345','APM1A10'),
('201712345','IFM1A10');


--'Note* not MODIFY my code ran as is and us the data from the db--