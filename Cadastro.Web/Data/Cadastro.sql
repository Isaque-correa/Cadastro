USE [master]
GO
/****** Object:  Database [Cadastro]    Script Date: 02/01/2025 00:36:57 ******/
CREATE DATABASE [Cadastro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cadastro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cadastro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cadastro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cadastro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cadastro] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cadastro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cadastro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cadastro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cadastro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cadastro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cadastro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cadastro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cadastro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cadastro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cadastro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cadastro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cadastro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cadastro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cadastro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cadastro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cadastro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cadastro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cadastro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cadastro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cadastro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cadastro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cadastro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cadastro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cadastro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cadastro] SET  MULTI_USER 
GO
ALTER DATABASE [Cadastro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cadastro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cadastro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cadastro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cadastro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cadastro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cadastro] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cadastro] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cadastro]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/01/2025 00:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](140) NOT NULL,
	[Telefone] [varchar](15) NOT NULL,
	[CPF] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 02/01/2025 00:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[IdEndereco] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Cidade] [varchar](140) NOT NULL,
	[Estado] [varchar](140) NOT NULL,
	[Logradouro] [varchar](500) NOT NULL,
	[CEP] [varchar](9) NOT NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[IdEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Cliente1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Cliente1]
GO
USE [master]
GO
ALTER DATABASE [Cadastro] SET  READ_WRITE 
GO
