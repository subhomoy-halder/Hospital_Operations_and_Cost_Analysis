USE Hospital_Operations;

BULK INSERT Staging_Table
FROM "Raw Data.csv"
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	ROWTERMINATOR = '0x0a'
);

SELECT TOP 10
	Hospital_Name,
	Hospital_Location,
	Department,
	Doctor_Count,
	Patient_Count,
	Admission_Date,
	Discharge_Date,
	Medical_Expenses
FROM Staging_Table;