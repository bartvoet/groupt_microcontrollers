## Basis-oefeningen

### Oppervlakte tuin

### Deel A

Schrijf een programma dat de oppervlakte van een tuin berekent op basis van de totale oppervlakte en de tuin-oppervlakte.

Je geeft als input de breedte van de tuin en de breedte van het huis in, ga er vanuit dat je tuin en huis vierkant zijn.


~~~
             15 m
        +--------------+
        |     8 m      |
        |   +-----+    |
        |   |HUIS |8 m |15 m
        |   |     |    |
        |   +-----+    |
        |    TUIN      |
        +--------------+

Oppervlakte totaal = 15 m * 15 m = 225 m^2
Oppervlakte huis   = 10 m *  8 m =  64 m^2
                                  - -------
Oppervlakte thuis                = 161 m^2
~~~

Kijk na of de breedte van de tuin grootter is dan die van het huis.
Als deze niet correct beeindig het programma.

### Deel B

Doe hetzelfde maar ga er nu vanuit dat zowel thuis als tuin niet noodzakelijk een vierkant is...

~~~
                20 m
        +-----------------+
        |       10 m      |
        |    +------+     |
        |    | HUIS | 8 m |  15 m
        |    |      |     |
        |    +------+     |
        |      TUIN       |
        +-----------------+

Oppervlakte totaal = 20 m * 15 m = 300 m^2
Oppervlakte huis   = 10 m *  8 m =  80 m^2
                                  - -------
Oppervlakte thuis                = 220 m^2
~~~

### Loopje

Schrijf een programma dat telt tot een getal x
Vraag dit getal aan bij het opstarten van het programma en controleer dat het groter is dan 0

### BTW

#### Deel A

Schrijf een programma dat btw uitrekent.  
Het programma vraagt het netto-bedrag op via command line.  
Ga uit van een percentage van 6%

Voorbeeld van gebruik:

~~~
Geef het bedrag van het goed in: 50
De BTW bedraagt 3 euro.
~~~

#### Deel B

Laat de gebruiker kiezen tot welke categorie het goed behoort => 6% - 12% of 21%

Voorbeeld van gebruik:

~~~
Geef het bedrag van het goed in: 50
Geef de categorie in (type a voor 6%, b voor 12% en c voor 21%): b
De BTW bedraagt 6 euro.
~~~

#### Deel C

Blijf deze vragen stellen tot dat de gebruiker 0 in geeft.  
Druk daarna de totale btw uit over alle goederen.

Voorbeeld van gebruik:

~~~
Geef het bedrag van het goed in (typ 0 om berekening te stoppen): 50
Geef de categorie in (type a voor 6%, b voor 12% en c voor 21%): b
Geef het bedrag van het goed in (typ 0 om berekening te stoppen): 100
Geef de categorie in (type a voor 6%, b voor 12% en c voor 21%): c
Geef het bedrag van het goed in (typ 0 om berekening te stoppen): 0
De BTW bedraagt 27 euro
~~~
