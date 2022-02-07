SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](150) NOT NULL,
	[Password] [nvarchar] (150) NOT NULL,
 CONSTRAINT [PK_Authorization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Drivers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar] (50) NOT NULL,
	[MiddleName] [nvarchar] (50) NULL,
	[LastName] [nvarchar] (50) NOT NULL,
	[PassportSerial] [nvarchar] (10) NULL,
	[PassportNumber] [nvarchar] (10) NULL,
	[Postcode] [nvarchar] (20) NULL,
	[Address] [nvarchar] (max) NULL,
	[Company] [nvarchar] (100) NULL,
	[JobName] [nvarchar] (100) NULL,
	[Phone] [nvarchar] (15) NULL,
	[Email] [nvarchar] (100) NULL,
	[Photo] [nvarchar] (50) NULL,
	[Description] [nvarchar] (max) NULL,
	CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar] (100) NOT NULL,
	[TechnicalCategory] [nvarchar] (100) NULL,
	CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Licences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NOT NULL,
	[LicenceDate] [date] NULL,
	[ExpireDate] [date] NULL,
	[CategoryID] [int] NOT NULL,
	[LicenceSeries] [nvarchar] (4) NULL,
	[LicenceNumber] [nvarchar] (6) NULL,
	[StatusID] [int] NOT NULL,
	CONSTRAINT [PK_Licences] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Statuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar] (50) NULL,
	[Description] [nvarchar] (max) NULL,
	CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar] (50) NULL,
	CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Cars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NOT NULL,
	[LicenceID] [int] NOT NULL,
	[VIN] [nvarchar] (50) NULL,
	[ManufacturerID] [int] NOT NULL,
	[Model] [nvarchar] (100) NOT NULL,
	[Year] [int] NULL,
	[Weight] [int] NULL,
	[Color] [int] NULL,
	[EngineType] [int] NOT NULL,
	[TypeOfDriveID] [int] NOT NULL,
	CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[TypesOfDrive](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfDrive] [nvarchar] (100) NOT NULL,
	CONSTRAINT [PK_TypesOfDrive] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Licences]  WITH CHECK ADD  CONSTRAINT [FK_Licences_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([ID])
GO
ALTER TABLE [dbo].[Licences] CHECK CONSTRAINT [FK_Licences_StatusID]
GO
ALTER TABLE [dbo].[Licences]  WITH CHECK ADD  CONSTRAINT [FK_Licences_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Licences] CHECK CONSTRAINT [FK_Licences_CategoryID]
GO

ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Drivers] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Drivers] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Drivers]
GO

ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Licences] FOREIGN KEY([LicenceID])
REFERENCES [dbo].[Licences] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Licences]
GO

ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Manufacturer]
GO

ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_TypesOfDrive] FOREIGN KEY([TypeOfDriveID])
REFERENCES [dbo].[TypesOfDrive] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_TypesOfDrive]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Drivers] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Drivers] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Drivers]
GO

ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Licences] FOREIGN KEY([LicenceID])
REFERENCES [dbo].[Licences] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Licences]
GO

ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Manufacturer]
GO

ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_TypesOfDrive] FOREIGN KEY([TypeOfDriveID])
REFERENCES [dbo].[TypesOfDrive] ([ID])
GO

ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_TypesOfDrive]
GO

