USE Hospital_Operations;

INSERT INTO Hospital_Logs (
	Hospital_Name, 
	Hospital_Location,
	Department,
	Doctor_Count,
	Patient_Count,
	Admission_Date,
	Discharge_Date,
	Medical_Expenses
)
SELECT
	Hospital_Name, 
	Hospital_Location,
	Department,
	Doctor_Count,
	Patient_Count,
	CONVERT(DATE, Admission_Date, 105),
	CONVERT(DATE, Discharge_Date, 105),
	Medical_Expenses
FROM Staging_Table;

SELECT TOP 10
	Serial_Num,
	Hospital_Name,
	Hospital_Location,
	Department,
	Doctor_Count,
	Patient_Count,
	Admission_Date,
	Discharge_Date,
	Medical_Expenses
FROM Hospital_Logs;