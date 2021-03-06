SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Semester]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Semester](
	[SemesterID] [char](6) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[PersonID] [nvarchar](16) NOT NULL,
	[GivenName] [nvarchar](32) NOT NULL,
	[FamilyName] [char](32) NOT NULL,
	[FullName] [char](65) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paper]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paper](
	[PaperID] [nvarchar](10) NOT NULL,
	[PaperName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Paper] PRIMARY KEY CLUSTERED 
(
	[PaperID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaperInstance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaperInstance](
	[PaperID] [nvarchar](10) NOT NULL,
	[SemesterID] [char](6) NOT NULL,
 CONSTRAINT [PK_PaperInstance] PRIMARY KEY CLUSTERED 
(
	[PaperID] ASC,
	[SemesterID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrolment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enrolment](
	[PaperID] [nvarchar](10) NOT NULL,
	[SemesterID] [char](6) NOT NULL,
	[PersonID] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_Enrolment] PRIMARY KEY CLUSTERED 
(
	[PaperID] ASC,
	[SemesterID] ASC,
	[PersonID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PaperInstance_Paper]') AND parent_object_id = OBJECT_ID(N'[dbo].[PaperInstance]'))
ALTER TABLE [dbo].[PaperInstance]  WITH CHECK ADD  CONSTRAINT [FK_PaperInstance_Paper] FOREIGN KEY([PaperID])
REFERENCES [dbo].[Paper] ([PaperID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PaperInstance_Semester]') AND parent_object_id = OBJECT_ID(N'[dbo].[PaperInstance]'))
ALTER TABLE [dbo].[PaperInstance]  WITH CHECK ADD  CONSTRAINT [FK_PaperInstance_Semester] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrolment_PaperInstance]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrolment]'))
ALTER TABLE [dbo].[Enrolment]  WITH CHECK ADD  CONSTRAINT [FK_Enrolment_PaperInstance] FOREIGN KEY([PaperID], [SemesterID])
REFERENCES [dbo].[PaperInstance] ([PaperID], [SemesterID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrolment_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrolment]'))
ALTER TABLE [dbo].[Enrolment]  WITH NOCHECK ADD  CONSTRAINT [FK_Enrolment_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrolment] CHECK CONSTRAINT [FK_Enrolment_Person]

/*
insert Paper
select * from IN705_201902_krissiw..Paper
go

insert Semester
select * from IN705_201902_krissiw..Semester
go

insert PaperInstance
select * from IN705_201902_krissiw..PaperInstance
go

insert Person
select * from IN705_201902_krissiw..Person
go

insert Enrolment
select * from IN705_201902_krissiw..Enrolment
go
*/