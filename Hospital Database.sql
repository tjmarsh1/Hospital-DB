CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE StaffInfo (
StaffID INT NOT NULL,
StaffName VARCHAR(50),
Address VARCHAR(50),
PhoneNum INT, 
StaffDOB DATE,
Sex VarChar(25),
CHECK (Sex = 'Male' OR 'Female' OR 'Other'),
NIN INT,
Position VARCHAR(30),
Salary INT,
SalaryScale VARCHAR(30),
DateOfQualification DATE,
TypeOfQualification VARCHAR(30),
NameOfInstitute VARCHAR(50),
PrevExpName VARCHAR(50),
PrevExpPosition VARCHAR(30),
PrevExpStartD DATE,
PrevExpEndD DATE,
ConHours INT,
TypeOfSalary VARCHAR(20),
PRIMARY KEY (StaffID)
);

CREATE TABLE LocalDoctor (
DoctorName VARCHAR(50) NOT NULL,
ClinicNum INT NOT NULL, 
ClinicAddress VARCHAR (60),
ClinicPhoneNum CHAR(10),
PRIMARY KEY (DoctorName, ClinicNum)
);

CREATE TABLE PatientsNextOfKin (
PatientNum INT NOT NULL,
PatientName VARCHAR(40),
Relationship VARCHAR(40),
Address VARCHAR(30),
PhoneN CHAR(10),
PRIMARY KEY (PatientNum)
);

CREATE TABLE Patients (
PatientNum INT,
PatientName VARCHAR(40),
Address VARCHAR(50),
PhoneNum CHAR(10),
DOB DATE,
Sex VARCHAR (10),
	CHECK (Sex = 'Male' OR 'Female' OR 'Other'),
MaritalStatus VARCHAR(15),
	CHECK ( MaritalStatus = 'Married' OR 'Not Married'),
DateRegistered DATE,
NextOfKinNum VARCHAR(25),
PRIMARY KEY (PatientNum),
FOREIGN KEY (NextOfKinNum) REFERENCES PatientsNextOfKin(PatientNum)
);

CREATE TABLE PatientAppointment (
AppointmentNum INT,
StaffNum INT,
PatientNum INT,
PatientName VARCHAR(30),
DatTime DATE,
RoomNum INT,
PRIMARY KEY (AppointmentNum),
FOREIGN KEY (StaffNum) REFERENCES StaffInfo(StaffID),
FOREIGN KEY (PatientNum) REFERENCES Patients(PatientNum)
);

CREATE TABLE OutPatient (
OutPatientNum INT,
PatientNum INT,
Name VARCHAR(30),
Address VARCHAR(40),
PhoneN VARCHAR(15),
DOB DATE,
Sex VARCHAR(10),
DaT DATE,
PRIMARY KEY (OutPatientNum),
FOREIGN KEY (PatientNum) REFERENCES Patients(PatientNum)
);

CREATE TABLE Ward (
WardNum INT,
WardName VARCHAR(30),
Location VARCHAR(30),
NOB INT,
PhoneExt VARCHAR(15),
PRIMARY KEY (WardNum),
UNIQUE (WardName)
);

CREATE TABLE Inpatients (
InpatientNum INT,
PatientNum INT,
IpName VARCHAR(30),
Address VARCHAR(40),
PhoneN INT,
Dob DATE,
Sex VARCHAR(20),
MaritalStatus VARCHAR(15),
NextOfKinNum INT,
DateOnWaitingList DATE,
WardRequired INT,
ExpectedStay INT,
ActualDate DATE,
PRIMARY KEY (InpatientNum),
FOREIGN KEY (PatientNum) REFERENCES Patients(PatientNum),
FOREIGN KEY (NextOfKinNum) REFERENCES PatientsNextOfKin(PatientNum),
FOREIGN KEY (WardRequired) REFERENCES Ward(WardNum)
);






