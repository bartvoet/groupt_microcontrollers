
## Het vak "Microcontrollers"
Wat houdt de cursus microcontrollers gegeven in ACE Groep T?  
Hoe past deze cursus binnen de opleiding?  
Wat ga je hier leren?  

### Situering van de module in de opleiding
In de opleiding "digitale combinatorische" en "digitale sequentiële logica" heb je geleerd van (hardwarematig) logische devices te programmeren.

In de praktijk werkt deze hardware samen met (of wordt aangestuurd door) microcontrollers.

![](../../pictures/orientation_digital_courses.png)

In deze cursus leren we omgaan met deze "kleine computers" of microcontrollers.

De kennis van deze 3 vakken (module digitale technieken) zal uiteindelijk worden gebruikt in het vak "multimedia" waar je deze vaardigheden zal combineren.

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
* ...

### Principes

#### We starten van nul  
C is niet de meest eenvoudige taal om te starten met programmeren (maar uiteindelijk wel zeer efficient om te leren programmeren).  
 is moeillijk en kan snel tot frustraties leiden indien niet correct onderbouwd.  

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

#### Labo-vak
De theorie gegeven in dit vak is ter ondersteuning van het labo (niet omgekeerd), er zijn daarom geen examens of papers te volbrengen.  
De evaluatie wordt gedaan op basis van:
* Labo-opdrachten
* Aanwezigheden  
* Inzet  
* Begrip in het toepassen van de theorie in de praktijd

#### Aanwezigheden
Zoals hierboven vermeld is dit een labo-vak en wordt er verwacht van de student aanwezig is.  
In geval van verwittigen en/of goede reden kan een uitzonderlijke afwezigheid  toegestaan worden zonder impact op de punten.

#### Projecten  
Voor studenten die voorlopen op de cursus (reeds geprogrammeerd of met microcontrollers gewerkt) zullen extra projecten worden voorzien.

#### Gebruik van eigen PC (of labo-PC)
De student mag gebruik maken van de computers voorzien in het labo.  
Als hij/zij deze cursus wil uitproberen op de eigen PC, de gebruikte software en toolchains zijn open en beschikbaar (+ getest) op de meeste besturingssystemen (Windows,Linux,Mac).
Het is wel de bedoeling dat we dezelfde software gebruiken, in geval van problemen is het dan gemakkelijk een gemeenschappelijke oplossing te zoeken voor alle studenten.

#### Aankondigingen
Aankondigingen gebeuren op Toledo en per mail.
Per mail is dat naar het Groep T-adres, indien je wilt dat ik ook een ander adres stuur kan dit ook.

### Samenstelling cursus/Verschillende aspecten

* **Code:**  
Het aanleren van programmeren met een focus op de C-programmeertaal.  
Dit is meestal de start van een hoofdstuk waar we de nodige elementen aanleren die nodig zijn in de 2 in het toepassing-niveau (en ook niet meer want C is al voldoende complex).  
Dit wordt telkens ingeoefend aan de hand van korte labo-oefeningen op PC voor dat we dit toepassen op een microcontroller-omgeving.  

* **Architectuur en low-level**  
Het low-level en embedded programmeren steunt op een goede kennis van het platform.
Afhangende van het onderwerp zullen dieper ingaan op instructie-sets, processsor-architectuur, opbouw van communicatie-protocols, ADC, ...  

* **Toepassing: tools en labo's**  
Het leren werken de benodigde tools zoals compilers, flash-tools, debuggers,  ...

* **Elektronica**  
Herhaling vanuit de andere elektronica-vakken waar nodig (bijvoorbeeld pull-up en pull-down, PWM, ...)
