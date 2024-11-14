SELECT *
FROM patient
ORDER BY PatientLName;

SELECT *
FROM employee
ORDER BY EmployeeLName;

SELECT CONCAT(PatientFName, ', ', PatientLName) AS "Full Name", City, State
FROM patient
WHERE State = 'MA' 
ORDER BY City, PatientLName;

SELECT CONCAT(EmployeeFName, ', ', EmployeeLName) AS "Full Name", TypeID
FROM employee
WHERE TypeID = 'PHY' OR TypeID = 'SURG'
ORDER BY TypeID, EmployeeLName;

SELECT *
FROM MedicalConditions
ORDER BY Description;

SELECT *
FROM prescription
WHERE Description LIKE '%20mg'
ORDER BY PrescriptionID;

SELECT CONCAT(EmployeeFName, ', ', EmployeeLName) AS "Full Name", DateOfHire
FROM employee
WHERE DateOfHire >= '2019-01-01'
ORDER BY DateOfHire desc;

SELECT *
FROM employee
WHERE Gender = 'F'
ORDER BY EmployeeLName;

SELECT *
FROM specialty
WHERE Description LIKE '%Surgery';

SELECT CONCAT(PatientFName, ', ', PatientLName) AS "Full Name", City, State
FROM patient
WHERE Gender = 'M' AND State <> 'MA';