SELECT State, COUNT(PatientID) AS total_patients
FROM Patient
GROUP BY State
ORDER BY State;

SELECT MIN(Date) AS earliest_date, MAX(Date) AS latest_date
FROM Appointment
WHERE Status = 'Scheduled';

SELECT TypeID, COUNT(EmployeeID) AS total_employees
FROM Employee
GROUP BY TypeID
ORDER BY TypeID;

SELECT DayOfWeek, COUNT(EmployeeID) AS total_employees
FROM Schedule
GROUP BY DayOfWeek;

SELECT Gender, COUNT(PatientID) AS total_patients
FROM Patient
GROUP BY Gender;

UPDATE Patient
SET Gender = 'F'
WHERE PatientID = 'DW001';

UPDATE Appointment
SET Status = 'Complete'
WHERE Status = 'Scheduled';

INSERT INTO Diagnosis (AppointmentID, Diagnosis, PrescriptionID)
SELECT AppointmentID, 'Strep Throat', 'AMOX'
FROM Appointment
WHERE Status = 'Complete';

UPDATE Appointment
SET Status = 'Scheduled', Date = '2023-12-12', StartTime = '12:00', Duration = '0'
WHERE Status <> 'Complete';


