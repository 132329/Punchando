USE [master]
GO
/****** Object:  Database [SIGEC]    Script Date: 24/11/13 11:25:27 p. m. ******/
CREATE DATABASE [SIGEC]
GO
USE [SIGEC]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[controllerID] [int] NOT NULL,
	[displayName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[municipality] [varchar](50) NULL,
	[number] [varchar](20) NOT NULL,
	[sector] [varchar](50) NOT NULL,
	[street] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Analysis]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Analysis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createdBy] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Analysis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppointmentRules]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppointmentRules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[doctorID] [int] NOT NULL,
	[maxPatients] [int] NOT NULL,
	[consultationStart] [time](7) NOT NULL,
	[consultationEnd] [time](7) NOT NULL,
	[availableDays] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AppointmentRules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NOT NULL,
	[patientID] [int] NOT NULL,
	[appointmentDate] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[doctorID] [int] NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consultations]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [datetime] NULL,
	[patientID] [int] NOT NULL,
	[doctorID] [int] NOT NULL,
 CONSTRAINT [PK_Consultations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[speciality] [varchar](50) NOT NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistAppointments]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistAppointments](
	[ID] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NOT NULL,
	[patientID] [int] NOT NULL,
	[appointmentDate] [datetime] NOT NULL,
	[finalStatus] [varchar](20) NOT NULL,
	[doctorID] [int] NOT NULL,
 CONSTRAINT [PK_HiistAppointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Indications]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[consultationID] [int] NOT NULL,
	[patientID] [int] NOT NULL,
	[createDate] [datetime] NULL,
 CONSTRAINT [PK_Indications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[consultationID] ASC,
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Indications_Analysis]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indications_Analysis](
	[indicationID] [int] NOT NULL,
	[consultationID] [int] NOT NULL,
	[patientID] [int] NOT NULL,
	[analysisID] [int] NOT NULL,
 CONSTRAINT [PK_Indications_Analysis] PRIMARY KEY CLUSTERED 
(
	[indicationID] ASC,
	[consultationID] ASC,
	[patientID] ASC,
	[analysisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Indications_Procedures]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indications_Procedures](
	[indicationID] [int] NOT NULL,
	[consultationID] [int] NOT NULL,
	[patientID] [int] NOT NULL,
	[procedureID] [int] NOT NULL,
 CONSTRAINT [PK_Indications_Procedures] PRIMARY KEY CLUSTERED 
(
	[indicationID] ASC,
	[consultationID] ASC,
	[patientID] ASC,
	[procedureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Indications_Studies]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indications_Studies](
	[indicationID] [int] NOT NULL,
	[consultationID] [int] NOT NULL,
	[patientID] [int] NOT NULL,
	[studyID] [int] NOT NULL,
 CONSTRAINT [PK_Indications_Studies] PRIMARY KEY CLUSTERED 
(
	[indicationID] ASC,
	[consultationID] ASC,
	[patientID] ASC,
	[studyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Insurers]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Insurers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createDate] [datetime] NULL,
	[RNC] [varchar](50) NOT NULL,
	[addressID] [int] NULL,
	[status] [bit] NOT NULL,
	[createdBy] [int] NOT NULL,
 CONSTRAINT [PK_Insurers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Insurers_Phones]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurers_Phones](
	[insurerID] [int] NOT NULL,
	[phoneID] [int] NOT NULL,
 CONSTRAINT [PK_Insurers_Phones] PRIMARY KEY CLUSTERED 
(
	[insurerID] ASC,
	[phoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicines](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[usage] [varchar](200) NOT NULL,
	[dosage] [varchar](100) NOT NULL,
	[genericName] [varchar](50) NULL,
	[status] [bit] NOT NULL,
	[createdBy] [int] NOT NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[displayName] [varchar](50) NULL,
 CONSTRAINT [PK_Controller] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[createBy] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[lastConsultation] [datetime] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phones]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[number] [char](10) NOT NULL,
	[type] [int] NOT NULL,
	[notes] [varchar](200) NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[notes] [varchar](max) NOT NULL,
	[patientID] [int] NOT NULL,
	[consultationID] [int] NOT NULL,
 CONSTRAINT [PK_Prescriptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[patientID] ASC,
	[consultationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prescriptions_Medicines]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions_Medicines](
	[prescriptionID] [int] NOT NULL,
	[medicineID] [int] NOT NULL,
	[patientID] [int] NOT NULL,
	[consultationID] [int] NOT NULL,
 CONSTRAINT [PK_Prescriptions_Medicines] PRIMARY KEY CLUSTERED 
(
	[prescriptionID] ASC,
	[medicineID] ASC,
	[patientID] ASC,
	[consultationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Procedures]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Procedures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createdBy] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RolesActions]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesActions](
	[RoleID] [int] NOT NULL,
	[ActionID] [int] NOT NULL,
 CONSTRAINT [PK_RolesActions] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[ActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Studies]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Studies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createdBy] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Studies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[addressID] [int] NOT NULL,
	[bornDate] [datetime] NOT NULL,
	[createDate] [datetime] NULL,
	[dni] [varchar](20) NOT NULL,
	[email] [varchar](50) NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[gender] [char](1) NOT NULL,
	[maritalStatus] [char](1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[occupation] [varchar](50) NOT NULL,
	[lastVisit] [datetime] NULL,
	[password] [varchar](200) NOT NULL,
	[salt] [varchar](200) NOT NULL,
	[superUser] [bit] NULL,
	[religion] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users_Phones]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Phones](
	[userID] [int] NOT NULL,
	[phoneID] [int] NOT NULL,
 CONSTRAINT [PK_Users_Phones] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[phoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 24/11/13 11:25:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Actions] ON 

INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (1, N'Index', 1, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (2, N'Details', 1, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (3, N'Create', 1, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (4, N'Edit', 1, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (5, N'Delete', 1, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (6, N'Index', 2, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (7, N'Details', 2, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (8, N'Create', 2, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (9, N'ScheduleAppointment', 2, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (10, N'ScheduleDetails', 2, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (11, N'Edit', 2, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (12, N'Delete', 2, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (13, N'Index', 3, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (14, N'Details', 3, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (15, N'Create', 3, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (16, N'Edit', 3, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (17, N'Delete', 3, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (18, N'Index', 4, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (19, N'Details', 4, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (20, N'Create', 4, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (21, N'Edit', 4, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (22, N'Delete', 4, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (23, N'Index', 5, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (24, N'Details', 5, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (25, N'Create', 5, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (26, N'Edit', 5, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (27, N'Delete', 5, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (28, N'Index', 6, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (29, N'Details', 6, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (30, N'Create', 6, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (31, N'Edit', 6, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (32, N'Delete', 6, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (33, N'Index', 7, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (34, N'Details', 7, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (35, N'Create', 7, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (36, N'Edit', 7, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (37, N'Delete', 7, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (38, N'Index', 8, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (39, N'Details', 8, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (40, N'Create', 8, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (41, N'Edit', 8, NULL)
INSERT [dbo].[Actions] ([ID], [name], [controllerID], [displayName]) VALUES (42, N'Delete', 8, NULL)
SET IDENTITY_INSERT [dbo].[Actions] OFF
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([ID], [city], [municipality], [number], [sector], [street], [country]) VALUES (1, N'Ciudad', N'Municipio', N'Numero', N'Sector', N'Calle', N'Republica Dominicana')
INSERT [dbo].[Addresses] ([ID], [city], [municipality], [number], [sector], [street], [country]) VALUES (2, N'Santo Domingo', N'Santo Domingo Este', N'25', N'Los Mameyes', N'Sanchez', N'Republica Dominicana')
INSERT [dbo].[Addresses] ([ID], [city], [municipality], [number], [sector], [street], [country]) VALUES (3, N'Santo Domingo', N'Distrito Nacional', N'??', N'Zona Universitaria', N'-_-', N'Republica Dominicana')
INSERT [dbo].[Addresses] ([ID], [city], [municipality], [number], [sector], [street], [country]) VALUES (11, N'Santo Domingo', N'Distrito Nacional', N'102', N'Bella Vista', N'Bolivar', N'Republica Dominicana')
INSERT [dbo].[Addresses] ([ID], [city], [municipality], [number], [sector], [street], [country]) VALUES (12, N'Santo Domingo', N'Santo Domingo Este', N'13', N'Los Mina', N'Santa fe', N'Republica Dominicana')
INSERT [dbo].[Addresses] ([ID], [city], [municipality], [number], [sector], [street], [country]) VALUES (13, N'SD', N'SD', N'11', N'SD', N'SD', N'SD')
INSERT [dbo].[Addresses] ([ID], [city], [municipality], [number], [sector], [street], [country]) VALUES (14, N'Santo Domingo', N'Distrito Nacional', N'3', N'Los Mina', N'El progreso', N'Republica Dominicana')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Analysis] ON 

INSERT [dbo].[Analysis] ([ID], [name], [description], [createdBy], [createDate], [status]) VALUES (1, N'Hemograma', N'analisis de sangre', 1, CAST(0x0000A27101689CA3 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Analysis] OFF
SET IDENTITY_INSERT [dbo].[AppointmentRules] ON 

INSERT [dbo].[AppointmentRules] ([ID], [doctorID], [maxPatients], [consultationStart], [consultationEnd], [availableDays]) VALUES (1, 2, 10, CAST(0x0700964C40730000 AS Time), CAST(0x0700EC7572A30000 AS Time), N'1,3,5')
SET IDENTITY_INSERT [dbo].[AppointmentRules] OFF
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([ID], [speciality], [userID]) VALUES (2, N' ', 10)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
INSERT [dbo].[HistAppointments] ([ID], [createDate], [createUser], [patientID], [appointmentDate], [finalStatus], [doctorID]) VALUES (2, CAST(0x0000A28000EA264C AS DateTime), 9, 5, CAST(0x0000A28300000000 AS DateTime), N'Cancelled', 2)
SET IDENTITY_INSERT [dbo].[Insurers] ON 

INSERT [dbo].[Insurers] ([ID], [name], [createDate], [RNC], [addressID], [status], [createdBy]) VALUES (2, N'ARS Humano', CAST(0x0000A27B017E0AB8 AS DateTime), N'123-46419-6', 11, 1, 1)
SET IDENTITY_INSERT [dbo].[Insurers] OFF
INSERT [dbo].[Insurers_Phones] ([insurerID], [phoneID]) VALUES (2, 11)
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (1, N'AnalysisController', NULL)
INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (2, N'AppointmentsController', NULL)
INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (3, N'EmployeesController', NULL)
INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (4, N'InsurersController', NULL)
INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (5, N'MedicamentsController', NULL)
INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (6, N'PatientsController', NULL)
INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (7, N'ProceduresController', NULL)
INSERT [dbo].[Menus] ([ID], [name], [displayName]) VALUES (8, N'StudiesController', NULL)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([ID], [createBy], [userID], [lastConsultation]) VALUES (5, 1, 9, NULL)
SET IDENTITY_INSERT [dbo].[Patients] OFF
SET IDENTITY_INSERT [dbo].[Phones] ON 

INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (1, N'8093891620', 2, N'no llamar')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (2, N'8499931145', 2, N'N/A')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (3, N'8099898135', 2, N'N/A')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (4, N'8096020507', 4, N'Ninguna')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (5, N'8297278548', 5, N'No llamar')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (6, N'8094561123', 2, N'')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (7, N'8097471123', 4, N'N/A')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (9, N'8099611123', 2, N'Principal')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (11, N'8096020572', 2, N'')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (16, N'8095261231', 1, N'')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (18, N'8095464434', 2, N'')
INSERT [dbo].[Phones] ([ID], [number], [type], [notes]) VALUES (30, N'8094561133', 2, N'')
SET IDENTITY_INSERT [dbo].[Phones] OFF
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 1)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 3)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 4)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 5)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 6)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 7)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 8)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 9)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 10)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 11)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 12)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 13)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 14)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 15)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 16)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 17)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 18)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 19)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 20)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 21)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 22)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 23)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 24)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 25)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 26)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 27)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 28)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 29)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 30)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 31)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 32)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 33)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 34)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 35)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 36)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 37)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 38)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 39)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 40)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 41)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 42)
SET IDENTITY_INSERT [dbo].[Studies] ON 

INSERT [dbo].[Studies] ([ID], [name], [description], [createdBy], [createDate], [status]) VALUES (3, N'Ecocardiografía', N'Diagnóstico y evaluación de los ruidos anormales del corazón. Evaluar el tamaño de las cámaras cardíacas (ventrículos y aurículas). Evaluar el funcionamiento de las válvulas cardíacas. Debe ir acompañado por otras pruebas y estudios clínicos. Detección de tumores o acumulación de líquidos en el pericardio. Evaluar la función muscular cardíaca luego de un infarto de miocardio.', 1, CAST(0x0000A276015B633F AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Studies] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [addressID], [bornDate], [createDate], [dni], [email], [firstName], [lastName], [gender], [maritalStatus], [username], [status], [occupation], [lastVisit], [password], [salt], [superUser], [religion]) VALUES (1, 1, CAST(0x0000A271015EC19A AS DateTime), CAST(0x0000A271015EC19A AS DateTime), N'00000000000', N'mail@SIGEC.com', N'admin', N'istrador', N'M', N'S', N'admin', 1, N'Super Admin', CAST(0x0000A280017C40BF AS DateTime), N'3AAC6A976CBE22391B1786EF7EF3AE5D37472342CAC34FCE822BF28994356215F7BC91D35531DED5BAE29BB52DC00C09CE9A884ADAB65568AA98FA66A39EDA6C', N'BF08459B923E30216BA46F7DABC5D4879CDF3CF68451C39C62446BE4DC0EA6FCBEE01564F4C3421C18477FF7FE922FCB0B1A9E4EDB890AB598336B8CC8444C55', 1, NULL)
INSERT [dbo].[Users] ([ID], [addressID], [bornDate], [createDate], [dni], [email], [firstName], [lastName], [gender], [maritalStatus], [username], [status], [occupation], [lastVisit], [password], [salt], [superUser], [religion]) VALUES (2, 2, CAST(0x000082D500000000 AS DateTime), CAST(0x0000A2710171073F AS DateTime), N'22301087874', N'tnewlive@gmail.com', N'Carlos', N'Gonzalez Canario', N'M', N'S', N'carlos02', 1, N'Desarrollador', CAST(0x0000A280017C2F5D AS DateTime), N'8C4FE69290752FFF4BD87964100E50CFB21AC1B1CB661C3D8F45B64D537579F346356BBC681A895D5E2625B9C54F2967A573296E45E6C2DF72053D3FFA5C7148', N'7F568A33E90C66B2731477FA9EEB8E66FE3EF2D222679EE1314E2AA7B6413530CA5C6D9B72A5888ACF6D2E5E68DD5107BD4D742ECB81188C58C8C76CE2555E2F', 0, NULL)
INSERT [dbo].[Users] ([ID], [addressID], [bornDate], [createDate], [dni], [email], [firstName], [lastName], [gender], [maritalStatus], [username], [status], [occupation], [lastVisit], [password], [salt], [superUser], [religion]) VALUES (3, 3, CAST(0x0000801100000000 AS DateTime), CAST(0x0000A27200ADDD22 AS DateTime), N'00112345678', N'carlosliriano88@gmail.com', N'Carlos I.', N'Liriano V.', N'M', N'S', N'carlosl', 1, N'Otro', CAST(0x0000A278010BB138 AS DateTime), N'71A75CED44D840B0EB46FC64B4561F5D7DC90FFAB9084B959DC196ADD795A6A5EA4F71BDC3F483428AB4F03CE1753ED5EA07E86507890E883F5C792C2F8CC97C', N'CA2E73D2363A750704320C9A3BE7A5470433F479287A7E2D561D82DF90A5AA169891AE8551027E889A6BB7E129A578EC34EB0D9228ED47C7323017385C640F85', 0, NULL)
INSERT [dbo].[Users] ([ID], [addressID], [bornDate], [createDate], [dni], [email], [firstName], [lastName], [gender], [maritalStatus], [username], [status], [occupation], [lastVisit], [password], [salt], [superUser], [religion]) VALUES (9, 12, CAST(0x0000800D00000000 AS DateTime), CAST(0x0000A27D015B3922 AS DateTime), N'00145913267', N'juancito01@gmail.com', N'Juan', N'Perez', N'M', N'S', N'juan88', 1, N'Estudiante Universitario', CAST(0x0000A280017B626A AS DateTime), N'D568502FB49AC99CA85894C2062C0BBDF32B6C6E02988933E4011A8712F1A4557DAF5D09160597FE5DE1890C869F905E8430757D4DCADC0EC3A14677F4045691', N'32554A9C2252B9F51211D39533CEB48CC437F53BC1EE2E8CE88B5D6A78F13E0686C0F81EBF27C89B5404FF99625A413F62A90BEF47CF59C9634628C909168A91', 0, N'Católica')
INSERT [dbo].[Users] ([ID], [addressID], [bornDate], [createDate], [dni], [email], [firstName], [lastName], [gender], [maritalStatus], [username], [status], [occupation], [lastVisit], [password], [salt], [superUser], [religion]) VALUES (10, 14, CAST(0x000068D200000000 AS DateTime), CAST(0x0000A27E016F2259 AS DateTime), N'00146829135', N'freddyf@hotmail.com', N'Freddy ', N'Figeroa', N'M', N'C', N'freddy01', 1, N'Doctor', NULL, N'6048719732AF39DCCD292CB02936B5F78E0444C7CFD46321021B6CA248F59095F110E0486360CEF497400D0A4A950C1E61BE21E00D8289D68ABCC68F3AA58D76', N'7964613FC0BA48607E213482C6829F4A9D486E92B4C307AE7AD08C990957EEE61AE0E6926CDD3994CC69A0F90A74FD3F5670CB4167A4C804A8D4DF5661568F7E', 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[Users_Phones] ([userID], [phoneID]) VALUES (2, 1)
INSERT [dbo].[Users_Phones] ([userID], [phoneID]) VALUES (3, 2)
INSERT [dbo].[Users_Phones] ([userID], [phoneID]) VALUES (9, 16)
INSERT [dbo].[Users_Phones] ([userID], [phoneID]) VALUES (10, 30)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A271015EC094 AS DateTime), NULL, 0, NULL, 0, N'3AAC6A976CBE22391B1786EF7EF3AE5D37472342CAC34FCE822BF28994356215F7BC91D35531DED5BAE29BB52DC00C09CE9A884ADAB65568AA98FA66A39EDA6C', NULL, N'BF08459B923E30216BA46F7DABC5D4879CDF3CF68451C39C62446BE4DC0EA6FCBEE01564F4C3421C18477FF7FE922FCB0B1A9E4EDB890AB598336B8CC8444C55', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (4, N'Doctor')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (3, N'Employee')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Patient')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 3)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 3)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (9, 2)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (10, 4)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Phones_Number]    Script Date: 24/11/13 11:25:27 p. m. ******/
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [IX_Phones_Number] UNIQUE NONCLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160375DCCC4]    Script Date: 24/11/13 11:25:27 p. m. ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Analysis] ADD  CONSTRAINT [DF_Analysis_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Appointments] ADD  CONSTRAINT [DF_Appointments_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Insurers] ADD  CONSTRAINT [DF_Insurers_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Procedures] ADD  CONSTRAINT [DF_Procedures_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Studies] ADD  CONSTRAINT [DF_Studies_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_status]  DEFAULT ('True') FOR [status]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Menus] FOREIGN KEY([controllerID])
REFERENCES [dbo].[Menus] ([ID])
GO
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_Menus]
GO
ALTER TABLE [dbo].[Analysis]  WITH CHECK ADD  CONSTRAINT [FK_Analysis_Users] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Analysis] CHECK CONSTRAINT [FK_Analysis_Users]
GO
ALTER TABLE [dbo].[AppointmentRules]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentRules_Doctors] FOREIGN KEY([doctorID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[AppointmentRules] CHECK CONSTRAINT [FK_AppointmentRules_Doctors]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctors] FOREIGN KEY([doctorID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Doctors]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patients] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patients] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Patients]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Users] FOREIGN KEY([createUser])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Users]
GO
ALTER TABLE [dbo].[Consultations]  WITH CHECK ADD  CONSTRAINT [FK_Consultations_Doctors] FOREIGN KEY([doctorID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[Consultations] CHECK CONSTRAINT [FK_Consultations_Doctors]
GO
ALTER TABLE [dbo].[Consultations]  WITH CHECK ADD  CONSTRAINT [FK_Consultations_Patients] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patients] ([ID])
GO
ALTER TABLE [dbo].[Consultations] CHECK CONSTRAINT [FK_Consultations_Patients]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Users]
GO
ALTER TABLE [dbo].[Indications]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Consultations] FOREIGN KEY([consultationID])
REFERENCES [dbo].[Consultations] ([ID])
GO
ALTER TABLE [dbo].[Indications] CHECK CONSTRAINT [FK_Indications_Consultations]
GO
ALTER TABLE [dbo].[Indications]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Patients] FOREIGN KEY([patientID])
REFERENCES [dbo].[Patients] ([ID])
GO
ALTER TABLE [dbo].[Indications] CHECK CONSTRAINT [FK_Indications_Patients]
GO
ALTER TABLE [dbo].[Indications_Analysis]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Analysis_Analysis] FOREIGN KEY([analysisID])
REFERENCES [dbo].[Analysis] ([ID])
GO
ALTER TABLE [dbo].[Indications_Analysis] CHECK CONSTRAINT [FK_Indications_Analysis_Analysis]
GO
ALTER TABLE [dbo].[Indications_Analysis]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Analysis_Indications] FOREIGN KEY([indicationID], [consultationID], [patientID])
REFERENCES [dbo].[Indications] ([ID], [consultationID], [patientID])
GO
ALTER TABLE [dbo].[Indications_Analysis] CHECK CONSTRAINT [FK_Indications_Analysis_Indications]
GO
ALTER TABLE [dbo].[Indications_Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Procedures_Indications] FOREIGN KEY([indicationID], [consultationID], [patientID])
REFERENCES [dbo].[Indications] ([ID], [consultationID], [patientID])
GO
ALTER TABLE [dbo].[Indications_Procedures] CHECK CONSTRAINT [FK_Indications_Procedures_Indications]
GO
ALTER TABLE [dbo].[Indications_Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Procedures_Procedures] FOREIGN KEY([procedureID])
REFERENCES [dbo].[Procedures] ([ID])
GO
ALTER TABLE [dbo].[Indications_Procedures] CHECK CONSTRAINT [FK_Indications_Procedures_Procedures]
GO
ALTER TABLE [dbo].[Indications_Studies]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Studies_Indications] FOREIGN KEY([indicationID], [consultationID], [patientID])
REFERENCES [dbo].[Indications] ([ID], [consultationID], [patientID])
GO
ALTER TABLE [dbo].[Indications_Studies] CHECK CONSTRAINT [FK_Indications_Studies_Indications]
GO
ALTER TABLE [dbo].[Indications_Studies]  WITH CHECK ADD  CONSTRAINT [FK_Indications_Studies_Studies] FOREIGN KEY([studyID])
REFERENCES [dbo].[Studies] ([ID])
GO
ALTER TABLE [dbo].[Indications_Studies] CHECK CONSTRAINT [FK_Indications_Studies_Studies]
GO
ALTER TABLE [dbo].[Insurers]  WITH CHECK ADD  CONSTRAINT [FK_Insurers_Addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Insurers] CHECK CONSTRAINT [FK_Insurers_Addresses]
GO
ALTER TABLE [dbo].[Insurers]  WITH CHECK ADD  CONSTRAINT [FK_Insurers_Users] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Insurers] CHECK CONSTRAINT [FK_Insurers_Users]
GO
ALTER TABLE [dbo].[Insurers_Phones]  WITH CHECK ADD  CONSTRAINT [FK_Insurers_Phones_Insurers] FOREIGN KEY([insurerID])
REFERENCES [dbo].[Insurers] ([ID])
GO
ALTER TABLE [dbo].[Insurers_Phones] CHECK CONSTRAINT [FK_Insurers_Phones_Insurers]
GO
ALTER TABLE [dbo].[Insurers_Phones]  WITH CHECK ADD  CONSTRAINT [FK_Insurers_Phones_Phones] FOREIGN KEY([phoneID])
REFERENCES [dbo].[Phones] ([ID])
GO
ALTER TABLE [dbo].[Insurers_Phones] CHECK CONSTRAINT [FK_Insurers_Phones_Phones]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_Users] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicines_Users]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Users] FOREIGN KEY([createBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Users]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Users1] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Users1]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_Consultations] FOREIGN KEY([consultationID])
REFERENCES [dbo].[Consultations] ([ID])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_Consultations]
GO
ALTER TABLE [dbo].[Prescriptions_Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_Medicines_Medicines] FOREIGN KEY([medicineID])
REFERENCES [dbo].[Medicines] ([ID])
GO
ALTER TABLE [dbo].[Prescriptions_Medicines] CHECK CONSTRAINT [FK_Prescriptions_Medicines_Medicines]
GO
ALTER TABLE [dbo].[Prescriptions_Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_Medicines_Prescriptions] FOREIGN KEY([prescriptionID], [patientID], [consultationID])
REFERENCES [dbo].[Prescriptions] ([ID], [patientID], [consultationID])
GO
ALTER TABLE [dbo].[Prescriptions_Medicines] CHECK CONSTRAINT [FK_Prescriptions_Medicines_Prescriptions]
GO
ALTER TABLE [dbo].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Users] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Procedures] CHECK CONSTRAINT [FK_Procedures_Users]
GO
ALTER TABLE [dbo].[RolesActions]  WITH CHECK ADD  CONSTRAINT [FK_RolesActions_Actions] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Actions] ([ID])
GO
ALTER TABLE [dbo].[RolesActions] CHECK CONSTRAINT [FK_RolesActions_Actions]
GO
ALTER TABLE [dbo].[RolesActions]  WITH CHECK ADD  CONSTRAINT [FK_RolesActions_webpages_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RolesActions] CHECK CONSTRAINT [FK_RolesActions_webpages_Roles]
GO
ALTER TABLE [dbo].[Studies]  WITH CHECK ADD  CONSTRAINT [FK_Studies_Users] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Studies] CHECK CONSTRAINT [FK_Studies_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Addresses] FOREIGN KEY([addressID])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Addresses]
GO
ALTER TABLE [dbo].[Users_Phones]  WITH CHECK ADD  CONSTRAINT [FK_Users_Phones_Phones] FOREIGN KEY([phoneID])
REFERENCES [dbo].[Phones] ([ID])
GO
ALTER TABLE [dbo].[Users_Phones] CHECK CONSTRAINT [FK_Users_Phones_Phones]
GO
ALTER TABLE [dbo].[Users_Phones]  WITH CHECK ADD  CONSTRAINT [FK_Users_Phones_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Users_Phones] CHECK CONSTRAINT [FK_Users_Phones_Users]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Gender] CHECK  (([gender]='F' OR [gender]='M'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_Gender]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_MaritalStatus] CHECK  (([maritalStatus]='C' OR [maritalStatus]='S'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_MaritalStatus]
GO
USE [master]
GO
ALTER DATABASE [SIGEC] SET  READ_WRITE 
GO
