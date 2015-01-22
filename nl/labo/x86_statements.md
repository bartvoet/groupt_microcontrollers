## Labo 1

### Opdracht 1
#### Deel A
Schrijf een programma dat afprint:  
"Mijn naam is " gevolgd door je naam.

#### Deel B
Schrijf dit programma zodat je gebruikt maakt van een variabele om je naam in te bewaren.

#### Deel C
Wijzig dit programma zodat het je leeftijd berekent.  
(leeftijd en het jaar 2015 in variabelen)

#### Deel D
Wijzig dit programma zodat het programma alles opvraagt
(naam, geboortejaar, huidige jaar)

### Opdracht 2 (optioneel)
#### Deel A
Vul het onderstaande (laatste voorbeeld uit het introductie-hoodstuk) aan met een 3de getal en pas het print-statement aan

```
#include <stdio.h>

int main()
{
  int getal1,getal2;

  printf("%s","Geef getal 1 in ");
  scanf("%i",&getal1);
  printf("%s", "Geef getal 2 in ");
  scanf("%i",&getal2);
  printf("Het resultaat van %i + %i is %i",getal1,getal2,(getal1 + getal2));
  return 0;
}
```
#### Deel B
Zorg dat het ook het resultaat afdrukt voor vermenigvuldiging, verschil en deling.
Observeer daarbij ook het gedrag van deling (afronding) en verklaar.

### Opdracht 3 (optioneel)
Schrijf een programma dat opvraagt:
* Lengte en breedte van een huis
* Lengte en breedte van het terrein  
(van de assumptie uitgaande dat deze het huis omringt)

Druk 2 resulaten af:  
* De oppervlakte van je huis en tuin (tuin = terrein - huis)
* De snelheid waarmee je het gras kan maaien
  (er van uitgaande dat je 1 vierkante meter per 10 seconden)
