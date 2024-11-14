SELECT CONCAT(EmployeeFName, ', ', EmployeeLName) AS "Full Name", DayOfWeek, StartTime, EndTime
FROM Employee e LEFT OUTER JOIN Schedule s 
ON e.employeeid = s.employeeid
ORDER BY StartTime, e.EmployeeID;

SELECT Date AS "Appointment Date", CONCAT(PatientFName, ', ', PatientLName) AS " Patient's Full Name", 
CONCAT(EmployeeFName, ', ', EmployeeLName) AS "Employee's Full Name", StartTime, Duration, Status
FROM Patient p LEFT OUTER JOIN Appointment a
ON p.patientid = a.patientid
LEFT OUTER JOIN Employee e 
ON e.employeeid = a.employeeid
ORDER BY Date, PatientLName;

SELECT PrescriptionID, Description
FROM Prescription
WHERE PrescriptionID NOT IN (SELECT DISTINCT PrescriptionID FROM MedicalHistoryPres);


SELECT ConditionID, Description
FROM MedicalConditions
WHERE ConditionID IN (SELECT DISTINCT ConditionID FROM MedicalHistoryCond);

SELECT TypeID, Description
FROM EmployeeType
WHERE TypeID NOT IN (SELECT DISTINCT TypeID FROM Employee);
