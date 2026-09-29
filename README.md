# CampusCare

**CampusCare** is a web-based **Student Support and Issue Management System** developed using **ASP.NET Web Forms and VB.NET**.

It allows students to submit and track campus complaints, while administrators can manage complaints, update their status, and publish announcements.

## Features

- Student registration and login
- Submit, edit, delete, and track complaints
- Complaint status management
- Campus announcements
- Admin dashboard and complaint management
- Role-based access control
- ASP.NET ASMX XML Web Service
- Web Service Dashboard for complaint statistics

## Technologies

- ASP.NET Web Forms
- VB.NET
- HTML, CSS, JavaScript
- SQL Server / SQL Server Express
- ADO.NET
- ASP.NET ASMX Web Service
- Visual Studio 2010

## Web Service

`CampusCareService.asmx` provides:

```text
GetTotalIssues()
GetPendingIssues()
GetInProgressIssues()
GetResolvedIssues()
Database

Database: CampusConnectDB

Main tables:

Users
Complaints
Announcements
Project Structure
CampusCare/
├── Account/
├── AdminDashboard.aspx
├── AdminComplaints.aspx
├── AdminAnnouncements.aspx
├── Dashboard.aspx
├── Complaint.aspx
├── MyComplaints.aspx
├── EditComplaint.aspx
├── Announcements.aspx
├── CampusCareService.asmx
├── WebServiceDashboard.aspx
├── Web References/
├── Styles/
├── Scripts/
└── Web.config
```

## Getting Started:
1. Open the project in Visual Studio 2010.
2. Configure the CampusConnectDB database in SQL Server.
3. Update the connection string in Web.config.
4. Build and run the project.

## Project Purpose:
Developed as a Web Technology project to demonstrate ASP.NET Web Forms, VB.NET, SQL Server, ADO.NET, CRUD operations, authentication, session management, role-based access control, and XML Web Services.
