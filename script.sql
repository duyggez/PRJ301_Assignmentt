USE [AssignmentSP2024]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[leid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[isPresent] [bit] NOT NULL,
	[capturedtime] [datetime] NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lession]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lession](
	[leid] [int] IDENTITY(1,1) NOT NULL,
	[gid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[isAttended] [bit] NOT NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[leid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleid] [int] NOT NULL,
	[rolename] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[username] [varchar](150) NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[roleid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_StudentGroup] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[suname] [varchar](150) NOT NULL,
	[credit] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 3/6/2024 9:42:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[tname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'student', N'123', N'Student A')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'test', N'123', N'Nguyen Thi Thu Thuy')
GO
SET IDENTITY_INSERT [dbo].[Attendence] ON 

INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1002, 2, 1, N'XXX', 1, CAST(N'2024-03-01T11:47:43.963' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1003, 2, 2, N'AA', 1, CAST(N'2024-03-01T11:47:43.963' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1004, 2, 3, N'XX', 0, CAST(N'2024-03-01T11:47:43.963' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1005, 2, 4, N'GEGEGEEGEG', 1, CAST(N'2024-03-01T11:47:43.963' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1010, 1, 1, N'Stupid', 1, CAST(N'2024-03-01T11:50:31.363' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1011, 1, 2, N'Stupid', 1, CAST(N'2024-03-01T11:50:31.363' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1012, 1, 3, N'co mat', 1, CAST(N'2024-03-01T11:50:31.363' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1013, 1, 4, N'co mat', 1, CAST(N'2024-03-01T11:50:31.363' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2002, 3, 1, N'C', 1, CAST(N'2024-03-01T14:22:36.770' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2003, 3, 2, N'B', 1, CAST(N'2024-03-01T14:22:36.770' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2004, 3, 3, N'A', 1, CAST(N'2024-03-01T14:22:36.770' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2005, 3, 4, N'', 0, CAST(N'2024-03-01T14:22:36.770' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2006, 4, 1, N'', 1, CAST(N'2024-03-01T14:22:44.623' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2007, 4, 2, N'', 1, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2008, 4, 3, N'', 0, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2009, 4, 4, N'', 0, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2010, 4, 5, N'', 0, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2026, 5, 1, N'', 0, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2027, 5, 2, N'X', 0, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2028, 5, 3, N'X', 0, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2029, 5, 4, N'X', 1, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2030, 5, 5, N'', 1, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2033, 1003, 1, N'ABC', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2034, 1003, 2, N'', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2035, 1003, 3, N'', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2036, 1003, 4, N'', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2037, 1003, 5, N'', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[Attendence] OFF
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 2)
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'View Lecturer Timetable', N'/lecturer/timetable')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Lecturer Take Attendance', N'/lecturer/att')
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'sonnt')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N'thuyntt')
GO
SET IDENTITY_INSERT [dbo].[Lession] ON 

INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1, 1, 1, 1, 1, CAST(N'2024-02-28' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (2, 1, 1, 1, 1, CAST(N'2024-03-01' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (3, 1, 1, 1, 1, CAST(N'2024-03-06' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (4, 2, 2, 1, 2, CAST(N'2024-02-28' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (5, 2, 2, 1, 2, CAST(N'2024-03-01' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1003, 2, 2, 2, 2, CAST(N'2024-03-02' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Lession] OFF
GO
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (1, N'Lecturer')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (2, N'Student')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (3, N'Test')
GO
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'sonnt', 1)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'test', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'test', 3)
GO
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (3, 1)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'BE102')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'DE112')
GO
INSERT [dbo].[Student] ([sid], [sname]) VALUES (1, N'Student 1')
INSERT [dbo].[Student] ([sid], [sname]) VALUES (2, N'Student 2')
INSERT [dbo].[Student] ([sid], [sname]) VALUES (3, N'Student 3')
INSERT [dbo].[Student] ([sid], [sname]) VALUES (4, N'Student 4')
INSERT [dbo].[Student] ([sid], [sname]) VALUES (5, N'Student 5')
INSERT [dbo].[Student] ([sid], [sname]) VALUES (6, N'Student 6')
INSERT [dbo].[Student] ([sid], [sname]) VALUES (7, N'Student 7')
GO
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (1, N'SE1818-PRJ301', 1, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (2, N'SE1818-Math', 2, 2)
GO
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (1, N'PRJ301', 3)
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (2, N'Math', 3)
GO
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (1, N'Slot 1')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (2, N'Slot 2')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (3, N'Slot 3')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (4, N'Slot 4')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (5, N'Slot 5')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (6, N'Slot 6')
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession1] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession1]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_StudentGroup]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Lecturer]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Room]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_StudentGroup]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_TimeSlot]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Lecturer]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Subject]
GO
