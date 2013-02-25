
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 02/25/2013 02:04:02
-- Generated from EDMX file: c:\users\entroper\documents\visual studio 2012\Projects\EloTracker\EloDataModel\EloContainer.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EloTracker];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_GameGameType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Games] DROP CONSTRAINT [FK_GameGameType];
GO
IF OBJECT_ID(N'[dbo].[FK_GameScoreGame]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GameScores] DROP CONSTRAINT [FK_GameScoreGame];
GO
IF OBJECT_ID(N'[dbo].[FK_GameScorePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GameScores] DROP CONSTRAINT [FK_GameScorePlayer];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Players]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Players];
GO
IF OBJECT_ID(N'[dbo].[GameTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GameTypes];
GO
IF OBJECT_ID(N'[dbo].[Games]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games];
GO
IF OBJECT_ID(N'[dbo].[GameScores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GameScores];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Players'
CREATE TABLE [dbo].[Players] (
    [PlayerID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'GameTypes'
CREATE TABLE [dbo].[GameTypes] (
    [GameTypeID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Games'
CREATE TABLE [dbo].[Games] (
    [GameID] int IDENTITY(1,1) NOT NULL,
    [GameTypeID] int  NOT NULL
);
GO

-- Creating table 'GameScores'
CREATE TABLE [dbo].[GameScores] (
    [GameID] int  NOT NULL,
    [PlayerID] int  NOT NULL,
    [Score] real  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PlayerID] in table 'Players'
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [PK_Players]
    PRIMARY KEY CLUSTERED ([PlayerID] ASC);
GO

-- Creating primary key on [GameTypeID] in table 'GameTypes'
ALTER TABLE [dbo].[GameTypes]
ADD CONSTRAINT [PK_GameTypes]
    PRIMARY KEY CLUSTERED ([GameTypeID] ASC);
GO

-- Creating primary key on [GameID] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [PK_Games]
    PRIMARY KEY CLUSTERED ([GameID] ASC);
GO

-- Creating primary key on [GameID], [PlayerID] in table 'GameScores'
ALTER TABLE [dbo].[GameScores]
ADD CONSTRAINT [PK_GameScores]
    PRIMARY KEY CLUSTERED ([GameID], [PlayerID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [GameTypeID] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [FK_GameGameType]
    FOREIGN KEY ([GameTypeID])
    REFERENCES [dbo].[GameTypes]
        ([GameTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GameGameType'
CREATE INDEX [IX_FK_GameGameType]
ON [dbo].[Games]
    ([GameTypeID]);
GO

-- Creating foreign key on [GameID] in table 'GameScores'
ALTER TABLE [dbo].[GameScores]
ADD CONSTRAINT [FK_GameScoreGame]
    FOREIGN KEY ([GameID])
    REFERENCES [dbo].[Games]
        ([GameID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PlayerID] in table 'GameScores'
ALTER TABLE [dbo].[GameScores]
ADD CONSTRAINT [FK_GameScorePlayer]
    FOREIGN KEY ([PlayerID])
    REFERENCES [dbo].[Players]
        ([PlayerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GameScorePlayer'
CREATE INDEX [IX_FK_GameScorePlayer]
ON [dbo].[GameScores]
    ([PlayerID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------