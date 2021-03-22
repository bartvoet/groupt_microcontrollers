## Data opslaan met databases

De meeste applicaties slagen data op, we noemen dit ook wel persisteren.  

Sommige applicaties slagen dit op als een file (zoals eerder gezien), als we echter veel of complexe data willen opslagen kunnen we gebruik maken van databases.  

Binnen de cursus gaan we dit doen aan de hand van **sql** op een een relationele database genaamd **sqlite**

### Wat is een database

Zo'n database is een apart stuk software dat op een **gestructureerde manier** **data** duurzaam kan opslaan of **persisteren**.  

### Wat is SQL?

SQL of **Structured Query Language** is een taal die we gebruiken om met een **database** te praten.  
Deze SQL bestaat uit 3 onderdelen

* **DDL** - Data Definition Language  => Beschrijven van datastructuren in ons geval tabellen
* **DML** - Data Modification Language => Ondervragen en wijzigen van data
* **DCL** - Data Control Language => Controleren van toegang tot de data

We gaan ons grotendeels bezig houden met DML (en een beetje met DDL).

> Nota: er bestaan nog andere manieren naast SQL, daar komen we later nog op terug

### Client-server vs embedded applicaties

**DBMS** (Database Management Systemen) zijn meestal beschikbaar als een client-server-service op een netwerk en worden gedeeld door meerdere gebruikers.

Zo'n applicatie maakt dan over het netwerk verbinding met een database om data op te vragen of te manipuleren (SQL) en krijgt data terug.

~~~
+---------------+                             +----------------+
|               +---------------------------->|                |
|               |            SQL              |                |
|  Applicatie   |                             |  Database      |
|               |            DATA             |                |
|               |<----------------------------+                |
+---------------+                             +----------------+
~~~

Bekende voorbeelden van zulke databases zijn bijvoorbeeld MySQL, MariaDB, Oracle DB, SqlServer, ...  
Een applicatie gaat meestal niet rechtstreeks praten met de database, om complexiteit te verbergen bieden de meeste datatabases een API (en/of driver) aan om de communicatie te verzorgen met de database 

~~~
+---------------+---+                         +----------------+
|               |   +------------------------>|                |
|               | A |         SQL             |                |
|  Applicatie   | P |                         |  Database      |
|               | I |         DATA            |                |
|               |   |<------------------------+                |
+---------------+---+                         +----------------+
~~~

Tegenover deze **client-server-systemen** bestaan er ook **embedded databases**.
Hier draait database op dezelfde machine en in meeste gevallen is de database ook ingebed is in dezelfde applicatie.

~~~
+---------------+---+-------+----------------+
|               |   +------>|                |
|               | A |  SQL  |                |
|  Applicatie   | P |       |  Database      |
|               | I |  DATA |                |
|               |   |<------+                |
+---------------+---+-------+----------------+
~~~

### Sqlite

Eén van de belangrijkste (of toch meest gebruikte) is Sqlite (https://www.sqlite.org/index.html).

Deze wordt binnen de industrie gebruikt door verschillende toepassingen:

* Storage voor Android-systeem en -applicaties
* Office-toepassingen
* CAD-systemen
* History voor internetbrowsers
* Embedded Systemen
* Configuratie van desktop-toepassingen
* Educationele redenen als deze applicatie
* ...


### "Getting started" met SQL

In dit deel van de cursus maken we hier van gebruik vanwege het gemak en gebruiksvriendelijkheid.  

* Als **eerste stap** is leren **werken met SQL**, hier voor gebruiken we een sql-browser-tool
* Vervolgens gaan we een database gebruiken vanuit **Python** door middel van een **api** 

### Sqlitebrowser

Om met Sqlite te werken starten we met het gebruik van een handige tool om sql-commando's toe te passen op deze database.

Download sqlitebrowser vanaf https://sqlitebrowser.org/ of via de packagemanager van je Linux-distro.  

### Database aanmaken

Zo'n sqlite-database betaat uit **1 file**.    

Onze eerste stap is zo'n nieuwe database aan te maken, hiervoor open je de sqlite-browser die we eerder hebben gedownloaded

Binnen dit scherm selecteer je linksboven de optie nieuwe database (zie screenshot)

![](../../pictures/sqlite_new_db.png)

Bij het bewaren geef je deze de naam students.db (meest gebruikte extensie voor sqlite-databases)

### Werken met SQL

Om SQL uit te voeren select je vervolgnens de tab "Execute SQL".  

Binnen dit venster kan je dan SQL-commando's (of queries) typen om je database te ondervragen (select) of te wijzigen (insert, update, delete)

![](../../pictures/sqlite_exec_sql.png)

### Tabellen aanmaken (DDL)

Vooraleer je data kan bewaren binnen een database moet je structuren aanmaken.  
Deze structuren noemen we tabellen en bestaat uit 1 of meerdere kolommen

In de eerdere hoofdstukken hadden we een studenten-applicatie gemaakt.  
De klasses bevatten 3 velden:

* Naam
* Labo-punten
* Theorie-punten

#### Poging 1

Om deze structuur aan te namen gebruiken we een create-statement:

* Dit start met de **"create table"**
* Gevolgd door een **naam** voor deze structuur (student in dit geval)
* Gevolgd door **haakjes-paar**
* En gevolgd door een **;**

> Nota: sql is wat betreft syntax (niet data) case-insensitive...

~~~sql
CREATE TABLE student 
(

);
~~~

We klikken vervolgens op de play-button om dit statement uit te voeren ... en we krijgen een error

![](../../pictures/sql_error.png)


Deze error is logisch want dit is nog geen geldig statement, een tabel moet echtern minstens 1 kolom/veld bevatten.

~~~
Result: near ")": syntax error
At line 1:
CREATE TABLE student 
(

)
~~~

#### Poging 2: velden toevoegen

Deze velden kan je toevoegen tussen de haakjes:

* Zijn gescheiden door komma's
* Bevatten een type (text of integer)

(er zijn vanzelfsprekend meerdere types maar we beperken ons voorlopig hier toe)

~~~sql
CREATE TABLE student 
(
    student_name TEXT,
    lab INTEGER,
    theory INTEGER
);
~~~

![](../../pictures/sql_success.png)

Deze poging is successvol en duidt aan dat de tabel is gecreerd:

~~~
Result: query executed successfully. Took 1ms
At line 1:
CREATE TABLE student 
(
    student_name TEXT,
    lab INTEGER,
    theory INTEGER
);
~~~

Als je navigeert naar de tab "Database Structure" zie je ook dat deze tabel is aangemaakt

![](../../pictures/sql_structure.png)

### Data toevoegen via insert

We keren ondertussen terug naar het sql-venster om te zien hoe we data moeten toevoegen.  
Om data toe te voegen gebruiken we een insert-statement:

~~~sql
insert into student(student_name,lab,theory) values("Bart Voet",15,16);
~~~

Als dit successvol is krijg je een vergelijkbare input:

~~~
Result: query executed successfully. Took 0ms, 1 rows affected
At line 1:
insert into student(student_name,lab,theory) values("Bart Voet",15,16)
~~~

Dit statement bestaat uit:

* De keyworden "insert into"
* Gevolgd door de tabel-naam student
* De velden die je wil updaten (tussen de haakjes gescheiden door komma's)
* Gevolgd door de het keyword values
* En de waarden tussen haakjes, ook gescheiden door komma's

Bemerk ook dat string hier ook worden gemarkeerd door quotes.  
Om de volgende stappen te doen voegen we nog een 2de rij toe aan de database via:

~~~sql
insert into student(student_name,lab,theory) values("Jan Janssens",17,14);
~~~

met als restulaat

~~~
Result: query executed successfully. Took 0ms, 1 rows affected
At line 1:
insert into student(student_name,lab,theory) values("Jan Janssens",17,14);
~~~


### Lezen van data met SQL

Om de data (die we zojuist hebben geinjecteerd) te kunnen lezen gebruiken we SQL-statements.  
Typ het volgende statement in de sql-editor

~~~sql
select * from student;
~~~

Deze bestaat uit 3 onderdelen:

* "select"-keyword
* de velden die je wil zien gescheiden door een komm of \* als je alle velden wil selecteren

Als dit succesvol is krijg je data zien zoals hieronder

![](../../pictures/sql_select.png)


Als je enkel bepaalde velden wil zien kan je deze aangeven ipv het \*

~~~sql
select student_name, lab from student;
~~~

In dat geval wordt je **projectie** beperkt tot enkel 2 velden

~~~
Bart Voet	15
Jan Janssens	17
~~~

### Gebruik van where-clausules

Naast de **projectie** kunnen we ook de **selectie** gaan beperken.  
Dit doen we via een **where-clausule** toe te voegen

Als we bijvoobeeld de volgend query uitvoeren om de studenten te selecteren met meer dan 16 punten

~~~sql
select student_name, lab from student where lab > 16;
~~~

Krijgen we

~~~
Jan Janssens	17
~~~

De operatoren die je hiervoor kan gebruiken zijn:

~~~
=	Gelijk aan	
>	Groter dan	
<	Kleiner dan	
>=	Groter dan of gelijk aan
<=	Kleiner dan of gelijk aan	
<>	Niet gelijk aan
~~~

### Combineren met and of or

Je kan (net zoals in Python) ook condities combineren met and of or.  
Bijvoorbeeld willen we de studenten die meer (of gelijk) aan 15 op hun theorie hebben

~~~sql
select student_name, lab from student where lab > 16 or theory >= 15;
~~~

Krijg je meer studenten geselecteerd:

~~~
Bart Voet	15
Jan Janssens	17
~~~

