## I2C (Inter-Integrated Circuit)

I2C is (net zoals SPI) een **serieel**, **synchroon** (werkt met gemeenschappelijke clock) communicatie-protocol gebruikt om **elektronische componenten** (op korte afstand) met elkaar te laten communiceren.  

Het is relatief goedkoop en is low-speed (100 kbps in standard mode, and 400 kbps in fast mode).  

I2C wordt beheerd door NXP en wordt ook wel officieus TWI genoemd (Two Wire Interface).

> We geven hier enkel een korte introductie in i2c, als je meer informatie wenst over het low-level gedeelte van i2c:
>
> * http://i2c.info/i2c-bus-specification
> * http://www.nxp.com/documents/user_manual/UM10204.pdf

### I2C is een busprotocol

Van gebruikers-perspectief bekeken, I2C is een **busprotocol**:

* Je kan **1** (of eventueel **meerdere**) MCU of besturings-apparaten aan sluiten.  
  Deze noemen we **MASTER(s)**
* Je kan 1 of meerdere meerdere devices (sensors, led-schermen, ...) aansluiten.  
  Deze noemen we **SLAVE(s)**
* Elke slave heeft een **adres** van 7 bits lengte (range 0-127), in uitgebreide versie kan dit 10 bit zijn

Zowel de transmissie van de master naar slave, als het antwoord van de slave(s) naar de master wordt uitgevoerd over dezelfde (SDA) data-lijn (maar niet tegelijk).  
We spreken hier van **half-duplex**

### Elektronisch...

#### SDA en SCL

Alle data- en (klok-)communicatie gebeurt **serieel** over **2 draden** (naast VCC en GND):

* **SDA**: Seriele data
* **SCL**: Seriele clock

De signalen op deze 2 draden kunnen door zowel master als slaves worden gemanipuleerd.  

> Dit in tegenstelling tot SPI die voor beide richtingen een data-lijn gebruikt (MISO en MOSI)

#### Pull-up

Elektronisch gezien moeten beide draden (SDA en SCL) worden verbonden aan een positieve spannings-bron via een **pull-up-weerstand**, hierdoor kunnen de pinnen (drivers) van de aangesloten IC's de spanning op deze lijn naar beneden trekken (zie transactie).

![](../../pictures/i2c_lines.png)

### Signaal

We weten ondertussen:

* Dat we in **2 lijnen** gebruiken (SDA en SCL)
* Dat deze lijnen door de **pull-up's** hoog worden gehouden
* Slaves en masters zijn

Een uitwisseling van gegevens over i2c wordt verwezen als een **transactie** (of een **pakket**).  
Hoe gaat dat nu in zijn werk, de uitwisseling van data tussen master en slave...

#### I2C-pakketten of -transacties

Zo'n I2C-transactie (pakket) bestaat uit de volgende **onderdelen**:

* Aankondiging-mechanisme:
  * **Start-conditie**: aankondiging dat een **master** de bus wil **claimen**
  * **Stop-conditie**: Het vrijgeven van de bus door de master
* 1 of meerdere **bytes** (de eigenlijke data)
* Elke bytes wordt gevolgd door een acknowledgment **ACK** of **NACK**

#### Start-conditie (master)

Een **transactie** wordt gestart (of **aangekondigd**) door een **master** via een **start-conditie**.  

> Enkel een master zal het initiatief nemen om een I2C-transactie op te starten!!

Wetende dat bij **niet-activiteit** beide lijnen **HOOG** (idle) blijven (SDA en SCL), zal de **master**:

* **Eerst** de **SDA-lijn** naar beneden te trekken (laag)
* **Gevolgd** door de **SCL**-lijn die naar beneden wordt getrokken.

> Volgorde is hier belangrijk!!

![](../../pictures/i2c_start_transaction.png)

Deze **start-conditie** signaleert alle **ontvangers** op de de **bus** dat een **transmissie** van een pakket zal **starten**.  
Nadat de SCL laag is gegaan zal de master over SDA de eerste bit overbrengen (laag of hoog).

#### Bytes en bits (master en slave)

Elke bit die daarna wordt verzonden over de SDA-lijn wordt **gesampled** op de **stijgende flank** van de clock (SDA mag dan enkel wijzigen bij de volgende stijgende flank).   

De bits worden serieel doorgestuurd per byte:

* De **MSB** wordt **eerst** doorgestuurd
* De **LSB** wordt **laatst** doorgestuurd.  
* Elke **byte** moet worden **bevestigd** door de **ontvanger** (ACK).  

De bytes (met uitzondering van de adres-bytes) kunnen afhankelijk van het scenario van zowel de master als de slave komen.  
De ACK wordt in dat geval door de ontvangende partij gegeven.

#### Acknowledgment

Deze **ACK** – eigenlijk de 9ste bit –  wordt bereikt door – na de 8 bits – een extra clock-puls te geven en de receiver controle te geven over de SDA-lijn.  

Als deze receiver de lijn laag trekt wordt dit dan gezien als een **acknowledgment** (of bevestiging van ontvangst).  
Bij een NACK wordt meestal de transactie afgesloten, we zien verder nog hoe dit in zijn werk gaat .

> Gezien de communicatie bi-directioneel is kan deze ACK zowel van de slave als de master komen

#### Stop-conditie

De transactie wordt beëindigd via een **stop-conditie**:  

* De SDA-lijn lost te laten (hoog)
* Gevolgd door SCL (hoog)

![](../../pictures/i2c_end_transaction.png)

#### Osciloscoop ter illustratie

Door dit **aankondiging-systeem** kunnen er zich ook meerdere masters zich bevinden op deze ```I2C```-bus, bij gelijktijdig gebruik zal de bus die de lijn hoog wil laten maar laag wordt getrokken zijn transactie stoppen en een error-conditie genereren.

Ter illustratie van deze byte zie je hieronder zo'n communicatie tussen master en slave op de osciloscoop:

![](../../pictures/avr_i2c_trace.png)

* Voor elke byte te transfereren heb je 9 bit nodig
* Data wordt uitgelezen op de hoge klok
* Data wordt gewijzigd op de lage klok
* Je zien een aantal bredere lage klokken, deze komen voor bij de start van elke byte


### Adressering (bus)

I2C is een busprotocol, elke slave heeft een adres.  
De vraag is nu hoe een slave - binnen een transactie - gelinkt aan de master?  

#### Adres-byte

Dit komt door de adres-byte, dit is de eerste (en verplichte) byte binnen een I2C-transactie
Deze **eerste byte** van een ```I2C```-transactie is een byte die bestaat uit:  

* 7 **adres-bits** (met waarde van 0 tem 127)
* gevolgd door 1 **richting-bit**:
    * **'0'** betekent dat de master naar de slave wil data versturen  
    * **'1'** betekent dat de master van de slave wil ontvangen  

![](../../pictures/i2c_transmission.png)

Na deze eerste **adres-byte** volgt er een dataframe (van de master of slave) waarbij de ontvanger (slave bij '0' en master bij '1') elke byte zal bevestigen tot dat we aan de stop-conditie komen.

### Basis-commando's voor microcontrollers (overzicht)

Met behulp van hetgeen dat we tot nog toe hebben geleerd:

* Basis-componenten op signaal-niveau
* Adresssering

Nu we weten hoe dat een transactie wordt opgezet kunnen we een een overzicht geven van de meest relevante commando's die je moet kennen (en die meestal ter beschikking zijn binnen een MCU)

> We plaatsen er afkortingen bij opdat we hier later gemakkelijk naar kunnen verwijzien

#### Start en stop-condities

De eerste soort zijn de start- en stop-condities die we eerder hebben gezien (met toevoeging van herhaalde start).  

**ST:**

* Start-conditie (zie eerder)
* Kondigt de start van een pakket aan

**SP:**

* Stop condiies (zie eerder)
* Kondigt het einde van een pakket aan

Een 3de die we nog niet hebben gezien maar die bij gelijk is aan een **ST**

**SR:**

* Herhaalde start (repeated start)
* **Idem** aan **ST** maar wordt uitgevoerd direct na een transactie, **zonder** dat er een **nieuwe SP** was
* Kondigt net zoals een SR een nieuw pakket aan

#### Data

De data die wordt doorgestuurd tussen de start- en stop-conditie kan worden opgedeeld in volgende categorien:

**SAD + R:**

* Slave Adress Read
* Samengesteld uit een adres van 7 bits gevolg door 1 (read)
* Volgt op ST of SR
* Kondigt aan dat de master data van de slave wil lezen/ontvangen

**SAD + W:**

* Slave Adress Write
* Samengesteld uit een adres van 7 bits gevolg door 0 (read)
* 1ste byte
* Kondigt aan dat de master data naar de slave wil schrijven

**SUB:**

* Sub-adres (commando)
* **Volgt** op een **SAD+W**
* Wordt gebruikt
     * als commmando voordat de read wordt geinitieerd (start meting bijvoorbeeld)
     * als register-adres bij de slave (een bepaalde waarde of configuratie)

**DATA:**

* Eigenlijke data die wordt getransfereerd
* Volgt op een SUB bij write
* Volgt rechtstreeks op de SAD+R bij een read

#### Acknowledgments

Het laatste element is de **acknowledgment (ACK)**, deze wordt door de ontvanger (master of slave) gegenereerd.

**SAK:**

* Slave ACK van client
* 1 bit met waarde 0
* Na een write van de master
* Bevestigd goede ontvangst door de slave

**SNAK:**

* Slave NACK
* 1 bit met waarde 1  
  (lijn wordt niet naar beneden getrokken)
* Na een write van de master
* Indiceert dat de slave niet klaar is om data te leveren  

**MAK:**

* Master ACK van master
* 1 bit met waarde 0
* Na het uitlezen van de slave
* Indiceert dat nog een byte moet gelezen worden

**NMAK:**

* Master NACK van master
* 1 bit met waarde 0
* Na het uitlezen van de slave
* Indiceert dat geen byte moet gelezen worden

### Typisch gebruik van i2c-commando's

Om bovenstaande basis-commando's te kunnen begrijpen hebben we een aantal **voorbeelden/scenario's** nodig:

![](../../pictures/i2c_scenarios.png)

> We gebruiken dezelfde afkortingen dan eerder beschreven


#### Master verzendt (1 of meerdere bytes) naar slave:

* **Aankondigen** van een transcatie door:
  * **ST**
  * **SAD+w**
* De eerste data **SUB** is het type van data (of code van register)
* Dan volgt **1 of meerdere bytes**, waarbij de slave geacht wordt een SAK te signaleren
* De transactie eindigt met een **stop-conditie (SP)**

> In datasheets wordt een SUB veelal verwezen als een register

#### Master wil een (1 of meerdere bytes) van slave:

Een read wordt bijna altijd voorafgegaan door een write, meestal moet een sensor een waarde meten en daar een instructie voor krijgen (via een write...)

* We starten terug met ST
  * Dan dus eerst een write (meestal zonder DATA anders dan de SAD en SUB)
  * Gevolgd door een SAD+W
  * Daarna volgt een SUB die het commando(-byte) bevat
* Vervolgens wordt een SR gegenereerd door de master
* En volgt er een read
  * Doordat de master een SAD+R genereert
  * Na bevestiging van slave via een SAK
  * Zal de master elke byte bevestigen met een MAK
  * Wanneer geen data meer nodig (of verwacht) is zal deze MNAK genereren
  * en afsluiten met een SP

#### Clock-stretching (en alternatieven)

Een problematiek die voorkomt bij sensors of andere actuators is dat deze tijd nodig hebben om een meting uit te voeren (de ene wat meer als de andere).  
Dit houdt in dat het uitlezen van de bytes (na het uitsturen van meetcommando) niet direct kan worden geleverd.  

Om dit op te lossen zijn er 2 belangrijke strategieen voorzien:

* **Clock-stretching:**  
  De slave zal na de instructie en tijdens het lezen de communicatie uitstellen/vertragen door de klok (SCL) naar beneden te "trekken".   
  Dit zorgt ervoor dat er geen data moet verstuurd worden (zolang klok laag is) en de device/sensor/actuator zijn meting kan uitvoeren.  
  (Nota: i2c voorziet geen time-outs maar dat is wel best te voorzien als je met i2c werkt)  
  (Nota: men noemt dit ook clock-synchronization)
* **Werken met non-ack van de slave uit:**  
  De slave zal dan na de SAD+R laten weten dat de data nog niet gereed is door een NSAK.  
  Het is de bedoeling dat je aan de kant van een MCU een timer gebruikt en eventueel retries voorziet ...
  (in de datasheet staat meestal gedocumenteerd hoe lang je moet lezen)

![](../../pictures/avr_clockstretching_and_alternative.png)

### Voorbeeld: lezen van sensor-waarde (met clock-stretching)

Een typisch gebruik van clock-streching is het uitlezen van een sensor.   
De sensor kan meestal - na het activeren van deze meting - niet direct antwoorden.  

Hieronder zie je 2 extracten uit de datasheet van de Sensirion SHT21 (een sensor die temperatuur en relatieve vochtigheid opmeet.  
Deze sensor supporteert beide mogelijkheden:

**Clock-streching:**  

![](../../pictures/avr_clock_stretching.png)

**Werken met NACK vanuit slave:**  

![](../../pictures/avr_polling.png)
