USE master
GO

DROP DATABASE IF EXISTS [BAZA]
GO

CREATE DATABASE [BAZA]
GO

USE [BAZA]
GO
/****** Object:  Schema [IT]    Script Date: 8.2.2019 11:52:16 ******/
CREATE SCHEMA [IT]
GO
/****** Object:  Table [IT].[ARTIKL]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[ARTIKL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](25) NOT NULL,
	[kategorija_artikla_id] [int] NOT NULL,
	[opis] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[GALERIJA_SLIKA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[GALERIJA_SLIKA](
	[oglas_id] [int] NOT NULL,
	[slika_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[oglas_id] ASC,
	[slika_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[JEDINICA_ARTIKLA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[JEDINICA_ARTIKLA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](25) NOT NULL,
	[opis] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[KATEGORIJA_ARTIKLA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[KATEGORIJA_ARTIKLA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](25) NOT NULL,
	[nadkategorija_artikla] [int] NULL,
	[opis] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[KOMENTAR]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[KOMENTAR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tekst] [varchar](1000) NOT NULL,
	[korisnik_id] [int] NOT NULL,
	[datum] [date] NOT NULL,
	[oglas_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[KORISNIK]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[KORISNIK](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[Ime] [varchar](50) NULL,
	[Prezime] [varchar](50) NULL,
	[Mobitel] [varchar](15) NULL,
	[IBAN] [varchar](25) NULL,
	[Lokacija_id] [int] NULL,
	[Mjesto_sjedenja] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[LOKACIJA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[LOKACIJA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Zgrada] [varchar](30) NOT NULL,
	[Kat] [varchar](30) NOT NULL,
	[Tvrtka] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[NARUDZBA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[NARUDZBA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oglas_id] [int] NOT NULL,
	[korisnik_id] [int] NOT NULL,
	[datum] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[OGLAS]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[OGLAS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](100) NOT NULL,
	[opis] [varchar](1000) NULL,
	[tip_id] [int] NOT NULL,
	[artikl_id] [int] NOT NULL,
	[cijena_artikla] [decimal](10, 2) NULL,
	[jedinica_artikla_id] [int] NOT NULL,
	[kolicina] [smallint] NOT NULL,
	[korisnik_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[datum] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[SLIKA_OGLASA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[SLIKA_OGLASA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lokacija_slike] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[STATUS_OGLASA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[STATUS_OGLASA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](25) NOT NULL,
	[opis] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [IT].[TIP_OGLASA]    Script Date: 8.2.2019 11:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IT].[TIP_OGLASA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](25) NOT NULL,
	[opis] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [IT].[ARTIKL] ON 
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (1, N'Rajèica', 1, N'Crvena slasna rajèica')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (2, N'Grah', 2, N'Domaæi grah')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (3, N'Jabuke', 1, N'Zelene  jabuke')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (4, N'Naranèe', 1, N'Jako dobre naranèe')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (5, N'Grožðe', 1, N'Fino grožðe')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (6, N'Mandarine', 1, N'Mandarine iz doline Neretve')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (7, N'Kupus', 2, N'Domaæi kupus')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (8, N'Kamilica', 6, N'Ljepše miriši uz kamilicu')
GO
INSERT [IT].[ARTIKL] ([id], [naziv], [kategorija_artikla_id], [opis]) VALUES (9, N'Marmelada', 6, N'Domaæa marmelada')
GO
SET IDENTITY_INSERT [IT].[ARTIKL] OFF
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (1, 1)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (2, 1)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (3, 2)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (4, 3)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (5, 5)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (5, 6)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (7, 7)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (8, 8)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (9, 9)
GO
INSERT [IT].[GALERIJA_SLIKA] ([oglas_id], [slika_id]) VALUES (10, 10)
GO
SET IDENTITY_INSERT [IT].[JEDINICA_ARTIKLA] ON 
GO
INSERT [IT].[JEDINICA_ARTIKLA] ([id], [naziv], [opis]) VALUES (1, N'kg', NULL)
GO
INSERT [IT].[JEDINICA_ARTIKLA] ([id], [naziv], [opis]) VALUES (2, N'komad', NULL)
GO
INSERT [IT].[JEDINICA_ARTIKLA] ([id], [naziv], [opis]) VALUES (3, N'g', NULL)
GO
INSERT [IT].[JEDINICA_ARTIKLA] ([id], [naziv], [opis]) VALUES (4, N'dag', NULL)
GO
INSERT [IT].[JEDINICA_ARTIKLA] ([id], [naziv], [opis]) VALUES (5, N'litra', NULL)
GO
SET IDENTITY_INSERT [IT].[JEDINICA_ARTIKLA] OFF
GO
SET IDENTITY_INSERT [IT].[KATEGORIJA_ARTIKLA] ON 
GO
INSERT [IT].[KATEGORIJA_ARTIKLA] ([id], [naziv], [nadkategorija_artikla], [opis]) VALUES (1, N'Voæe', NULL, NULL)
GO
INSERT [IT].[KATEGORIJA_ARTIKLA] ([id], [naziv], [nadkategorija_artikla], [opis]) VALUES (2, N'Povræe', NULL, NULL)
GO
INSERT [IT].[KATEGORIJA_ARTIKLA] ([id], [naziv], [nadkategorija_artikla], [opis]) VALUES (3, N'Piæe', NULL, NULL)
GO
INSERT [IT].[KATEGORIJA_ARTIKLA] ([id], [naziv], [nadkategorija_artikla], [opis]) VALUES (4, N'Orašasti plodovi', NULL, NULL)
GO
INSERT [IT].[KATEGORIJA_ARTIKLA] ([id], [naziv], [nadkategorija_artikla], [opis]) VALUES (5, N'Alkoholno piæe', 3, NULL)
GO
INSERT [IT].[KATEGORIJA_ARTIKLA] ([id], [naziv], [nadkategorija_artikla], [opis]) VALUES (6, N'Ostalo', NULL, NULL)
GO
SET IDENTITY_INSERT [IT].[KATEGORIJA_ARTIKLA] OFF
GO
SET IDENTITY_INSERT [IT].[KOMENTAR] ON 
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (1, N'Ovo je komentar', 1, CAST(N'2019-02-01' AS Date), 8)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (2, N'Isto komentar', 2, CAST(N'2019-02-02' AS Date), 9)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (3, N'Komentiram oglas', 3, CAST(N'2019-02-01' AS Date), 4)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (4, N'Želim 5 kg jabuka', 4, CAST(N'2019-01-08' AS Date), 3)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (5, N'Može meni 10 kila', 5, CAST(N'2019-01-30' AS Date), 3)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (6, N'Želim 2 kom marmelade', 6, CAST(N'2019-01-25' AS Date), 10)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (7, N'Može 3 kile paradajza', 7, CAST(N'2019-02-03' AS Date), 1)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (8, N'Želim kupit 5 kila paradajza', 8, CAST(N'2019-02-05' AS Date), 1)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (9, N'Može kila graha', 9, CAST(N'2019-01-26' AS Date), 2)
GO
INSERT [IT].[KOMENTAR] ([id], [tekst], [korisnik_id], [datum], [oglas_id]) VALUES (10, N'Komentiram oglas', 10, CAST(N'2019-02-04' AS Date), 7)
GO
SET IDENTITY_INSERT [IT].[KOMENTAR] OFF
GO
SET IDENTITY_INSERT [IT].[KORISNIK] ON 
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (1, N'matija.hanzekovic@king-ict.hr', N'Matija', N'Hanžekoviæ', N'0997689470', N'HR839482432434435', 1, N'Box 2')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (2, N'jure.ivanovic@king-ict.hr', N'Jure', N'Ivanoviæ', N'0993451234', N'HR538937842382345', 1, N'Box 3')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (3, N'neven.jakopcic@king-ict.hr', N'Neven', N'Jakopèiæ', N'09832782133', N'HR432908321213211', 2, N'Box 4')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (4, N'ena.glavac@king-ict.hr', N'Ena', N'Glavaè', N'09812378321', N'HR138791231884923', 3, N'Box 5')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (5, N'martin.rudic@king-ict.hr', N'Martin', N'Rudiæ', N'09923423425', N'HR123890321128454', 3, N'Box 6')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (6, N'stipe.serdarusic@king-ict.hr', N'Stipe', N'Serdarušiæ', N'09123489734', N'HR121243321435655', 2, N'Box 7')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (7, N'mateo.besten@gmail.com', N'Mateo', N'Besten', N'09832489237', N'HR010021324234323', 1, N'Box 8')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (8, N'lucija.gjerek@gmail.com', N'Lucija', N'Gjerek', N'09132489234', N'HR342923132903245', 2, N'Box 1')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (9, N'domagoj.turk@gmail.com', N'Domagoj', N'Turk', N'09914325346', N'HR923482903482309', 3, N'Box 9')
GO
INSERT [IT].[KORISNIK] ([id], [email], [Ime], [Prezime], [Mobitel], [IBAN], [Lokacija_id], [Mjesto_sjedenja]) VALUES (10, N'jole.grindole@gmail.com', N'Josip', N'Æulav', N'09842348233', N'HR904138190834904', 2, N'Box 10')
GO
SET IDENTITY_INSERT [IT].[KORISNIK] OFF
GO
SET IDENTITY_INSERT [IT].[LOKACIJA] ON 
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (1, N'King', N'1', N'King ICT')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (2, N'King', N'2', N'King ICT')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (3, N'King', N'1', N'King ICT')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (4, N'Msan', N'1', N'Msan')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (5, N'Msan', N'2', N'Msan')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (6, N'King', N'3', N'Aktivitis')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (7, N'Msan', N'2', N'King ICT')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (8, N'King', N'4', N'Planet IX')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (9, N'King', N'2', N'Msan')
GO
INSERT [IT].[LOKACIJA] ([id], [Zgrada], [Kat], [Tvrtka]) VALUES (10, N'Msan', N'3', N'King ICT')
GO
SET IDENTITY_INSERT [IT].[LOKACIJA] OFF
GO
SET IDENTITY_INSERT [IT].[NARUDZBA] ON 
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (1, 1, 1, CAST(N'2011-11-11' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (2, 3, 2, CAST(N'2019-02-05' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (3, 2, 3, CAST(N'2018-12-16' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (4, 4, 2, CAST(N'2019-02-07' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (5, 5, 4, CAST(N'2019-02-01' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (6, 6, 5, CAST(N'2019-01-24' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (7, 7, 6, CAST(N'2019-02-02' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (8, 5, 8, CAST(N'2015-05-05' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (9, 8, 7, CAST(N'2018-12-25' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (10, 10, 10, CAST(N'2010-10-10' AS Date))
GO
INSERT [IT].[NARUDZBA] ([id], [oglas_id], [korisnik_id], [datum]) VALUES (11, 9, 9, CAST(N'2018-09-11' AS Date))
GO
SET IDENTITY_INSERT [IT].[NARUDZBA] OFF
GO
SET IDENTITY_INSERT [IT].[OGLAS] ON 
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (1, N'Prodajem rajèice', N'', 1, 1, CAST(20.00 AS Decimal(10, 2)), 1, 30, 1, 1, CAST(N'2019-01-01' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (2, N'Prodajem grah', N'', 1, 2, CAST(10.00 AS Decimal(10, 2)), 1, 10, 2, 2, CAST(N'2019-01-20' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (3, N'Domaæe jabuke', N'', 1, 3, CAST(15.00 AS Decimal(10, 2)), 1, 40, 3, 2, CAST(N'2019-02-02' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (4, N'Prodajem naranèe', N'', 1, 4, CAST(20.00 AS Decimal(10, 2)), 1, 35, 4, 3, CAST(N'2019-02-03' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (5, N'Kupujem grožðe', N'', 2, 5, CAST(10.00 AS Decimal(10, 2)), 1, 20, 5, 3, CAST(N'2019-01-10' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (6, N'Kupujem mandarine', N'', 2, 6, CAST(25.00 AS Decimal(10, 2)), 1, 4, 6, 3, CAST(N'2019-01-15' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (7, N'Prodajem mandarine', N'', 1, 6, CAST(25.00 AS Decimal(10, 2)), 1, 30, 7, 2, CAST(N'2019-01-17' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (8, N'Prodajem kupus', N'', 1, 7, CAST(10.00 AS Decimal(10, 2)), 2, 25, 8, 1, CAST(N'2019-02-04' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (9, N'Kupujem kamilicu', N'', 2, 8, CAST(25.00 AS Decimal(10, 2)), 1, 2, 9, 3, CAST(N'2019-01-31' AS Date))
GO
INSERT [IT].[OGLAS] ([id], [naziv], [opis], [tip_id], [artikl_id], [cijena_artikla], [jedinica_artikla_id], [kolicina], [korisnik_id], [status_id], [datum]) VALUES (10, N'Prodajem marmeladu', N'', 1, 9, CAST(20.00 AS Decimal(10, 2)), 2, 24, 10, 3, CAST(N'2019-02-05' AS Date))
GO
SET IDENTITY_INSERT [IT].[OGLAS] OFF
GO
SET IDENTITY_INSERT [IT].[SLIKA_OGLASA] ON 
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (1, N'C:\Users\Matija\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (2, N'C:\Users\Neven\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (3, N'C:\Users\Jure\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (4, N'C:\Users\Ena\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (5, N'C:\Users\Jure\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (6, N'C:\Users\Martin\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (7, N'C:\Users\Stipe\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (8, N'C:\Users\Stipe\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (9, N'C:\Users\Matija\Pictures')
GO
INSERT [IT].[SLIKA_OGLASA] ([id], [lokacija_slike]) VALUES (10, N'C:\Users\Neven\Pictures')
GO
SET IDENTITY_INSERT [IT].[SLIKA_OGLASA] OFF
GO
SET IDENTITY_INSERT [IT].[STATUS_OGLASA] ON 
GO
INSERT [IT].[STATUS_OGLASA] ([id], [naziv], [opis]) VALUES (1, N'AKTIVAN', N'Oglas je aktivan')
GO
INSERT [IT].[STATUS_OGLASA] ([id], [naziv], [opis]) VALUES (2, N'NEAKTIVAN', N'Oglas nije aktivan')
GO
INSERT [IT].[STATUS_OGLASA] ([id], [naziv], [opis]) VALUES (3, N'SPREMLJEN', N'Oglas je spremljen')
GO
SET IDENTITY_INSERT [IT].[STATUS_OGLASA] OFF
GO
SET IDENTITY_INSERT [IT].[TIP_OGLASA] ON 
GO
INSERT [IT].[TIP_OGLASA] ([id], [naziv], [opis]) VALUES (1, N'Prodajem ', N'Prodajem proizvode')
GO
INSERT [IT].[TIP_OGLASA] ([id], [naziv], [opis]) VALUES (2, N'Kupujem', N'Kupujem proizvode')
GO
SET IDENTITY_INSERT [IT].[TIP_OGLASA] OFF
GO
ALTER TABLE [IT].[ARTIKL]  WITH CHECK ADD  CONSTRAINT [kategorija_artikla_FK] FOREIGN KEY([kategorija_artikla_id])
REFERENCES [IT].[KATEGORIJA_ARTIKLA] ([id])
GO
ALTER TABLE [IT].[ARTIKL] CHECK CONSTRAINT [kategorija_artikla_FK]
GO
ALTER TABLE [IT].[GALERIJA_SLIKA]  WITH CHECK ADD  CONSTRAINT [galerija_oglas_id_fk] FOREIGN KEY([oglas_id])
REFERENCES [IT].[OGLAS] ([id])
GO
ALTER TABLE [IT].[GALERIJA_SLIKA] CHECK CONSTRAINT [galerija_oglas_id_fk]
GO
ALTER TABLE [IT].[GALERIJA_SLIKA]  WITH CHECK ADD  CONSTRAINT [slika_id_fk] FOREIGN KEY([slika_id])
REFERENCES [IT].[SLIKA_OGLASA] ([id])
GO
ALTER TABLE [IT].[GALERIJA_SLIKA] CHECK CONSTRAINT [slika_id_fk]
GO
ALTER TABLE [IT].[KATEGORIJA_ARTIKLA]  WITH CHECK ADD  CONSTRAINT [nadkategorija_artikla_FK] FOREIGN KEY([nadkategorija_artikla])
REFERENCES [IT].[KATEGORIJA_ARTIKLA] ([id])
GO
ALTER TABLE [IT].[KATEGORIJA_ARTIKLA] CHECK CONSTRAINT [nadkategorija_artikla_FK]
GO
ALTER TABLE [IT].[KOMENTAR]  WITH CHECK ADD  CONSTRAINT [komentar_korisnik_id_fk] FOREIGN KEY([korisnik_id])
REFERENCES [IT].[KORISNIK] ([id])
GO
ALTER TABLE [IT].[KOMENTAR] CHECK CONSTRAINT [komentar_korisnik_id_fk]
GO
ALTER TABLE [IT].[KOMENTAR]  WITH CHECK ADD  CONSTRAINT [oglas_id_fk] FOREIGN KEY([oglas_id])
REFERENCES [IT].[OGLAS] ([id])
GO
ALTER TABLE [IT].[KOMENTAR] CHECK CONSTRAINT [oglas_id_fk]
GO
ALTER TABLE [IT].[KORISNIK]  WITH CHECK ADD  CONSTRAINT [Lokacija_id_FK] FOREIGN KEY([Lokacija_id])
REFERENCES [IT].[LOKACIJA] ([id])
GO
ALTER TABLE [IT].[KORISNIK] CHECK CONSTRAINT [Lokacija_id_FK]
GO
ALTER TABLE [IT].[NARUDZBA]  WITH CHECK ADD  CONSTRAINT [narudzba_korisnik_id_fk] FOREIGN KEY([korisnik_id])
REFERENCES [IT].[KORISNIK] ([id])
GO
ALTER TABLE [IT].[NARUDZBA] CHECK CONSTRAINT [narudzba_korisnik_id_fk]
GO
ALTER TABLE [IT].[NARUDZBA]  WITH CHECK ADD  CONSTRAINT [narudzba_oglas_id_fk] FOREIGN KEY([oglas_id])
REFERENCES [IT].[OGLAS] ([id])
GO
ALTER TABLE [IT].[NARUDZBA] CHECK CONSTRAINT [narudzba_oglas_id_fk]
GO
ALTER TABLE [IT].[OGLAS]  WITH CHECK ADD  CONSTRAINT [artikl_id_fk] FOREIGN KEY([artikl_id])
REFERENCES [IT].[ARTIKL] ([id])
GO
ALTER TABLE [IT].[OGLAS] CHECK CONSTRAINT [artikl_id_fk]
GO
ALTER TABLE [IT].[OGLAS]  WITH CHECK ADD  CONSTRAINT [jedinica_artikla_id_fk] FOREIGN KEY([jedinica_artikla_id])
REFERENCES [IT].[JEDINICA_ARTIKLA] ([id])
GO
ALTER TABLE [IT].[OGLAS] CHECK CONSTRAINT [jedinica_artikla_id_fk]
GO
ALTER TABLE [IT].[OGLAS]  WITH CHECK ADD  CONSTRAINT [korisnik_id_fk] FOREIGN KEY([korisnik_id])
REFERENCES [IT].[KORISNIK] ([id])
GO
ALTER TABLE [IT].[OGLAS] CHECK CONSTRAINT [korisnik_id_fk]
GO
ALTER TABLE [IT].[OGLAS]  WITH CHECK ADD  CONSTRAINT [status_id_fk] FOREIGN KEY([status_id])
REFERENCES [IT].[STATUS_OGLASA] ([id])
GO
ALTER TABLE [IT].[OGLAS] CHECK CONSTRAINT [status_id_fk]
GO
ALTER TABLE [IT].[OGLAS]  WITH CHECK ADD  CONSTRAINT [tip_id_fk] FOREIGN KEY([tip_id])
REFERENCES [IT].[TIP_OGLASA] ([id])
GO
ALTER TABLE [IT].[OGLAS] CHECK CONSTRAINT [tip_id_fk]
GO
