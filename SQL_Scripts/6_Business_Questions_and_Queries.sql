USE Hospital_Operations

-- 1. Total number of patients across all hospitals.
SELECT
	SUM(Patient_Count) AS total_patients
FROM Hospital_Logs;

-- 2. Average number of doctors available per hospital.
SELECT
	AVG(Doctor_Count) AS average_doctor_count
FROM Hospital_Logs;

-- 3. Top 3 hospital departments with highest number of patients.
SELECT
	Department,
	num_patients
FROM (
	SELECT
		Department,
		SUM(Patient_Count) AS num_patients,
		RANK() OVER(ORDER BY SUM(Patient_Count) DESC) AS rn
	FROM Hospital_Logs
	GROUP BY Department
) AS t
WHERE rn <= 3;

-- 4. Hospital that recorded the highest medical expenses.
SELECT
	Hospital_Name,
	total_expense
FROM (
	SELECT
		Hospital_Name,
		SUM(Medical_Expenses) AS total_expense,
		RANK() OVER(ORDER BY SUM(Medical_Expenses) DESC) AS rn
	FROM Hospital_Logs
	GROUP BY Hospital_Name
) AS t
WHERE rn = 1;

-- 5. Average medical expenses per day per hospital.
SELECT
	Hospital_Name,
	SUM(Medical_Expenses) / SUM(DATEDIFF(DAY,Admission_Date,Discharge_Date)) AS medical_expense_per_patient_day
FROM Hospital_Logs
GROUP BY Hospital_Name;

-- 6. Total number of patients treated in each city.
SELECT
	Hospital_Location,
	SUM(Patient_Count) AS patients_treated
FROM Hospital_Logs
GROUP BY Hospital_Location;

-- 7. Average number of days patients spend in each department.
SELECT
	Department,
	AVG(DATEDIFF(DAY,Admission_Date,Discharge_Date)) AS average_days
FROM Hospital_Logs
GROUP BY Department;

-- 8. Department with the least number of patients.
SELECT
	Department,
	num_patients
FROM (
	SELECT
		Department,
		SUM(Patient_Count) AS num_patients,
		RANK() OVER(ORDER BY SUM(Patient_Count)) AS rn
	FROM Hospital_Logs
	GROUP BY Department
) AS t
WHERE rn = 1;

-- 9. Total medical expenses for each month.
SELECT
	MONTH(Admission_Date) AS month,
	YEAR(Admission_Date) AS year,
	SUM(Medical_Expenses) AS total_medical_expense
FROM Hospital_Logs
GROUP BY
	MONTH(Admission_Date),
	YEAR(Admission_Date);
