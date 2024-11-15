USE IT230;

DROP TABLE IF EXISTS DIAGNOSIS;
DROP TABLE IF EXISTS APPOINTMENT;
DROP TABLE IF EXISTS SCHEDULE;
DROP TABLE IF EXISTS EMPLOYEESPECIALTY;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS MEDICALHISTORYSURG;
DROP TABLE IF EXISTS MEDICALHISTORYPRES;
DROP TABLE IF EXISTS MEDICALHISTORYCOND;
DROP TABLE IF EXISTS SPECIALTY;
DROP TABLE IF EXISTS EMPLOYEETYPE;
DROP TABLE IF EXISTS SURGERY;
DROP TABLE IF EXISTS PRESCRIPTION;
DROP TABLE IF EXISTS MEDICALCONDITIONS;
DROP TABLE IF EXISTS PATIENT;

CREATE TABLE IF NOT EXISTS PATIENT
(
PATIENTID VARCHAR(10) PRIMARY KEY,
PASSWORD VARCHAR(20) NOT NULL,
PATIENTLNAME VARCHAR(25) NOT NULL,
PATIENTFNAME VARCHAR(25) NOT NULL,
STREET VARCHAR(25),
CITY VARCHAR(20),
STATE CHAR(2),
ZIP VARCHAR(10),
GENDER CHAR(1)

);

CREATE TABLE IF NOT EXISTS MEDICALCONDITIONS
(
CONDITIONID VARCHAR(10) PRIMARY KEY,
DESCRIPTION VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PRESCRIPTION
(
PRESCRIPTIONID VARCHAR(10) PRIMARY KEY,
DESCRIPTION VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS SURGERY
(
SURGERYID VARCHAR(10) PRIMARY KEY,
DESCRIPTION VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS EMPLOYEETYPE
(
TYPEID VARCHAR(10) PRIMARY KEY,
DESCRIPTION VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS SPECIALTY
(
SPECIALTYID VARCHAR(10) PRIMARY KEY,
DESCRIPTION VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS MEDICALHISTORYCOND
(
PATIENTID VARCHAR(10),
DATE DATE,
CONDITIONID VARCHAR(10),
CONSTRAINT PK_MEDICALHISTORYCOND PRIMARY KEY (PATIENTID, DATE),
CONSTRAINT FK_MEDICALHISTORY_MEDICALCOND FOREIGN KEY (CONDITIONID) REFERENCES MEDICALCONDITIONS (CONDITIONID),
CONSTRAINT FK_PATIENT_CONDITION FOREIGN KEY (PATIENTID) REFERENCES PATIENT (PATIENTID)
);

CREATE TABLE IF NOT EXISTS MEDICALHISTORYPRES
(
PATIENTID VARCHAR(10),
DATE DATE,
PRESCRIPTIONID VARCHAR(10),
CONSTRAINT PK_MEDICALHISTORYPRES PRIMARY KEY (PATIENTID, DATE),
CONSTRAINT FK_MEDICALHISTORY_PRESCRIPTION FOREIGN KEY (PRESCRIPTIONID) REFERENCES PRESCRIPTION (PRESCRIPTIONID),
CONSTRAINT FK_PATIENT_PRESCRIPTION FOREIGN KEY (PATIENTID) REFERENCES PATIENT (PATIENTID)
);

CREATE TABLE IF NOT EXISTS MEDICALHISTORYSURG
(
PATIENTID VARCHAR(10),
DATE DATE,
SURGERYID VARCHAR(10),
CONSTRAINT PK_MEDICALHISTORYSURG PRIMARY KEY (PATIENTID, DATE),
CONSTRAINT FK_MEDICALHISTORY_SURGERY FOREIGN KEY (SURGERYID) REFERENCES SURGERY (SURGERYID),
CONSTRAINT FK_PATIENT_SURGERY FOREIGN KEY (PATIENTID) REFERENCES PATIENT (PATIENTID)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE
(
EMPLOYEEID VARCHAR(10) PRIMARY KEY,
PASSWORD VARCHAR(20) NOT NULL,
EMPLOYEELNAME VARCHAR(25) NOT NULL,
EMPLOYEEFNAME VARCHAR(25) NOT NULL,
TYPEID VARCHAR(10),
GENDER CHAR(1),
DATEOFHIRE DATE,
CONSTRAINT FK_EMPLOYEE_EMPLOYEETYPE FOREIGN KEY (TYPEID) REFERENCES EMPLOYEETYPE (TYPEID)
);

CREATE TABLE IF NOT EXISTS EMPLOYEESPECIALTY
(
EMPLOYEEID VARCHAR(10),
SEQUENCE INT,
SPECIALTYID VARCHAR(10),
CONSTRAINT PK_EMPLOYEESPECIALTY PRIMARY KEY (EMPLOYEEID, SEQUENCE, SPECIALTYID),
CONSTRAINT FK_EMPLOYEESPECIALTY_EMPLOYEE FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEE (EMPLOYEEID),
CONSTRAINT FK_EMPLOYEESPECIALTY_SPECIALTY FOREIGN KEY (SPECIALTYID) REFERENCES SPECIALTY (SPECIALTYID)
);

CREATE TABLE IF NOT EXISTS SCHEDULE
(
EMPLOYEEID VARCHAR(10),
DAYOFWEEK CHAR(2) NOT NULL,
SORTSEQ INT NOT NULL,
STARTTIME TIME NOT NULL,
ENDTIME TIME NOT NULL,
CONSTRAINT PK_SCHEDULE PRIMARY KEY (EMPLOYEEID, DAYOFWEEK),
CONSTRAINT FK_SCHEDULE_EMPLOYEE FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEE (EMPLOYEEID)
);

CREATE TABLE IF NOT EXISTS APPOINTMENT
(
APPOINTMENTID VARCHAR(10) PRIMARY KEY,
PATIENTID VARCHAR(10) NOT NULL,
EMPLOYEEID VARCHAR(10) NOT NULL,
DATE DATE,
STARTTIME TIME,
DURATION VARCHAR(10),
STATUS VARCHAR(10),
CONSTRAINT FK_APPOINTMENT_EMPLOYEE FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEE (EMPLOYEEID),
CONSTRAINT FK_APPOINTMENT_PATIENT FOREIGN KEY (PATIENTID) REFERENCES PATIENT (PATIENTID)
);

CREATE TABLE IF NOT EXISTS DIAGNOSIS
(
APPOINTMENTID VARCHAR(10) PRIMARY KEY,
DIAGNOSIS VARCHAR(255),
PRESCRIPTIONID VARCHAR(10) NOT NULL,
CONSTRAINT FK_DIAGNOSIS_APPOINTMENT FOREIGN KEY (APPOINTMENTID) REFERENCES APPOINTMENT (APPOINTMENTID),
CONSTRAINT FK_DIAGNOSIS_PRESCRIPTION FOREIGN KEY (PRESCRIPTIONID) REFERENCES PRESCRIPTION (PRESCRIPTIONID)
);