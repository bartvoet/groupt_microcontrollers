## Labo: bitmasks en shift-operators

### Opdracht 1

#### Deel A

Maak een programma dat een getal inleest en dit vermenigvuldigt met 2.
Maak hiervoor enkel gebruik van shift-operators.    
Gebruik hiervoor bij voorkeur een unsigned char (= 1 byte). 

> **Tip:**   
Om een unsigned char in te lezen gebruik je het patroon %hhu ipv %i   
> **Tip:**  
Bekijk de tabellen uit de cursus rond shift-operatoren

#### Deel B (optioneel)

Laat het programma hetzelfde getal opnieuw vermenigvuldigen (nog altijd via shift-operatoren).  

De loop die je daarvoor schrijft stopt echter als de vermenigvuldiging niet meer klopt, dit zal gebeuren als je een overflow genereert (herinner dat je bits kwijtgeraakt bij shifts).  

> **Tip:**  
Een getal met de binaire waarde 01000001 kan je nog vermenigvuldigen met 2.   
> Een getal met de binaire waarde **1**1000001 daarentegen niet meer (herinner hoe we konden dedecteren of een bepaalde bit 1 of 0 was) 

### Opdracht 2

Maak een programma dat bij de start 2 unsigned chars inleest (patroon %hhu ipv %i)  
Voorbeeld voor inlezen van een unsigned char:  

```{.c}
unsigned char getal;
scanf("%hhu",&getal);
```

>**Tip:**   
>Gezien dit een incrementele opdracht is moet je hier maar 1 c-file doorsturen)

#### Deel A

Telt voor beide getallen hoeveel 1-bits en 0-bits deze bevatten.  
Het is voldoende om enkel het totaal over de 2 ingelezen getallen af te drukken (individueel hoeft niet).  

Stel dat we 5 en 3 ingeven als getal en wetende dat een unsigned char 1 byte of 8 bits groot is:

```
5 -> 00000101
3 -> 00000011
```

Op deze basis testen we ons programma:

```
$ ./totaal_1_en_0
Geef getal 1 in:
5
Geef getal 2 in:
3
Getal 5 en 3 bevatten samen 12 keer 0 en 4 keer 1 
$
```

> **Tip:**  
> Gezien een unsigned char 8 bits groot is zal je waarschijnlijk voor elke getal 8 maal loopen.

> **Extra tip:**  
> Niet verplicht te gebruiken maar wel een mooie extra, je kan de sizeof operator gebruiken om te bepalen hoe lang je moet loopen.

#### Deel B

Tel hoeveel bits verschillend zijn.
Gebruik de meest efficiente operator hiervoor die we in de cursus hebben gezien.  

>**Tip**:  
>Eén van de bitwise-operatoren (die we hebben gezien) zal 1 aanduiden indien 2 bits verschillend zijn en 0 als de bits gelijk zijn (voor meer info zie cursus-tekst).   

#### Deel C

Tel hoeveel bits gelijk aan elkaar zijn op dezelfde positie.  

> **Tip**:  
> Opnieuw er is een specfieke operator die dat voor jou kan doen, die enkel 1 geeft als de bits gelijk zijn aan elkaar.  

#### Deel D

Tel hoeveel posities waarbij er bij minstens 1 van beide bits 1 is
  
> **Tip**:
> Idem dito... vorig deel B en C

#### Deel E (optioneel)

Plak beide getallen aan elkaar adhv van een bitshift naar een unsigned short.    
Het eerste getal dat je inleest is de MSB

### Opdracht 3 (optioneel)

Zelfde als opdracht 2 uit de loops, maar met de nieuwe operatoren (zou stuk éénvoudiger moeten zijn).

#### Deel A
Print een binaire representatie af van een getal (zie lessen combinatorische en als je er niet uitgeraakt vraag maar aan de docent :))

#### Deel B (optioneel)
Werk dit verder uit door het volgende af te printen door middel van een loop (starten van 1 en vervolgens maal 2).  
Je mag eventueel spaties printen ipv een 0 om een leuker effect te verkrijgen.  

```
00000001  
00000010  
00000100  
00001000  
00010000  
00100000  
01000000  
10000000  
01000000  
00100000  
00010000  
00001000  
00000100  
00000010  
00000001  
```

#### Deel C
Inverteer dit dit resultaat

