-- Drop and Create statemements for Medical Clinic database
CREATE SCHEMA IF NOT EXISTS `MSIS230`;
USE `MSIS230` ;

-- drop all tables with foreign keys first
DROP TABLE IF EXISTS `Schedule` ;
DROP TABLE IF EXISTS `EmployeeSpecialty` ;
DROP TABLE IF EXISTS `MedicalHistoryCond` ;
DROP TABLE IF EXISTS `MedicalHistoryPres` ;
DROP TABLE IF EXISTS `MedicalHistorySurg` ;
DROP TABLE IF EXISTS `Diagnosis` ;
DROP TABLE IF EXISTS `Appointment` ;
DROP TABLE IF EXISTS `Employee` ;
DROP TABLE IF EXISTS `EmployeeType` ;
-- drop all tables with primary keys only
DROP TABLE IF EXISTS `Prescription` ;
DROP TABLE IF EXISTS `Surgery` ;
DROP TABLE IF EXISTS `MedicalConditions` ;
DROP TABLE IF EXISTS `Specialty` ;
DROP TABLE IF EXISTS `Patient` ;

-- create all tables with primary keys only first
CREATE TABLE IF NOT EXISTS `Patient` (
  `PatientID` VARCHAR(10) NOT NULL,
  `Password` VARCHAR(20) NOT NULL,
  `PatientLName` VARCHAR(25) NOT NULL,
  `PatientFName` VARCHAR(25) NOT NULL,
  `Street` VARCHAR(25) NULL,
  `City` VARCHAR(20) NULL,
  `State` CHAR(2) NULL,
  `Zip` VARCHAR(10) NULL,
  `Gender` CHAR(1) NULL,
  PRIMARY KEY (`PatientID`)
  );
  
CREATE TABLE IF NOT EXISTS `Specialty` (
  `SpecialtyID` VARCHAR(10) NOT NULL,
  `Description` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`SpecialtyID`)
  );

CREATE TABLE IF NOT EXISTS `MedicalConditions` (
  `ConditionID` VARCHAR(10) NOT NULL,
  `Description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ConditionID`)
);

CREATE TABLE IF NOT EXISTS `Surgery` (
  `SurgeryID` VARCHAR(10) NOT NULL,
  `Description` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`SurgeryID`)
  );

CREATE TABLE IF NOT EXISTS `Prescription` (
  `PrescriptionID` VARCHAR(10) NOT NULL,
  `Description` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`PrescriptionID`)
  );

CREATE TABLE IF NOT EXISTS `EmployeeType` (
  `TypeID` VARCHAR(10) NOT NULL,
  `Description` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`TypeID`)
  );

-- create all tables with foreign keys
CREATE TABLE IF NOT EXISTS `Employee` (
  `EmployeeID` VARCHAR(10) NOT NULL,
  `Password` VARCHAR(20) NOT NULL,
  `EmployeeLName` VARCHAR(25) NOT NULL,
  `EmployeeFName` VARCHAR(25) NOT NULL,
  `TypeID` VARCHAR(10) NULL,
  `Gender` CHAR(1) NULL,
  `DateOfHire` DATE NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `fk_Employee_EmployeeType`
    FOREIGN KEY (`TypeID`)
    REFERENCES `EmployeeType` (`TypeID`)
);

CREATE TABLE IF NOT EXISTS `Appointment` (
  `AppointmentID` VARCHAR(10) NOT NULL,
  `PatientID` VARCHAR(10) NOT NULL,
  `EmployeeID` VARCHAR(10) NOT NULL,
  `Date` DATE NULL,
  `StartTime` TIME NULL,
  `Duration` VARCHAR(10) NULL,
  `Status` VARCHAR(10) NULL,
  PRIMARY KEY (`AppointmentID`),
  CONSTRAINT `fk_Appointment_Employee`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `fk_Appointment_Patient`
    FOREIGN KEY (`PatientID`)
    REFERENCES `Patient` (`PatientID`)
    );
    
CREATE TABLE IF NOT EXISTS `Diagnosis` (
  `AppointmentID` VARCHAR(10) NOT NULL,
  `Diagnosis` VARCHAR(255) NULL,
  `PrescriptionID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  CONSTRAINT `fk_Diagnosis_Appointment`
    FOREIGN KEY (`AppointmentID`)
    REFERENCES `Appointment` (`AppointmentID`),
  CONSTRAINT `fk_Diagnosis_Prescription`
    FOREIGN KEY (`PrescriptionID`)
    REFERENCES `Prescription` (`PrescriptionID`) 
  );

CREATE TABLE IF NOT EXISTS `MedicalHistoryPres` (
  `PatientID` VARCHAR(10) NOT NULL,
  `Date` DATE NOT NULL,
  `PrescriptionID` VARCHAR(10) NULL,
  PRIMARY KEY (`PatientID`, `Date`),
   CONSTRAINT `fk_Patient_Prescription`
    FOREIGN KEY (`PatientID`)
    REFERENCES `Patient` (`PatientID`),
  CONSTRAINT `fk_MedicalHistory_Prescription`
    FOREIGN KEY (`PrescriptionID`)
    REFERENCES `Prescription` (`PrescriptionID`)
  );
  
  CREATE TABLE IF NOT EXISTS `MedicalHistoryCond` (
  `PatientID` VARCHAR(10) NOT NULL,
  `Date` DATE NOT NULL,
  `ConditionID` VARCHAR(10) NULL,
  PRIMARY KEY (`PatientID`, `Date`),
  CONSTRAINT `fk_Patient_Condition`
    FOREIGN KEY (`PatientID`)
    REFERENCES `Patient` (`PatientID`),
  CONSTRAINT `fk_MedicalHistory_MedicalConditions`
    FOREIGN KEY (`ConditionID`)
    REFERENCES `MedicalConditions` (`ConditionID`)
  );
  
  CREATE TABLE IF NOT EXISTS `MedicalHistorySurg` (
  `PatientID` VARCHAR(10) NOT NULL,
  `Date` DATE NOT NULL,
  `SurgeryID` VARCHAR(10) NULL,
  PRIMARY KEY (`PatientID`, `Date`),
  CONSTRAINT `fk_Patient_Surgery`
    FOREIGN KEY (`PatientID`)
    REFERENCES `Patient` (`PatientID`),
  CONSTRAINT `fk_MedicalHistory_Surgery`
    FOREIGN KEY (`SurgeryID`)
    REFERENCES `Surgery` (`SurgeryID`)
  );

CREATE TABLE IF NOT EXISTS `EmployeeSpecialty` (
  `EmployeeID` VARCHAR(10) NOT NULL,
  `Sequence` INT NOT NULL,
  `SpecialtyID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `Sequence`, `SpecialtyID`),
    CONSTRAINT `fk_EmployeeSpecialty_Employee`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `fk_EmployeeSpecialty_Specialty`
    FOREIGN KEY (`SpecialtyID`)
    REFERENCES `Specialty` (`SpecialtyID`)
  );

CREATE TABLE IF NOT EXISTS `Schedule` (
  `EmployeeID` VARCHAR(10) NOT NULL,
  `DayOfWeek` CHAR(2) NOT NULL,
  `SortSeq` INT NOT NULL,
  `StartTime` TIME NOT NULL,
  `EndTime` TIME NOT NULL,
  PRIMARY KEY (`EmployeeID`, `DayOfWeek`),
  CONSTRAINT `fk_Schedule_Employee`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Employee` (`EmployeeID`)   
  );




