## Microcontrollers

Dit is de cursus microcontrollers gegeven in ACE Groep T.  

### Situering van de module in de opleiding
Na digitale combinatorische logica en digitale sequentiële schakelingen, waar de studenten leerden om Programmeerbare logische devices te programmeren, is het nu de beurt aan de microcontroller.  

De doelstellingen van deze cursus zijn inzicht verwerven in en te leren werken met:  

* De basis van de programmeertaal C
* AVR-assembler (enkel de noties)
* Basis I/O periferieën en het leren aansturen ervan in de programmeertaal C
* Algemene communicatie-protocollen zoals i2c, spi, usart,
* De architectuur van een AVR microcontroller (en vergelijking met andere architecturen)
* Het geheugen en registeropbouw in een microcontroller (en coputersystemen in het algemeen)


> **Opmerking:**
> De student mag gebruik maken van de computers voorzien in het labo.  
Als hij/zij deze cursus wil uitproberen op de eigen PC, de gebruikte software en toolchains zijn open en beschikbaar (+ getest) op de volgende OS:
>
* Linux (getest op Ubuntu 14.10)
* Mac OS X (getest op Maverics)
* Windows (getest op Windows 7)
* FreeBSD is ongoing  

### We starten van nul
Starten met programmeren (en zeker in C) is moeillijk en kan snel tot frustraties leiden indien niet correct onderbouwd.  
De cursus start daarom met
Wel starten we reeds tijdens de 2de les

### Principes
De meeste hoofdstukken bestaan in tijd uit:

* 1/4 theorie
* 2/4 labo's (tools, programmeren en hardware setup)
* 1/4 evaluatie  

Deze hoofdstukken worden over het algemeen gespreid over 2-3 lesdagen uitgewerkt.  
De oefeningen worden in 2 verdeeld:

* **Basis-oefeningen**  
Oefeningen die iedereen dient te verwerken
* **Uitbreidings-oefeningen**  
Oefeningen voor de studenten die voorop lopen.

Het is de bedoeling dat we met de gehele klas dezelfde thema's aanvatten en beeindigen.

### Opbouw van de cursus:  
De cursus is chronologisch opgebouwd in verschillende fases of hoodstukken.  
In elk van deze hoofdstukken vind je volgende aspecten terug:
#### 4 niveau's:

* **Code:**  
Het aanleren van programmeren met een focus op de C-programmeertaal.  
Dit is meestal de start van een hoofdstuk waar we de nodige elementen aanleren die nodig zijn in de 2 in het toepassing-niveau (en ook niet meer want C is al voldoende complex).  
Dit wordt telkens ingeoefend aan de hand van korte labo-oefeningen op PC voor dat we dit toepassen op een microcontroller-omgeving.  

* **Architectuur en low-level**  
Het low-level en embedded programmeren steunt op een goede kennis van het platform.
Afhangende van het onderwerp zullen dieper ingaan op instructie-sets, processsor-architectuur, opbouw van communicatie-protocols, ADC, ...  

* **Elektronica**  
Herhaling van leerstof waar van toepassing

* **Toepassing: tools en labo's**  
1 (of meerdere) labo's om de aangeleerde theorie en c-skills toe te passen.

#### Onderdelen
##### Introductie:  

* Kennismaking
* Introductie van programmeren  
 * Basis van programmeren en intro in C (condities, loops, variabelen)
 * Kennismaking en opzetten van de software-tools
* Introductie van programmeren op microcontroller
 * Leren werken met toolchain voor microcontroller
 * Structuur van een microcontroller-programma
 * 1ste maal programmeren van een AVR (knipperlicht-labo op Arduino)

##### Basis GPIO programmeren  

* Externe opbouw van een microcontroller (pins en poorten)
* Vervolg programmeren in C: functies en procedures
* Werken met data-types, bits en bytes, ...
* Input en output op een microcontroller (GPIO)
* Werken met hardware-programmers

##### Timers en interrupts

* Macros
* Registers
* Timer- en interupts
  * Architectuur
  * Registers


##### Seriele protocollen UART


##### Seriele protocollen I2C en SPI

* Sensors (en "internet of things")
* I2C
* SPI


##### Motoren





---------------------------------------

##### Te verdelen
###### Seriele communicatie

###### Interrupts

###### ADC

###### Memory

###### EEProm

##### Float

* Labo met nunchuk
