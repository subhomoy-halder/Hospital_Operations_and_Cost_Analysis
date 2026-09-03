USE Hospital_Operations;

CREATE TABLE Hospital_Logs (
	Serial_Num INT IDENTITY(1, 1) PRIMARY KEY,
	Hospital_Name VARCHAR(50) NOT NULL,
	Hospital_Location VARCHAR(50),
	Department VARCHAR(50),
	Doctor_Count INT NOT NULL CHECK(Doctor_Count >= 0),
	Patient_Count INT NOT NULL CHECK(Patient_Count >= 0),
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses DECIMAL(10, 2) NOT NULL CHECK(Medical_Expenses >= 0)
);

CREATE TABLE Staging_Table (
	Hospital_Name VARCHAR(50) NOT NULL,
	Hospital_Location VARCHAR(50),
	Department VARCHAR(50),
	Doctor_Count INT NOT NULL CHECK(Doctor_Count >= 0),
	Patient_Count INT NOT NULL CHECK(Patient_Count >= 0),
	Admission_Date CHAR(10),
	Discharge_Date CHAR(10),
	Medical_Expenses DECIMAL(10, 2)
);