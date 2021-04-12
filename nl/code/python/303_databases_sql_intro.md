## Werken met SQL

### "Getting started" met SQL

Om te kunnen werken met een (relationele) database heb je dus SQL nodig, we gaan dat doen in 2 trappen:

#### SQL via de sqlitebrowser

Om een goed begrip te krijgen van SQL, gaan we eerst leren **werken met SQL**.  
Hiervoor gebruiken we de sqlitebrowser-tool om tabellen aan te maken, data te manipuleren en op the halen.

~~~
+-------------------+------------+----------------+
|                   |            |                |
|                   +----------->|                |
|                   |    SQL     |                |
|   Sqlitebrower    |            |    Database    |
|                   |    DATA    |                |
|                   |<-----------+                |
|                   |            |                |
+-------------------+------------+----------------+
~~~

#### SQL vanuit een Python-applicatie

Vervolgens gaan we een **database** sturen/gebruiken vanuit **Python**, waar we door middel van een **API** waarme we deze SQL-commando's gaan sturen.

~~~
+---------------+---+------------+----------------+
|               |   |            |                |
|               |   +----------->|                |
|               | A |    SQL     |                |
|  Applicatie   | P |            |    Database    |
|               | I |    DATA    |                |
|               |   |<-----------+                |
|               |   |            |                |
+---------------+---+------------+----------------+
~~~

### Wat is SQL?

SQL of **Structured Query Language** is een taal die we gebruiken om met een **database** te praten.  
Deze SQL-taal is onderverdeeld in 3 delen:

* **DDL** - Data Definition Language  => Beschrijven van datastructuren in ons geval tabellen
* **DML** - Data Modification Language => Ondervragen en wijzigen van data
* **DCL** - Data Control Language => Controleren van toegang tot de data

We gaan ons grotendeels bezig houden met **DML** om de inhoud van de database te wijzigen en te consulteren.  
We gaan echter van start met DDL om tabellen te definieren waarin we onze data gaan opslaan.

#### ANSI/ISO-standaard

SQL is ook een **ANSI/ISO-standaard** die ondersteund wordt door **diverse** **databasemanagementsystemen** (DBMS).  
Alle moderne (relationele) databaseproducten gebruiken vandaag dezelfde taal om data te definieren en te manipulere.  
Wel dient er op gewezen worden dat vele system wel **eigen uitbreidingen of dialecten** voorzien...

#### Declaratieve programmeer-taal

SQL wordt ook bekeken als een programmeertaal, maar het is zeker geen programmeer-taal zoals we deze hebben gezien met Python.  

SQL is wat ze noemen een **declaratieve programmeertaa**l, je **beschrijft** eerder **welke data** je wil hebben.  
Dit in tegenstelling tot **imperatieve** programmeertalen waar je ook beschrijft **hoe** je deze wil verkrijgen (adhv van variabelen, condities, loops, ...)

#### SQL-statements en -scripts

SQL maakt gebruik van verschillende soorten statements zoals we gaan zien:

* **create-** en **drop-statements** om tabellen aan te maken (DDL)
* **select-statements** of **queries** om data op te halen
* **insert-** en **update-** en **delete-**statements om de data op te halen

Een voorbeeld hieronder is een select-statement om gegevens op te halen uit een de studenten-tabel.

~~~sql
select * from student;
~~~

Deze statements worden bijna altijd ook beeindigd met een **;**, dit is zeker van belang als je met SQL-scripts werkt je meerdere statements combineert om uit te voeren.

In onderstaand voorbeeld voeren we 3 insert-statements in 1 script uit.  

~~~sql
INSERT INTO student (student_id, name, lab, theory) VALUES (1, 'Joe Biden', 12, 10);
INSERT INTO student (student_id, name, lab, theory) VALUES (2, 'Donald Trump', 10, 12);
INSERT INTO student (student_id, name, lab, theory) VALUES (3, 'George Bush', 10, 12);
~~~

Om de verschillende statements van elkaar te kunnen onderscheiden dienen deze dan ook gescheiden te worden van elkaar doormiddels van een **;**

### Tabellen aanmaken (DDL)

Alvorens de database te kunnen gebruiken dien je echter eerst tabellen aan te maken voor je deze kan gebruiken, dus we gaan van **start** met **create-statements**.

In de eerdere hoofdstukken hadden we een studenten-applicatie gemaakt, we gaan hier op verder bouwen om SQL te kunnen demonstreren.  
We gaan van start met een tabel aan te maken om **studenten-data op te slaan** 

Deze tabel zal dan de data bevatten van, ter herhaling de klasse student bevatte 3 velden:

* Naam
* Labo-punten
* Theorie-punten

Deze velden gaan we aanmaken binnen een **tabel** en noemen we ook wel een **kolom**.  
Een  tabel bestaat uit:

* Kolommen of de velden die zo'n tabel bevat (projectie)
* Rijen van data, in het voorbeeld hieronder bevat de tabal al 2 lijnen or rijen met studenten-data

~~~
+---------------+---------------+---------------+
| student_name  |      lab      |     theory    |
+---------------+---------------+---------------+  
|  Bart Voet    |      15       |      16       |
+---------------+---------------+---------------+  
| Jan Janssens  |      17       |      14       |
+---------------+---------------+---------------+
~~~

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

Deze error is normaal want dit is nog **geen geldig statement**, een tabel moet echter **minstens** **1 kolom**/veld bevatten.

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

#### Tabel verwijderen

Als je deze tabel wil verwijderen uit de database is dit ook mogelijk via het drop-statement of commando.  
Om bijvoorbeeld de student-tabel te verwijderen gebruik je:

~~~sql
DROP TABLE student;
~~~

Let wel, dit verwijdert zowel de definitie als de data en is onherroepbaar!!!

### Data toevoegen via insert

Eénmaal de tabellen aangemaakt kan je beginnen met er data aan toe te voegen.

We keren hiervoor terug naar het sql-venster om te zien hoe we data moeten toevoegen.  
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

* De **keyword**-combo **insert into**
* Gevolgd door de **tabel-naam** student
* De **velden** die je wil **updaten** (tussen de haakjes gescheiden door komma's)
* Gevolgd door de het **keyword** **values**
* En daarna de **waarden** tussen **haakjes**, ook **gescheiden door komma's**

Bemerk ook dat **string** hier ook worden gemarkeerd door **quotes**, net zoals we in Python gewoon zijn.  
Om de volgende stappen te doen voegen we nog een **2de rij** toe aan de database via:

~~~sql
insert into student(student_name,lab,theory) values("Jan Janssens",17,14);
~~~

met als **restulaat**

~~~
Result: query executed successfully. Took 0ms, 1 rows affected
At line 1:
insert into student(student_name,lab,theory) values("Jan Janssens",17,14);
~~~

### Lezen van data met SQL (select)

Om de data (die we zojuist hebben geinjecteerd) te kunnen **lezen** gebruiken we een 2de soort SQL-statements, namelijk **select-statements** of korter gezegd **queries**.  
Typ het volgende statement in de sql-editor:

~~~sql
select * from student;
~~~

Deze bestaat uit 3 onderdelen:

* "select"-keyword
* een \* om aan te gevan dat je **alle velden** wil selecteren

Als dit succesvol is krijg je data zien zoals hieronder:

![](../../pictures/sql_select.png)

De data die je ziet in het raster stemt dan overeen met de date die je hebt toegevoegd via de voorgaande **insert-statements**

~~~
student_name  lab         theory    
------------  ----------  ----------
Bart Voet     15          16        
Jan Janssens  17          14  
~~~

### Beperken van de velden (projectie)

Het \*-symbool zal er voor zorgen dat alle velden worden geprojecteerd.  

Als je niet alle velden nodig hebt kan je ook de de velden die je wil zien gescheiden door een komma (ipv een) \*)

~~~sql
select student_name, lab from student;
~~~

In dit geval zal je zien dat enkel de naam en de de labo-punten worden **geprojecteerd**

~~~
student_name  lab       
------------  ----------
Bart Voet     15        
Jan Janssens  17
~~~

Dit bepalen of beperken van de kolommen is wat we noemen een **projectie**, dit houdt in welke kolommen of velden je wil tonen.

### Gebruik van where-clausules (selectie)

Naast de **projectie** kunnen we ook de **selectie** gaan beperken.  

Dit doen we via een **where-clausule** toe te voegen...  
We passen bijvoobeeld de vorige query aan om de studenten te selecteren met meer dan 16 punten

~~~sql
select student_name, lab from student where lab > 16;
~~~

Het resultaat wordt filterd en we krijgen enkel de student te zien met meer meer dan 16 punten.

~~~
student_name  lab       
------------  ----------
Jan Janssens  17  
~~~

Dit filteren of beperken van het aantal rijen is wat we noemen binnen **SQL** (en relationele algebra) een **selectie**.  
Je kan voor dit filteren verschillende operatoren gebruiken zoals:

~~~
=	Gelijk aan	
>	Groter dan	
<	Kleiner dan	
>=	Groter dan of gelijk aan
<=	Kleiner dan of gelijk aan	
<>	Niet gelijk aan
~~~

Deze zijn  - met **uitzondering** van **<>** dat overeenkomt met != in Python - **hetzelfde** zoals je deze in **Python-code** zou gebruiken voor condities en loops.  
Als je de statement omdraait...

~~~sql
select student_name, lab from student where lab < 16;
~~~

... krijg je dan ...

~~~
student_name  lab       
------------  ----------
Bart Voet     15    
~~~

### Where combineren met and of or

Om de volgende oefeningen te kunnen verder zetten voegen we nog wat rijen toe:

~~~sql
insert into student(student_name,lab,theory) values("Piet Pieters",9,12);
insert into student(student_name,lab,theory) values("Joris Jorissen",11,12);
~~~


Je kan (net zoals in Python) ook **condities** **combineren** met **and** of **or**.  
Bijvoorbeeld willen we de studenten die meer (of gelijk) aan 15 op hun theorie hebben

~~~sql
select student_name, lab from student where lab > 14 or theory >= 14;
~~~

Krijg je meer studenten geselecteerd (die zowel op labo als theorie hoger scoren als 14):

~~~
student_name  lab       
------------  ----------
Bart Voet     15        
Jan Janssens  17  
~~~

De 2 nieuwe studenten krijg je niet te zien, als we nu een combineren met and om de studenten te zien die zowel op theorie als labo minder hebben dan 14...

~~~sql
select student_name, lab, theory from student where lab < 14 and theory < 14;
~~~

... krijg je ...

~~~
student_name  lab         theory    
------------  ----------  ----------
Piet Pieters  9           12        
Joris Joriss  11          12    
~~~

### Update

Tot nog toe kunnen we:

* Een tabel aanmaken met een **create-statement**
* Data injecteren met **insert-statements**
* Data ophalen via **select** 
* Filteren via een **where-clausule**

De volgende vraag, wat als je data wil aanpassen in een bestaande rij, dit kan je via een update-statement.

~~~sql
update student set lab = 10 where student_name = "Piet Pieters";
~~~

Als we nadien de tabel bekijken zien we dat de betreffende student (Piet Pieters) zijn labo-punten zijn aangepast (9 -> 10)

~~~
student_name  lab         theory    
------------  ----------  ----------
Bart Voet     15          16        
Jan Janssens  17          14        
Piet Pieters  10          12        
Joris Joriss  11          12  
~~~

De syntax is hier:

* keyword **update**
* gevolgd door de tabel-naam
* dan het keyword **set**
* gevolgd door de eigenlijke update met de vorm **column-name = waarde**
* en als laaste een **where-conditie** die aangeeft welke rijen moeten worden geupdated

> **Waarshuwing:**  
> Als je deze where-conditie of clausule vergeet loop je het **risico** alle rijen aan te **passen**

### Update meerdere velden

Je kan ook meerdere velden te gelijk updaten, hiervoor voeg je een nieuwe update-deel toe (gescheiden door een komma)

~~~sql
update student set lab = 16, theory=15 where student_name = "Jan Janssens";
~~~

Hier wordt zowel het labo als de theorie van Jan Janssens aangepast.

~~~
student_name  lab         theory    
------------  ----------  ----------
Bart Voet     15          16        
Jan Janssens  16          15        
Piet Pieters  10          12        
Joris Joriss  11          12   
~~~


### Update meerdere rijen

Meerdere rijen tegelijk is ook mogelijk (zelfs alle rijen).  
Stel dat we alle studenten een punt will bij geven op het labo (die minder dan 12 hebben), wegens goed medewerking in de klass

~~~sql
update student set lab = lab +1 where lab < 12;
~~~

... zien we alle student met minder dan 12 een update krijgen

~~~
student_name  lab         theory    
------------  ----------  ----------
Bart Voet     15          16        
Jan Janssens  16          15        
Piet Pieters  11          12        
Joris Joriss  12          12  
~~~

Een 2de voorbeeld, we willen studenten die meer labo-punten hebben dan theori een puntje bij geven op theorie...

~~~sql
update student set theory = theory +1 where lab > theory;
~~~

~~~
student_name  lab         theory    
------------  ----------  ----------
Bart Voet     15          16        
Jan Janssens  16          16        
Piet Pieters  11          12        
Joris Joriss  12          12   
~~~

### CRUD

De operaties die we tot nog toe hebben gedaan via SQL resorteren eigelijk onder **CRUD**.  
CRUD staat voor de vier **basisoperaties** die op date kunnen uitgevoerd kunnen worden zoals:

* **Create** (of insert): Toevoegen van nieuwe data.
* **Read** (of select): Opvragen van gegevens.
* **Update**: Wijzigen van gegevens.
* **Delete**: Verwijderen van gegevens.

### Delete

De laatste operatie die we nog niet in SQL hebben gezien is **delete**, net zoals bij **update** die, je een where-clausule (eigenlijk niet verplicht maar anders verwijder je alle gegevens).

Bijvoorbeedl, stel dat de student "Bart Voet" onrechtmatig toegang heeft gekregen tot de cursus kan je deze verwijderen als volgt:

~~~sql
delete from student where student_name = "Bart Voet";
~~~

...nadien zie je dat deze student verdwenen is uit de database

~~~
student_name  lab         theory    
------------  ----------  ----------
Jan Janssens  16          16        
Piet Pieters  11          12        
Joris Joriss  12          12   
~~~

> **Waarschuwing:**  
> Opnieuw dezelfde waarschuwing als bij update, pas op dat je
> where-clausule correct is gefinieerd want je kan meerdere 
> studenten tot en met de hele tabel deleten.

### Tabel verwijderen via drop

De voorgaande crud-statements (select, insert, update, delete) verwijzen we als DML (Data Modification Language).  
Om een tabel aan te maken hebben we eerder gebruik gemaakt van een create-statement, dit is wat verwijzen als een DDL (Data Definition Language).  

Een andere DDL-statement (naast create) is **drop**.  
Dit kan men gebruiken om een tabel te verwijderen uit een database.

We gaan dit vervolgens doen om daarna de tabel terug aan te maken (om primary en foreign keys te demonsteren)

~~~sql
drop table student;
~~~

Als je dan probeert de tabel te querien krijg je de melding geen data meer te hebben.

~~~
sqlite> select * from student;
Error: no such table: student
~~~

> **Waarschuwing:**  Dit verwijdert vanzelfsprekend ook de data...

### Primary key

Tot nu gebruikte we de name-kolom om een student uniek te identifieren.  
Je kan ervoor zorgen dat de database voor jou controleert dat deze naam uniek is via een **"primary key"-constraint**:

* **Primary key** slaagt op het feit dat deze kolom uniek is en de primaire sleutel is om een record op te zoeken
* **Constraints** zijn controles of voorwaardes die een database voor jou kan controlleren en forceren

> Nota: dit kan ook via een "unique-key"-constraint, daar komen we later nog op terug...

We maken een nieuwe create-statement aan:

~~~sql
CREATE TABLE student 
(
    name TEXT PRIMARY KEY,
    lab INTEGER,
    theory INTEGER
);
~~~

We hebben hier een keyword **PRIMARY KEY** toegevoegd aan de 1ste kolom.  
Vervolgens voegeven we 2 nieuwe studenten toe:

~~~sql
insert into student(name,lab,theory) values("Bart Voet",15,16);
insert into student(name,lab,theory) values("Jan Janssens",17,14);
~~~

Tot nog toe zien we het zelfde resulatat als voorheen, 2 lijnen toegevoegd:

~~~
name        lab         theory    
----------  ----------  ----------
Bart Voet   15          16        
Jan Jansse  17          14      
~~~

Daarna voegen we een student toe, let wel deze student bestaat reeds in de database...

~~~sql
insert into student(name,lab,theory) values("Bart Voet",17,18);
~~~

De database zal dit echter niet toestaan door de constraint die je eerder hebt toegevoegd.

~~~
Error: UNIQUE constraint failed: student.name
~~~

### Automatische primary-keys

1 van de problemen die je kan hebben met voorgaande approach is dat het technisch wel mogelijk is van 2 studenten te hebben met dezelfde naam.  
Wat daarom veel wordt gedaan is gebruik maken van numerieke id's om op zich de verschillende studenten een unieke nummer te geven (een beetje zoals jullie studenten nummers)

Om dit te doen voegen we een veld/kolom **student_id** toe en maken we definieren we deze als unieke identifier. 

~~~sql
drop table student;

CREATE TABLE IF NOT EXISTS student 
(
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    lab INTEGER,
    theory INTEGER
);
~~~

Deze nieuwe id kan je toevoegen aan je insert-statement maar kan automatisch worden aangemaakt door de databasse...  


~~~sql
insert into student(name,lab,theory) values("Bart Voet",15,16);
insert into student(name,lab,theory) values("Jan Janssens",17,14);
insert into student(name,lab,theory) values("Piet Pieters",9,12);
insert into student(name,lab,theory) values("Joris Jorissen",11,12);
~~~

Als we in de databasqe kijken zien we dat dit veld automatisch wordt aangevult

~~~
student_id  name        lab         theory    
----------  ----------  ----------  ----------
1           Bart Voet   15          16        
2           Jan Jansse  17          14        
3           Piet Piete  9           12        
4           Joris Jori  11          12   
~~~


Zulk een auto-increment-mechanisme bestaat voor elke datbase (mysql, postgres, sqlserver, ...) maar het mechanisme om dit te definieren kan verschillen per database.   
Hier wordt nog op teruggekomen als we met postgres-sql gaan werken als gedeelde database.


Deze **autoincrement**-feature houdt niet tegen dat je deze waarde meegeeft (we hardcoderen 8)

~~~sql  
insert into student(student_id,name,lab,theory) values(8,"Piet Pieters",9,12);
~~~

~~~
student_id  name        lab         theory    
----------  ----------  ----------  ----------
1           Bart Voet   15          16        
2           Jan Jansse  17          14        
3           Piet Piete  9           12        
4           Joris Jori  11          12        
8           Piet Piete  9           12        
~~~

Als je nadien terug een student zonder id toevoegt zal ded hoogste id terug opnieuw worden geincrementeerd.

~~~sql
insert into student(name,lab,theory) values("Korneel Kortens",9,12);
~~~


~~~
student_id  name        lab         theory    
----------  ----------  ----------  ----------
1           Bart Voet   15          16        
2           Jan Jansse  17          14        
3           Piet Piete  9           12        
4           Joris Jori  11          12        
8           Piet Piete  9           12        
9           Korneel Ko  9           12  
~~~

### Meerdere tabellen

We starten vanuit voorgaande situatie

~~~
+------------------+
| student          |
+------------------+
| student_id (*)   |
| name             |
| theory           |
| lab              |
+------------------+
~~~

~~~
student_id  name        lab         theory    
----------  ----------  ----------  ----------
1           Bart Voet   15          16        
2           Jan Jansse  17          14        
3           Piet Piete  9           12        
4           Joris Jori  11          12        
8           Piet Piete  9           12        
9           Korneel Ko  9           12  
~~~

#### Gedupliceerde data

~~~
+------------------+
| student          |
+------------------+
| student_id (*)   |
| name             |
| theory           |
| lab              |
| group            |
| teacher          |
+------------------+
~~~


~~~
student_id  name        lab         theory       group   teacher          room
----------  ----------  ----------  ----------   ------  -------          ----
1           Bart Voet   15          16           A       Linus Torvalds   1b
2           Jan Jansse  17          14           A       Linus Torvalds   1b
3           Piet Piete  9           12           A       Linus Torvalds   1b
4           Joris Jori  11          12           B       Bill Gates       2c
8           Piet Piete  9           12           B       Bill Gates       2c
9           Korneel Ko  9           12           B       Bill Gates       2c
~~~

#### Normalisatie


~~~
+------------------+             +------------------+
| student          |             |   student_group  |
+------------------+             +------------------+
| student_id  (*)  |             | group_name (*)   |
| theory           |             | teacher          |
| lab              |             | room             |
+------------------+             +------------------+

~~~


~~~
student_id  name        lab         theory    
----------  ----------  ----------  ----------
1           Bart Voet   15          16        
2           Jan Jansse  17          14        
3           Piet Piete  9           12        
4           Joris Jori  11          12        
8           Piet Piete  9           12        
9           Korneel Ko  9           12        


group   teacher
------  -------  
A       Linus Torvalds
B       Bill Gates
~~~


#### Relaties leggen


~~~
+------------------+             +------------------+
| student          |             |   student_group  |
+------------------+             +------------------+
| student_id  (*)  |             | group_name (*)   |
| theory           |             | teacher          |
| lab              |             | room             |
| fk_student_group |             +------------------+
+------------------+
~~~


~~~
student_id  name        lab         theory    
----------  ----------  ----------  ----------
1           Bart Voet   15          16        
2           Jan Jansse  17          14        
3           Piet Piete  9           12        
4           Joris Jori  11          12        
8           Piet Piete  9           12        
9           Korneel Ko  9           12        


group   teacher
------  -------  
A       Linus Torvalds
B       Bill Gates
~~~

#### Relaties in SQL


~~~
+------------------+             +--------------------+
| student          |             |   student_group    |
+------------------+             +--------------------+
| student_id (*)   |    +------->| group_name (*)     |
| name             |    |        | teacher            |
| theory           |    |        | room               |
| lab              |    |        +--------------------+
| fk_student_group +----- 
+------------------+
~~~


~~~sql
drop table if exists student;
drop table if exists student_group;

create table if not exists student_group
(
    group_name text primary key,
    teacher text,
    room text
);

create table if not exists student
(
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    lab INTEGER,
    theory INTEGER,
    fk_student_group integer references student_group
);
~~~