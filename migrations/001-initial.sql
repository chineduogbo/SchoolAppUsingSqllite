--up
CREATE TABLE Userrole(
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT,
  Active BIT
);

CREATE TABLE User(
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Username TEXT,
  Firstname TEXT,
  Lastname TEXT,
  Othername TEXT,
  Phonenumber TEXT,
  Address TEXT,
  Password TEXT,
  RoleId INTEGER  REFERENCES Userrole(Id)
);
CREATE TABLE Student(
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Bloodgroup TEXT,
  Firstname TEXT,
  Lastname TEXT,
  Othername TEXT,
  Phonenumber TEXT,
  Address TEXT,
  Allergies TEXT,
  Healthissues TEXT,
  Drugreactions TEXT,
  Email TEXT
);
CREATE TABLE Class(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT,
  Active BIT
);
CREATE TABLE Classsubgroup(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT,
  Active BIT,
  Classid INTEGER REFERENCES Class(Id)
);
CREATE TABLE Sessiondetail(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT,
  Active BIT
);
CREATE TABLE Term(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT,
  Active BIT
);
CREATE TABLE Activeterm(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
   Termid INTEGER REFERENCES Term(Id),
   Sessionid INTEGER REFERENCES Sessiondetail(Id)
);
CREATE TABLE Studentclass(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
  Classsubgroupid INTEGER REFERENCES Classsubgroup(Id),
   Studentid INTEGER REFERENCES Student(Id),
   Activetermid INTEGER REFERENCES Activeterm(Id)
);
CREATE TABLE Teacherclass(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
  Classsubgroupid INTEGER REFERENCES Classsubgroup(Id),
   UserId INTEGER REFERENCES User(Id),
   Activetermid INTEGER REFERENCES Activeterm(Id)
);
CREATE TABLE Announcements(
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
   UserId INTEGER REFERENCES User(Id),
   Description TEXT,
   Date DATE,
   Imagelink TEXT
);
CREATE TABLE Subjects(
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Name TEXT,
  Active BIT
);
CREATE TABLE SubjectAssignment(
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
  Classsubgroupid INTEGER REFERENCES Classsubgroup(Id),
   Subjectid INTEGER REFERENCES Subjects(Id),
   UserId INTEGER REFERENCES User(Id)
);
CREATE TABLE Attendance(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
  SubjectAssignmentId INTEGER REFERENCES SubjectAssignment(Id),
   UserId INTEGER REFERENCES User(Id),
  Studentid INTEGER REFERENCES Student(Id),
  Date DATE
);
CREATE TABLE Result(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
  SubjectAssignmentId INTEGER REFERENCES SubjectAssignment(Id),
   UserId INTEGER REFERENCES User(Id),
  Studentid INTEGER REFERENCES Student(Id),
  Score TEXT
);
CREATE TABLE Test(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Active BIT,
  SubjectAssignmentId INTEGER REFERENCES SubjectAssignment(Id),
   UserId INTEGER REFERENCES User(Id),
  Studentid INTEGER REFERENCES Student(Id),
  Score TEXT
);
CREATE TABLE Chat(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
   UserId INTEGER REFERENCES User(Id),
  ResponseId INTEGER REFERENCES User(Id)
);
CREATE TABLE Chatresponse(
   Id INTEGER PRIMARY KEY AUTOINCREMENT,
   Chat TEXT,
  ChatId INTEGER REFERENCES Chat(Id),
  Date DATE
);

INSERT INTO Userrole(Name,Active) values ('Admin',True);
INSERT INTO Userrole(Name,Active) values ('Teacher',True);
INSERT INTO Userrole(Name,Active) values ('Parent',True);
INSERT INTO Userrole(Name,Active) values ('Accountant',True);

INSERT INTO User(Username,Firstname,Lastname,Othername,Phonenumber,Password,Address,RoleId) values
('Admin','Admin','Admin','Admin','080','1234567','Admin',1);




-- Down

DROP TABLE Userrole;
DROP TABLE User;
-- DROP TABLE Student;
-- DROP TABLE Class;
-- DROP TABLE Classsubgroup;
-- DROP TABLE Session;
-- DROP TABLE Term;
-- DROP TABLE Activeterm;
-- DROP TABLE Studentclass;
-- DROP TABLE Teacherclass;
-- DROP TABLE Announcements;
-- DROP TABLE Subject;
-- DROP TABLE SubjectAssignment;
-- DROP TABLE Attendance;
-- DROP TABLE Result;
-- DROP TABLE Test;
-- DROP TABLE Chat;
-- DROP TABLE Chatresponse;






