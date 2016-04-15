## Strings

### Duiding: ASCCI

Tot nu toe hebben we de unsigned char gebruikt om bytes (8 bits) in variabelen op te slagen.  
char (afkorting van character) wordt ook gebruikt om assci-karakters voor te stellen.

**ASCCI** is een internationale conventie die bepaalt welke cijfer-waarde overeenkomt met welke code:

![](../../pictures/chars-table-landscape.jpg)

### Voorbeeld: char-datatype als tekst

Deze ASCCI wordt ook door c-programma's gebruikt als conventie voor encoderen van karakter-waardes en het printen van tekst.

```c
#include <stdio.h>


int main(void) {
    char hello = 'a';
    printf("hello als karakter: %c\n",hello);
    printf("hello als cijfer: %i\n",hello);
}
```

### Voorbeeld: String

Zo 1 karakter is op zich niet zo heel bruikbaar.  
Daarom gebruikt met meestal array van char's om tekst bij te houden.  
Dit noemen ze ook strings

```c
#include <stdio.h>

int main(void) {
    char* hello = "TEST";
    printf("%s\n",hello);
    return 0;
}
```

### Voorbeeld: string wijzigen

Test is eigenlijk een pointer naar een constante (read-only).

```c
#include <stdio.h>

int main(void) {
    char* hello = "TEST";
    hello[0]='a';
    printf("%s\n",hello);
    return 0;
}
```

Deze code zal crashen (en niets printen).  
Dit was omdat deze string een pointer naar een constante was in het geheugen van het programma (komen we later nog op terug)

Als we echter "TEST" copieren in een array-variabele dan werkt dit wel

```c
#include <stdio.h>

int main(void) {
  char hello[5] = "TEST";
  hello[1]='A';
  hello[4]='A';
  printf("%s\n",hello);
	return 0;
}
```

Zoals je ziet kan je deze gewoon inlezen.

### Voorbeeld: string inlezen en wijzigen

```c
#include <stdio.h>

int main(void) {
    char hello[20];
    fgets(hello, sizeof(hello), stdin);
    printf("%s\n",hello);
    return 0;
}
```

### Duiding: String  en terminator

Een string niet langer kan zijn dan het geheugen in de char-array gereserveerd.  
Meer precies het maximum aantal karakter is gelijk aan het de grootte van de array - 1.  

Waarom is dit en hoe dat een printf-functie weet hoeveel karakters het mag afdrukken (als hij bijvoorbeeld maar met 4 karakters is gevuld (in een buffer van 20)?

Het antwoord ligt hier in de conventie die wordt gebruikt in c-programma's (en andere platformen).  
Een string wordt in een array namelijk altijd beeïndigd met het karakter ```\0``` (ook wel string-terminator genoemd)

In het voorbeeld hieronder zien we de inhoud van een char-array van 20 chars nadat hij is ingelezen met de tekst "TEST".

|0   | 1    |  2   |   3   |  4     |   5   |    6   |   ....  | 20 |
|----|------|------|-------|--------|-------|--------|---------|----|
|T   | E    |S     | T     |```\0```|       |        |         |    |

Op positie 4 zien we het karakter ```\0``` dat het einde van de eigenlijke tekst bepaald.  
Het gebruik van deze string-terminator (0-karakter) betekent dat je maar maximum 19 karakters in een char-array van 20 karakter kan opslaan.

### Voorbeeld: een while loop en een string

Om dit te illustreren volgend programma:

```c
#include <stdio.h>

int main(void)
{
    char hello[20]="TEST";
    printf("%s\n",hello);

    int teller = 0;

    while(teller < sizeof(hello)/sizeof(char)) {
        if(hello[teller]=='\0') {
            return 0;
        } else {
            printf("%c",hello[teller]);
        }
        teller++;
    }

    return 0;
}
```
