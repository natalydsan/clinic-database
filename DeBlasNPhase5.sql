SELECT CONCAT(EmployeeFName, ', ', EmployeeLName) AS "Full Name", DayOfWeek, StartTime, EndTime, emp.EmployeeID
FROM Employee emp, Schedule sch
WHERE emp.EmployeeID = sch.EmployeeID
ORDER BY StartTime, EmployeeID;

SELECT EmployeeLName, EmployeeFName, Description
FROM Employee emp, Specialty sp, EmployeeSpecialty empsp
WHERE emp.employeeid = empsp.employeeid
AND sp.specialtyid = empsp.specialtyid
ORDER BY employeelname, description;

SELECT EmployeeLName, EmployeeFName, Description
FROM Employee emp, EmployeeType empt
WHERE emp.typeid = empt.typeid
ORDER BY description, employeelname;

SELECT Date, CONCAT(PatientFName, ', ', PatientLName) AS "Patient's Full Name", CONCAT(EmployeeFName, ', ', EmployeeLName) AS "Employee's Full Name", StartTime, Duration
FROM patient pt, employee emp, appointment appt
WHERE appt.patientid = pt.patientid
AND appt.employeeid = emp.employeeid
AND status = 'Scheduled'
ORDER BY date, pt.patientlname;

SELECT Date, PatientLName, PatientFName, Description, Descriptor
FROM medicalhistorycond mhc, patient pt, medicalconditions mc
WHERE mhc.patientID = pt.patientID
AND mhc.conditionID = mc.conditionID

UNION

SELECT Date, PatientLName, PatientFName, Description, Descriptor
FROM medicalhistorypres mhp, patient pt, prescription pr
WHERE mhp.patientID = pt.patientID
AND mhp.prescriptionID = pr.prescriptionID

UNION

SELECT Date, PatientLName, PatientFName, Description, Descriptor
FROM medicalhistorysurg mhs, patient pt, surgery surg
WHERE mhs.patientID = pt.patientID
AND mhs.surgeryID = surg.surgeryID

ORDER BY date, patientlname;