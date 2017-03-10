## Labo: leds laten blinken met for-loops

Doel van de opdracht is het verwerken van 2 zaken die we hebben geleerd:

* For-loops
* Aanspreken van AVR-uitgangen

### Opdracht 1

AVR heeft bevat meerdere poorten of banken voor GPIO-gebruik.  
Elke poort is een verzameling van 8 (GP)IO-pinnen.  
We hebben eerder gezien dat elke pin van een poort indivueel kan aangesproken via  3 registers:

* DDR-register voor het bepalen of je pins in of output zijn
* PORT-register dat je gebruikt om een pin aan uit te zetten (of een pull-up te activeren in geval van input)
* PIN-register dat je gebrukt om na te kijken of een pin onder spanning staat

#### Deel A

Schrijf een programma dat - gebruikmakende van for-loops - 3 leds laat blinken:

* Deze leds moeten 1 voor 1 aangaan
* En vervolgens 1 voor 1 weer uitgaan (in omgekeerde volgorde)
* Tussen elke aan- en uitgaan moet korte tijds-panne zijn (bv halve seconde)
* 3 leds zijn voldoende (meer mag maar moet niet)

De leds moeten 3 opéénvolgende bits zijn van de beschikbare bank (B,C of D).  

Maak gebuik van :  

* For-loops voor het aflopen van de leds  
  (normaal gezien gezien zijn het 3 in het totaal)
* De event-loop blijft een while-loop
* Gebruik bitmasking zoals we eerder hebben gezien
* Gebruik variabelen om te bepalen bij welke led je start en waar je stopt

Tips:

* Als mogelijke oplossing ga je in de **eerste loop set-operaties** gebruiken, in de **tweede clear-operaties**
* Je programma gaat grotendeels de volgende structuur hebben:


```C
for-loop (optellen) {
     configureer als output
}

while-loop (event-loop) {
       for-loop (optellen) {
             led aan met bitmask
             delay
       }       
       for-loop (aftellen) {
             led uit met bitmask
             delay
       }
}
```

#### Deel B (optioneel)

Als je dit uitvoert zal je waarschijnlijk een loop GET-operaties en 1 met CLEAR-operaties hebben.  
Kan je dit ook op een andere manier?

(je mag ook direct deze oplossing implementeren, dan geef je gewoon Deel B af ipv Deel A)
