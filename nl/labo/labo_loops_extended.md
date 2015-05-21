## Labo: loops en condities (uitgebreid)

### Opdracht 1: rekenmachine

Deze oefeningen volgen elkaar op, geef maar 1 c file af.

#### Deel A

Schrijf een **functie**:

* Die de **macht** van een getal berekent.
* Deze accepteert als **1ste** parameter een **getal**
* En als **2de** parameter de **macht** tot waar dit getal moet worden verhoffen
* Maak hiervoor gebruik van een **for-loop**
* **Test** deze operatie uit in een main-methode (zie voorbeeld hieronder)

De volgende aanroep 
```{.c}
printf("%i",macht(2,3));
```
geeft dan 8 als resultaat


#### Deel B

Integreer/Hergebruik deze functie in de switch-rekenmachine uit het voorgaande hoofdstuk.  
Gebruik hiervoor het karakter **'^'**

Je mag de **code hieronder** als **start-punt** gebruiken:

```{.c}
#include <stdio.h>
#include <ctype.h>

char lees_karakter() {
    char c;
    do {
        c = getchar();
    } while (isspace(c));
    while (getchar() != '\n');
    return c;
}

int main(void) {
    char ch;
    int a, b;

    printf("Geef de operatie in:\n");
    ch = lees_karakter();

    printf("Geef getal a:");
    scanf("%i", &a);

    printf("Geef getal b:");
    scanf("%i", &b);

    switch (ch) {
    case '+':
        printf("%i + %i = %i \n", a, b, a + b);
        break;
    case '-':
        printf("%i - %i = %i \n", a, b, a - b);
        break;
    case '*':
        printf("%i * %i = %i \n", a, b, a * b);
        break;
    case '/':
        printf("%i / %i = %i \n", a, b, a / b);
        break;
    default:
        printf("%c is geen bestaande operator\n", ch);
        break;
    }

    return 0;
}

```

#### Deel C

Breidt de bovenstaande code uit:

* Met een **do-while-loop**.
* Zodat deze **switch**-statement zich **blijft herhalen** 
* **Zolang** het karakter **niet** gelijk is aan **'s'** (s van stop).

#### Deel D

Breidt de code uit zodat we het karakter 'p' kunnen gebruiken om deze macht te berekenen:

* Gebruik hiervoor **geen if-statement**
* De aanroep van de **macht-functie** mag maar 1 maal binnen het **switch**-statement gebeuren
* Maak hiervoor gebruik van het **fallthrough**-principe uit het voorgaande hoofdstuk
* Als resultaat kan je zowel p als ^ gebruiken om de macht te berekenen (zie 2 voorbeelden hieronder)

```
Geef de operatie in:
^
Geef getal a:10
Geef getal b:10
10 ^ 10 = 100 
```

of

```
Geef de operatie in:
p
Geef getal a:10
Geef getal b:10
10 ^ 10 = 100 
```
