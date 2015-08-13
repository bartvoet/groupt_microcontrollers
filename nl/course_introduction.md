## Het vak "Microcontrollers"

Wat houdt de cursus microcontrollers gegeven in ACE Groep T?  
Hoe past deze in de opleiding?  
Wat ga je hier leren?  

### Situering van de module in de opleiding
Na digitale combinatorische logica en digitale sequentiële schakelingen, waar de studenten leerden om Programmeerbare logische devices te programmeren, is het nu de beurt aan de microcontroller.  

### Doelstelling van de cursus

De doelstellingen van deze cursus zijn inzicht verwerven in en te leren werken met zowel microcontrollers als met de programmeer-taal C  

Dit houdt in onder andere:

* De basis van de programmeertaal C (input/output, condities, loops, types, ...)
* Basis I/O periferieën en het leren aansturen ervan in de programmeertaal C
* Algemene communicatie-protocollen zoals i2c, spi, usart,
* De architectuur van een AVR microcontroller (en vergelijking met andere architecturen)
* Ter illustratie van deze architectuur AVR-assembler (enkel de noties)
* Het geheugen en registeropbouw in een microcontroller (en coputersystemen in het algemeen)
* Meer geavanceerde aspecten van C (bv. arrays, pointers, dynamisch geheugen, ...)
* Het analyseren van datasheets gerelateerd aan microcontrollers of periferieen.
* ...


> **Opmerking:**  
> De student mag gebruik maken van de computers voorzien in het labo.  
Als hij/zij deze cursus wil uitproberen op de eigen PC, de gebruikte software en toolchains zijn open en beschikbaar (+ getest) op de volgende OS:
>
* Linux (getest op Ubuntu 14.10)
* Mac OS X (getest op Maverics)
* Windows (getest op Windows 7)
* FreeBSD is ongoing  


### Principes

#### We starten van nul  
Het programmeren van microcontrollers en programmeren in C algemeen is niet de meest eenvoudige manier om te leren te programmeren (maar uiteindelijk wel zeer efficient).  

Om iedereen dezelfde kans te geven (met of zonder ervaring) start deze cursus vanaf de basis van voor wat betreft programmeren in en microcrontollers en word de nodige herhaling meegegeven waar nodig (gerelateerd aan aspecten van elektronica).  

#### Theorie en praktijk bij elkaar
Elk hoofdstuk duurt (afhankelijk van het onderwerp) 1 tot maximum 2 avonden.  
De verhouding tussen theorie en labo is als volgt.

* 1/4 theorie
* 2/4 labo's (tools, programmeren en hardware setup)
* 1/4 begeleiding en evaluatie  (tijdens labo's)

De planning van de cursus is zo opgesteld dat de theorie direct in de praktijk kan omgezet worden (theorie zal meestal in de eerste helft woren gegeven)

#### Timeboxed labos  
De labo's bevatten (meestal) verschillende oefeningen in volgorde van complexiteit (waaronder de meest complexe oefeningen meestal optioneel zijn).  

* **Basis-oefeningen**  
Oefeningen die iedereen dient te verwerken
* **Uitbreidings-oefeningen**  
Oefeningen voor de studenten die voorop lopen.

De oefeningen moeten binnen een bepaalde tijd worden opgelost ongeacht het feit dat niet alle oefeningen opelost zijn.  
Waar een student niet zijn verplichte oefening tijdelijk kan afsluiten zal er extra begeleiding worden voorzien tijdens de les (en in bepaalde gevallen in extra zituren).

#### Projecten  
Voor studenten die voorlopen op de cursus (reeds geprogrammeerd of met microcontrollers gewerkt) zullen extra projecten worden voorzien.

#### Verschillende aspecten

In elk labo wordt

* **Code:**  
Het aanleren van programmeren met een focus op de C-programmeertaal.  
Dit is meestal de start van een hoofdstuk waar we de nodige elementen aanleren die nodig zijn in de 2 in het toepassing-niveau (en ook niet meer want C is al voldoende complex).  
Dit wordt telkens ingeoefend aan de hand van korte labo-oefeningen op PC voor dat we dit toepassen op een microcontroller-omgeving.  

* **Architectuur en low-level**  
Het low-level en embedded programmeren steunt op een goede kennis van het platform.
Afhangende van het onderwerp zullen we dieper ingaan op instructie-sets, processsor-architectuur, opbouw van communicatie-protocols, ADC, ...  

* **Toepassing: tools en labo's**  
Het leren werken de benodigde tools zoals compilers, flash-tools, debuggers,  ...

* **Elektronica**  
Herhaling vanuit de andere elektronica-vakken waar nodig (bijvoorbeeld pull-up en pull-down, PWM, ...)
