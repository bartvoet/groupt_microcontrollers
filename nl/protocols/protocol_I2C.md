## I2C (Inter-Integrated Circuit)

I2C is (net zoals SPI) een serieel synchroon (werkt met clock) protocol, het is relatief goedkoop en is low-speed (100 kbps in standard mode, and 400 kbps in fast mode).  
I2C (beheerd door NXP) wordt ook wel officieus TWI genoemd (Two Wire Interface).

### Busprotocol

Samengevat, I2C is een **busprotocol**:

* Je kan 1 (of eventueel meerdere) MCU of besturings-apparaten aan sluiten.  
  Deze noemen we **master(s)**
* Je kan 1 of meerdere meerdere devices (sensors, led-schermen, ...) aansluiten, deze noemen we **slaves** 
* Elke slave heeft een adres van 7 bits lengte (range 0-127), in uitgebreide versie kan dit 10 bit zijn
* Alle data- en (klok-)communicatie gebeurt **serieel** over **2 draden** (naast VCC en GND)



### Bidirectionaliteit

Deze 2 draden – SDA (seriele data) en SCL (seriele clock) – zijn bidirectioneel.  
Zowel de transmissie van de master naar slave als het antwoord van de slave(s) naar de master worden gedeeld over dezelfde (SDA) data-lijn (dit in tegenstelling tot SPI die voor beide richtingen een data-lijn nodig heeft).  
Deze bi-directionaliteit wordt mogelijk gemaakt door dat de pinnen (of drivers) van zowel de i2c-slave(s) als i2c-masters open-collector (of open-drain voor FET's) zijn.  

![I2C bus](../../pictures/i2c_lines.png)

Beide draden (SDA en SCL) moeten verbonden aan een positieve spannings-bron via een **pull-up-weerstand**, hierdoor kunnen de pinnen (drivers) van de aangesloten IC's de spanning op deze lijn naar beneden trekken (zie transactie).

![Open collector](../../pictures/opencollector.png)

Deze open-collector-pins op de IC kunnen de spanning naar beneden trekken door (principe van open collector via een transistor  zoals de tekening hierboven) stroom te trekken via deze pull-up weerstand.  
Wanneer deze interne transistor echter gesloten wordt zal de spanning natuurlijk hoog blijven (tenzij een andere aangesloten IC deze naar beneden trekt.

### Transactie

Bij niet-activiteit (idle) blijven deze lijnen dus hoog, een master kan echter een “I2C-transactie” initieren door:
 
* De SDA-lijn naar beneden te trekken (laag)
* Gevolgd door SCL.

![Start transactie](../../pictures/i2c_start_transaction.png)

Dit signaleert alle ontvangers op de de bus dat een transmissie van een pakket zal starten.  
Wanneer dan SCL laag is zal de master over SDA de eerste bit overbrengen (laag of hoog). Dit wordt de **start conditie** genoemd.    
Elke bit die daarna wordt verzonden over de SDA-lijn wordt gesampled op de stijgende flank van de clock (SDA mag dan enkel wijzigen bij de volgende stijgende flank).   
Deze transactie wordt beëindigd via een **stop-conditie**:  

* De SDA-lijn lost te laten (hoog)
* Gevolgd door SCL (hoog)

![Einde transactie](../../pictures/i2c_end_transaction.png)

Door dit **aankondiging-systeem** kunnen er zich ook meerdere masters zich bevinden op deze ```I2C```-bus, bij gelijktijdig gebruik zal de bus die de lijn hoog wil laten maar laag wordt getrokken zijn transactie stoppen en een error-conditie genereren.


### Bytes

I2C stuurt bytes door:

* De MSB wordt eerst doorgestuurd 
* De LSB laatst.  
* Elk van deze bytes moet worden bevestigd door de slave (ACK).  

Deze **ACK** – dit is eigenlijk de 9ste bit –  wordt bereikt door – na de 8 bits – een extra clock-puls te geven en de receiver controle te geven over de SDA-lijn.  
 
Als deze receiver de lijn laag trekt wordt dit dan gezien als een **acknowledgment** (of bevestiging van ontvangst), zoniet wordt de transactie afgebroken (error).  

#### Boodschap of pakket-transmissie

Een ```I2C```-boodschap (transcactie) bestaat uit meerdere bytes.  
De eerste byte van een ```I2C```-boodschap is een de adres-byte die bestaat uit:  

* 7 adres bits
* gevolgd door 1 richting bit:
    * **'0'** betekent dat de master naar de slave wil data versturen  
    * **'1'** betekent dat de master van de slave wil ontvangen  

![](../../pictures/i2c_transmission.png)

Na deze eerste **adres-byte** volgt er een dataframe waarbij de ontvanger (slave bij '0' en master bij '1') elke byte zal bevestigen tot dat we aan de stop-conditie komen.

### Illustratie

Ter illustratie zie je hieronder zo'n communicatie tussen master en slave:

![](../../pictures/avr_i2c_trace.png)

* Voor elke byte te transfereren heb je 9 bit nodig
* Data wordt uitgelezen op de hoge klok
* Data wordt gewijzigd op de lage klok
* Je zien een aantal bredere lage klokken, deze komen voor bij de start van elke byte


### Voorbeeld: lezen van sensor-waarde (met clock-stretching)

Een typisch gebruik van ```I2C``` is het uitlezen van een sensor.  
Het lezen van sensor-waardes gebeurt meestal met de volgende sequenties:

* **Activeren** van een **meting**:  
  Dit is een schrijf-actie van de master
* **Uitlezen** van de **meting**:  
  Dit is een read-actie van de master

De sensor kan meestal - na het activeren van deze meting - niet direct antwoorden.  
Dit houdt in dat tussen de activitie (of triggering) en het uitlezen een zekere tijd kan zitten (dit kan afhankelijk van de sensor tot aan de grootorde van 100 ms komen).  

Een eerste techniek die kan gebruikt worden is wat we noemen clock-stretching, dit houdt in dat bij het starten van de lees-transactie de sensor de klok-lijn laag forceert totdat de data beschikbaar is:

![](../../pictures/avr_clock_stretching.png)

Een alternatieve oplossing is dat de sensor een **nack** zal uitsturen bij het uitlezen totdat de data beschikbaar is:

![](../../pictures/avr_polling.png)

