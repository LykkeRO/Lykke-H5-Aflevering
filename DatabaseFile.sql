USE [master]
GO
/****** Object:  Database [EventSystem]    Script Date: 16-09-2016 13:09:03 ******/
CREATE DATABASE [EventSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventSystem', FILENAME = N'C:\Users\lykk0431\EventSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EventSystem_log', FILENAME = N'C:\Users\lykk0431\EventSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EventSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventSystem] SET  MULTI_USER 
GO
ALTER DATABASE [EventSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EventSystem]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[EventStart] [datetime] NOT NULL,
	[EventEnd] [datetime] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[NoOfTickets] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[FK_Category] [int] NOT NULL,
	[FK_Location] [int] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventsInOrders]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsInOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Event] [int] NOT NULL,
	[FK_Order] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_EventsInOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[Zipcode] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Media]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[FK_Type] [int] NOT NULL,
	[FK_Event] [int] NOT NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaTypes]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MediaTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Customer] [int] NOT NULL,
	[FK_Status] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewCustomerOrders]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCustomerOrders]
AS
SELECT        dbo.Orders.Id, dbo.Orders.Created, dbo.Customers.FirstName, dbo.Customers.LastName, dbo.Customers.Adress, dbo.Customers.ZipCode, dbo.Customers.City, dbo.Status.Name AS StatusName, 
                         dbo.EventsInOrders.Quantity, dbo.Events.Name AS EventName, dbo.Events.EventStart, dbo.Events.EventEnd, dbo.Events.Price, dbo.Events.NoOfTickets, dbo.Events.Description, 
                         dbo.Location.Adress AS EventAdress, dbo.Location.Zipcode AS EventZipCode, dbo.Location.City AS EventCity
FROM            dbo.Orders INNER JOIN
                         dbo.Customers ON dbo.Orders.FK_Customer = dbo.Customers.Id INNER JOIN
                         dbo.Status ON dbo.Orders.FK_Status = dbo.Status.Id INNER JOIN
                         dbo.EventsInOrders ON dbo.Orders.Id = dbo.EventsInOrders.FK_Order INNER JOIN
                         dbo.Events ON dbo.EventsInOrders.FK_Event = dbo.Events.Id INNER JOIN
                         dbo.Location ON dbo.Events.FK_Location = dbo.Location.Id


GO
/****** Object:  View [dbo].[ViewEvent]    Script Date: 16-09-2016 13:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEvent]
AS
SELECT        dbo.Events.Id, dbo.Events.Name, dbo.Events.EventStart, dbo.Events.EventEnd, dbo.Events.Price, dbo.Events.NoOfTickets, dbo.Events.Description, dbo.Location.Adress, dbo.Location.Zipcode, dbo.Location.City, 
                         dbo.Categories.Name AS CategoryName
FROM            dbo.Events INNER JOIN
                         dbo.Location ON dbo.Events.FK_Location = dbo.Location.Id INNER JOIN
                         dbo.Categories ON dbo.Events.FK_Category = dbo.Categories.Id


GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Musik')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Mad')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Underholdning')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Natteliv')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Teater')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Kunst')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Sport')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Outdoor')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Foredrag')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Kurser')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Velgørenhed')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Andet')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Adress], [ZipCode], [City]) VALUES (1, N'Thomas', N'Boeriis', N'Dybbølvej 8 1.tv', 8240, N'Risskov')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Adress], [ZipCode], [City]) VALUES (2, N'Per', N'Nielsen', N'Vittrupvej 5', 7800, N'Skive')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Adress], [ZipCode], [City]) VALUES (4, N'Katrine', N'Trankjær', N'Dybbølvej 8 1.tv', 8240, N'Risskov')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (4, N'Imaginaire Collectif feat. Uffe Steen', CAST(N'2016-09-14 20:00:00.000' AS DateTime), CAST(N'2016-09-15 00:00:00.000' AS DateTime), CAST(50.00 AS Decimal(18, 2)), 250, N'Inspired by the current pop culture, at the hedge of several genres, the "Imaginaire Collectif" (literally translated collective psyche) is nevertheless not fallen into an identity crisis. Juggling inventively with the power of Rock inspired by Radiohead, Nirvana or Frank Zappa and the subtlety and freedom of Jazz inspired by the Greats. This band gathers together the two young danish musicians: Jens Mikkel Madsen and Daniel Sommer with the swiss guitar player Anatole Buccella to give an explosive mix tasting like melted Gruyère over a Rugbrød (What?) but definitely sounding like a powerful rock trio (Yeah!).', 1, 1)
INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (5, N'
Aztek + Capacity @ Fatter Eskil', CAST(N'2016-09-14 23:45:00.000' AS DateTime), CAST(N'2016-09-15 02:00:00.000' AS DateTime), CAST(50.00 AS Decimal(18, 2)), 250, N'Forsalgsbilletten er inkl. en Royal Pilsner fra TAK ROCK som tak for din støtte til originalmusikken. Også alm. dørsalg (uden øl) fra kl. 20:00.

Aztek
5 mand store Aztek er et progressivt rockband fra det mørke Jylland. Et band funderet i rocktraditionen, men med brede referencer til alt fra jazz, pop, klassisk m.m.

Sangene rummer både tonstunge riffs og fine melodiøse passager og forsøger i det hele taget at dyrke kontrasterne i lydbilledet. I centrum er den aggressive energi og glæden ved at spille (alt for) højt.

Aztek er:
Benjamin Vestergaard - vokal 
Minik Lundblad – guitar 
Jeppe Søndergaard - guitar 
Rasmus Lykke – bas
Michael Buchardt – trommer

Capacity - Afskedskoncert
Capacity er et rock band fra Silkeborg, dannet i 2006, der tager udgangspunkt i den tunge ende af rockmusikken, blandet med et godt groove. Inspirationen er hentet i de gamle rocktraditioner, som bandet sætter deres helt eget eget præg på med tunge grooves og skæve tonearter.

De seneste par år har Capacity spillet et væld af koncerter, varmet op for Black City, optrådt på Samsø Festival og indspillet og udgivet tre EP’er og to singler, og bandet har taget et stort skridt på vejen til at skabe sig et solidt fundament på den danske undergrunds-rockscene. Det til trods, har de fem silkeborgensere nu valgt at gå andre veje hver for sig, og denne koncert på Fatter Eskil bliver således deres sidste.

Kom og oplev Capacity fyre den af én sidste gang!

Capacity er:
Lead vocals: Jonas Eriksen 
Bass: Stefan Nielsen
Drums: Emil Klinkby
Lead/Rhythm guitar & backing vokals: Jeppe Rasmussen & Emil Damgaard Andersen', 1, 1)
INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (17, N'
Nyt Parti: Jorden Frihed Kundskab foredrag i Aarhus.', CAST(N'2016-09-15 19:00:00.000' AS DateTime), CAST(N'2016-09-15 22:00:00.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)), 100, N'Gennemgang af nogle af Partiet Jorden Frihed Kundskabs mærkesager.

Jorden Frihed Kundskab vil nationalisere centralbanken og lave en folkeejet nationalbank, der udsteder penge direkte ind på befolkningens konto i nationalbanken.', 1, 1)
INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (18, N'Victors foældre skal skilles', CAST(N'2016-09-16 20:00:00.000' AS DateTime), CAST(N'2016-09-16 21:30:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 250, N'<span style="color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;">For godt og vel to år siden blev Victor Lander''s forældre skilt. To år skulle det også tage ham, før han selv kunne se de sjove aspekter i nu, at kunne kalde sig selv for skilsmisse-barn/voksen. I showet fortæller Victor om sin hverdag efter forældrenes brud og hvordan, trods ikke længere at være et barn, stadig til tider kan føle sig som et. Se Victor Lander gøre selv de mest følsomme emner hylende morsomme med sin karakteristiske barnlige sjæl og skæve formuleringer.</span>', 3, 3)
INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (19, N'Sjovt nok', CAST(N'2016-09-17 19:00:00.000' AS DateTime), CAST(N'2016-09-17 20:30:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 250, N'<p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">I Audreys nye show ”Sjovt nok” er der intet emne der har helle på væggen. Med lynskarp præcision kigger hun indad og laver en vurdering af hendes liv som kvinde og det liv hun har levet op til nu. Det her er selvironiens holdeplads, sårbart, hudløst ærligt og så sjovt, at det har fået selv mænd til at græde af grin.&nbsp;<br style="box-sizing: inherit; margin-bottom: 0px;">Det er stand up for voksne og stand up når det er bedst. Sjovt, ærligt og nærværende.</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Anmeldelser:</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Lotte Reimar Ekstrabladet:<br style="box-sizing: inherit;">"Der er ikke noget bedre end at grine, så tårerne triller ned af kinderne og så man får helt ondt i kæberne!&nbsp;<br style="box-sizing: inherit; margin-bottom: 0px;">Igår var jeg inde og se Audrey Castañedas one man show. Det var ikke bare det sjoveste show jeg har set i mange år...men jeg må sgu bøje mig i støvet af respekt, for Audrey''s evne til at underholde, samtidig med at hun på fineste måde bringer vigtige budskaber frem. Modigt, autentisk og hylende morsomt!</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Britta Bjerre redaktør på Bladet Søndag:Tak for show i aftes. Så fik man da lige grinet igennem. Og tænkt over mange ting bagefter.</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Publikum:</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Hold k......jeg græd af grin. Tak for et fantastisk show, du er sku en elskling</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Hvis jeg nu var en kulturel anmelder så ville jeg skrive en anmeldelse circa sådan her :&nbsp;<a href="https://www.facebook.com/audrey.castaneda.12" rel="nofollow" style="box-sizing: inherit; transition: all 0.2s ease-in-out; color: rgb(19, 119, 251); outline: none; margin-bottom: 0px; background-color: transparent;"><u style="box-sizing: inherit; margin-bottom: 0px;">Audrey Castañeda</u></a>&nbsp;- Sjovt nok ..handler det ikke om et bryllup ..! Hold nu op ..magen til kvindemenneske er et sjældent syn og oplevelse ..Hun er hudløs ærlig ..hudløs rå sjov og henrivende ..Hun formår VIRKELIG at få sat tingenes tilstand på spidsen ..SPOT ON man griner ..græder ..af grin og nikker genkendende til de " skavanker " man får når man bliver ældre og får rynker og en delle eller to for meget ... at Være kvinde med stort Q ....Når gartneren har fri ..Når man bliver kattedamen på 4.sal ....og meget meget mere .. Audrey ..Jeg er hudløs ærlig når jeg siger at du er Femme Fantastique !!! Sjovt nok er jeg ikke anmelder ...</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 0px; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Det var en fantastisk aften!! Noget af det sjoveste jeg nogensinde har oplevet! Tårerne trillede mange gange! Tak for en dejlig oplevelse</p>', 1, 3)
INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (20, N'The Doors Tribute', CAST(N'2016-09-17 21:30:00.000' AS DateTime), CAST(N'2016-09-17 23:30:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 500, N'<p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">THE DOORS TRIBUTE [TDT] hylder legenderne ved at genskabe magien og intensiteten af The Doors'' musikalske katalog i en udsøgt koncertoplevelse. Det er et must-see for alle Doors-fans, og for alle der ønsker, at opleve en fantastisk og unik genskabelse af deres musik.</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 0px; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Ved brug af vintage udstyr og moderne instrumenter til at replikere fornemmelsen og auraen fra studieoptagelserne, er målet at give et publikum et fuldstændigt live-spektrum af The Doors'' mange facetter og alsidighed.<br style="box-sizing: inherit;"><br style="box-sizing: inherit;">Dette er IKKE det lidt vanlige kopi og look-a-like kostume-show! Medlemmerne af [TDT] er ikke kun velkendte og etablerede professionelle musikere og kunstnere, men har et tilhørsforhold i stil og musikalsk arv, der komplimenterer den oprindelige Doors besætning. Man kan godt sige, at deres engagement i denne musik er et udslag af lige dele kærlighed, respekt &amp; beundring:<br style="box-sizing: inherit; margin-bottom: 0px;">"Vi føler os ret beærede over muligheden for, at viderelevere denne legendariske musik til en ny generation af potentielle lyttere og give den ældre et nostalgisk glimt tilbage til en tid, hvor konventionerne blev udfordret og der for alvor var revolution i luften.”</p>', 1, 4)
INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (21, N'Foredrag med Anna Zink', CAST(N'2016-09-18 07:30:00.000' AS DateTime), CAST(N'2016-09-18 10:30:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 500, N'<span style="color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;">Foredrag: En personlig beretning om skizofreni</span><br style="box-sizing: inherit; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;"><span style="color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;">Anna spørger, Vidste du at 1/3 af alle skizofrene bliver raske igen?</span><br style="box-sizing: inherit; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;"><span style="color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;">Anna er en af dem, som gennem flere år kæmpede med stemmer, paranoia og selvhad. Hun var indlagt i lange perioder og blev som 18-årig anbefalet at søge førtidspension. I dag er hun rask, lever et helt normalt liv og er næsten færdig med sin kandidat i kemi på Aarhus Universitet.</span><br style="box-sizing: inherit; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;"><span style="color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;">Kom og hør hendes personlige beretning om at få skizofreni og miste sin fremtid til den. En beretning om at blive sin sygdom – og at blive sig selv igen. Hun kommer bl.a. ind på emner som identitet, bevarelse af håbet, nødvendigheden af at turde fejle og den svære opgave at være pårørende.</span><br style="box-sizing: inherit; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;"><span style="color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;">Medlemmer får refunderet det ½ af billetprisen ved fremvisning af betalt medlemskort.</span><br style="box-sizing: inherit; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;"><a href="http://speakyourmind.dk/?page" rel="nofollow" style="box-sizing: inherit; color: rgb(19, 119, 251); transition: all 0.2s ease-in-out; outline: none; margin-bottom: 0px; font-family: Roboto, sans-serif; font-size: medium; line-height: 28px;">http://speakyourmind.dk/?page</a>', 9, 5)
INSERT [dbo].[Events] ([Id], [Name], [EventStart], [EventEnd], [Price], [NoOfTickets], [Description], [FK_Category], [FK_Location]) VALUES (22, N'Girls Day by Fit family', CAST(N'2016-09-14 10:00:00.000' AS DateTime), CAST(N'2016-09-14 14:00:00.000' AS DateTime), CAST(375.00 AS Decimal(18, 2)), 50, N'<p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">GIRLS DAY</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Så, de damer, så er det tid til at forkæle sig selv!</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Et event der byder på træning, undervisning, foredrag, tøsehygge og en tur i grossererbadet! Tag en dag ud af din kalender, og nyd den med dine venner - og kommende venner.</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Program:</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">kl 10.00 - velkomst, introduktion og omklædning</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">kl 10.30 - Fælles træning godt blandet - her kommer vi rundt om forskellige hold såsom quick core, stramop/styrke, Funktional, Yoga, TRX og HIIT.</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">12.00, Frokost fra FIKA + foredrag - Hvordan bibeholde motivation, og ændre dine dårlige vaner</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">kl 13.15 - Vi tager i samlet trop til Grosserebadet der bla. byder på, sauna + saunagus, dampbad, polabad, sansebad, boblebad mm.</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">kl 15.30 - Tak for i dag!</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Arrangementet er for alle, hvad enten du er gravid, nybagtmor, erfaren inden for træning, eller aldrig har trænet før. Der er 25 pladser, så vær hurtig om at booke din plads, inden der er udsolgt!</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Ved spørgsmål kan du henvende dig til Maria, som også er værtinde for arrangementet på maria@fitfamily.dk</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 1.75rem; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Pris for Fit Family medlemmer: 275 kr</p><p style="box-sizing: inherit; line-height: 28px; margin-bottom: 0px; color: rgb(65, 67, 68); font-family: Roboto, sans-serif; font-size: medium;">Pris for ikke-medlemmer: 375 kr</p>', 7, 6)
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[EventsInOrders] ON 

INSERT [dbo].[EventsInOrders] ([Id], [FK_Event], [FK_Order], [Quantity]) VALUES (1, 4, 1, 2)
INSERT [dbo].[EventsInOrders] ([Id], [FK_Event], [FK_Order], [Quantity]) VALUES (2, 5, 1, 5)
SET IDENTITY_INSERT [dbo].[EventsInOrders] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Adress], [Zipcode], [City]) VALUES (1, N'HeadQuaters, Valdemarsgade 1', 8000, N'Aarhus C')
INSERT [dbo].[Location] ([Id], [Adress], [Zipcode], [City]) VALUES (2, N'Ny V58, Vestergade 58P', 8000, N'Aarhuc C')
INSERT [dbo].[Location] ([Id], [Adress], [Zipcode], [City]) VALUES (3, N'Ny V58, Vestergade 58P', 8000, N'Aarhus')
INSERT [dbo].[Location] ([Id], [Adress], [Zipcode], [City]) VALUES (4, N'Gyngen, Mejlgade 53', 8000, N'Aarhus')
INSERT [dbo].[Location] ([Id], [Adress], [Zipcode], [City]) VALUES (5, N'Lysets Hus, Posthussmøgen 11C', 8000, N'Aarhus')
INSERT [dbo].[Location] ([Id], [Adress], [Zipcode], [City]) VALUES (6, N'Fit Family, Møllevangs Allé 146', 8200, N'Aarhus')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (1, N'http://sites.thomasboeriis.dk/H5/Aztek.jpg', 2, 5)
INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (2, N'http://sites.thomasboeriis.dk/H5/FordragmedAnnaZink.jpg', 2, 21)
INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (3, N'http://sites.thomasboeriis.dk/H5/GirlsDay.jpg', 2, 22)
INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (4, N'http://sites.thomasboeriis.dk/H5/ImaginareCollectif.jpg', 2, 4)
INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (5, N'http://sites.thomasboeriis.dk/H5/NytPartiJordenFrihedKundskab.png', 2, 17)
INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (6, N'http://sites.thomasboeriis.dk/H5/SjovtNok.jpg', 2, 19)
INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (7, N'http://sites.thomasboeriis.dk/H5/TheDoors.jpg', 2, 20)
INSERT [dbo].[Media] ([Id], [Url], [FK_Type], [FK_Event]) VALUES (8, N'http://sites.thomasboeriis.dk/H5/VictorsForaeldreskalskilles.jpg', 2, 18)
SET IDENTITY_INSERT [dbo].[Media] OFF
SET IDENTITY_INSERT [dbo].[MediaTypes] ON 

INSERT [dbo].[MediaTypes] ([Id], [Name]) VALUES (1, N'Link')
INSERT [dbo].[MediaTypes] ([Id], [Name]) VALUES (2, N'Image')
INSERT [dbo].[MediaTypes] ([Id], [Name]) VALUES (3, N'Video')
SET IDENTITY_INSERT [dbo].[MediaTypes] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [FK_Customer], [FK_Status], [Created]) VALUES (1, 1, 1, CAST(N'2016-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [FK_Customer], [FK_Status], [Created]) VALUES (2, 2, 1, CAST(N'2016-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([Id], [FK_Customer], [FK_Status], [Created]) VALUES (6, 4, 1, CAST(N'2016-09-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Reserved')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Payment Ok')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Payment Failed')
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Categories] FOREIGN KEY([FK_Category])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Categories]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Location] FOREIGN KEY([FK_Location])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Location]
GO
ALTER TABLE [dbo].[EventsInOrders]  WITH CHECK ADD  CONSTRAINT [FK_EventsInOrders_Events] FOREIGN KEY([FK_Event])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[EventsInOrders] CHECK CONSTRAINT [FK_EventsInOrders_Events]
GO
ALTER TABLE [dbo].[EventsInOrders]  WITH CHECK ADD  CONSTRAINT [FK_EventsInOrders_Orders] FOREIGN KEY([FK_Order])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[EventsInOrders] CHECK CONSTRAINT [FK_EventsInOrders_Orders]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Events] FOREIGN KEY([FK_Event])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Events]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_MediaTypes] FOREIGN KEY([FK_Type])
REFERENCES [dbo].[MediaTypes] ([Id])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_MediaTypes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([FK_Customer])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([FK_Status])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[16] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventsInOrders"
            Begin Extent = 
               Top = 6
               Left = 676
               Bottom = 136
               Right = 846
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Events"
            Begin Extent = 
               Top = 6
               Left = 891
               Bottom = 237
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 6
               Left = 1092
               Bottom = 136
               Right = 1262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCustomerOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCustomerOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCustomerOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Events"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 239
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 194
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categories"
            Begin Extent = 
               Top = 198
               Left = 246
               Bottom = 294
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent'
GO
USE [master]
GO
ALTER DATABASE [EventSystem] SET  READ_WRITE 
GO
