

## Loops en condities (vervolg)

We hebben eerder condities en loops (herhalingen gezien):

* **Logische** en **relationele** operatoren (&&,||,==, ...)
* **if-statements**
  Evalueren van een expressie (als verschillend van 0)
  Op die basis een stuk code uitvoeren
* if- , else- , else if **clausules**
* **while-loop-statements**
  Herhalen zolang een expressie waar is (waar if maar 1 maal uitvoert)
* **Nesten** van deze **samengestelde** statements

In dit 2de deel bekijken een aantal andere loops:

* **for**-loop
* **do while** (exit-condition loop)
* **break** en **continue**-statements
* **conditionele expressies (?-operator)**
* **switch**-statements


### Duiding: for-loop

We starten met de for-loop.  
Dit is een loop gelijkaardig aan de while-loop (deze zal code herhalen zolang een expressie niet 0 evalueert), maar bevat 3 (2 extra) onderdelen: 

* **Initialisatie:**  
  Enkelvoudige statement(s) die worden uitgevoerd **voor het starten van loop** 
  Let wel, enkel statements, geen declaraties en ook geen complexe statements!!
* **Test:**  
  Hier komt dezelfde test-expressie zoals we deze in een while loop plaatsen. 
  Expressie gevalueerd voor **elke maal** dat we door deze loop lopen
* **Update:**  
  Statment uitgevoerd **na elke herhaling**

Zo'n **for-loop** zal de volgende vorm hebben

```{.c}
for(<initialisatie>;<test>;<update>) {
  <body>
}
```
### Duiding: gebruik van for-loop

Wanneer gebruik je for loops? 
Eénvoudig, vanaf het moment dat

* Je een variabele moet initialiseren voor het starten van deze loop
* Deze moet testen voor het uitvoeren
* Deze moet updaten na elke uitvoering

In praktijk gaan we zien dat dit vooral veel voorkomt bij het bijhouden van **tellers**

### Voorbeeld: for-loop als teller

Als eerste voorbeeld gebruiken we dan ook een teller-voorbeeld:

* We tellen tot 10
* Printen op elke lijn
* Eénmaal bij 10 tellen we terug naar beneden

```{.c}
int main()
{
    int i=0;
    for(i=0;i<10;i++) {
        printf("%i\n",i);
    }

    for(i=10;i>=0;i--) {
        printf("%i\n",i);
    }

    return 0;
}
```

Als we dit nu implementeren met een while-loop zien we dat we eigenlijk lijnen code besparen.

```{.c}
int main()
{
    int i=0;
    while(i<10) {
        printf("%i",i);
        i++;
    }

    i = 0;
    while(i>=0) {
        printf("%i",i);
        i--;
    }

    return 0;
}

```

### Voorbeeld: for-loop en arrays

In praktijk zullen for-loops bijna altijd gebruikt worden wanneer je arrays wil
itereren.

```{.c}
int main()
{
   int i=0;
   char* hello="Test";

   for(i=0;i<4;i++) {
      printf("%c\n",hello[i]);
   }
   return 0;
}
```


### Voorbeeld: geneste for-loops

Je bent vrij te kiezen welk naam je gebruikt als teller. 

In de praktijk wordt echter veel de variabele-naam **i** gebruikt. 
Als je dan een geneste loop zou hebben zou het niveau daaronder de volgende letter van het alfabet worden gebruikt...

Stel het volgende:

* Je wilt een aan tal rijen en kolommen vullen
* Elke combinatie van deze rij-kolom moet het patroon kolom-rij worden afgedrukt
* Elke rij start op een nieuwe regel

Dit kan bijvoorbeeld met een geneste for-loop worden geïmplementeerd:


```{.c}
int main()
{
   int i,j;

   for(i=0;i<10;i++) {
     for(j=0;i<10;i++) {
        printf("%i-%i ",i,j);
     }
   }
   return 0;
}
```

Dit geeft als resultaat:

```
0-0 0-1 0-2 0-3 0-4 0-5 0-6 0-7 0-8 0-9
1-0 1-1 1-2 1-3 1-4 1-5 1-6 1-7 1-8 1-9
2-0 2-1 2-2 2-3 2-4 2-5 2-6 2-7 2-8 2-9
3-0 3-1 3-2 3-3 3-4 3-5 3-6 3-7 3-8 3-9
4-0 4-1 4-2 4-3 4-4 4-5 4-6 4-7 4-8 4-9
5-0 5-1 5-2 5-3 5-4 5-5 5-6 5-7 5-8 5-9
6-0 6-1 6-2 6-3 6-4 6-5 6-6 6-7 6-8 6-9
7-0 7-1 7-2 7-3 7-4 7-5 7-6 7-7 7-8 7-9
8-0 8-1 8-2 8-3 8-4 8-5 8-6 8-7 8-8 8-9
9-0 9-1 9-2 9-3 9-4 9-5 9-6 9-7 9-8 9-9
```

### Voorbeeld: meerdere statements

In het het initialisatie- en update-segment kan je meerdere (enkelvoudige) statements uitvoeren. 
Deze kan je dan scheiden via de ,-operator 

Dit kan dan bijvoorbeeld worden gebruikt als je meerdere tellers wil bijhouden in 1 loop zoals in het volgende voorbeeld:

```{.c}
#include <stdio.h>

int main()
{
   int i,j;

   for(i=0,j=0;i<5;i++,j+=2) {
        printf("%i-%i ",i,j);
   }
   return 0;
}
```
Met het volgende resultaat

```
0-0 1-2 2-4 3-6 4-8
```

### Voorbeeld: do while

De while- en for-loop die we tot nog toe hebben gezien zijn entry-condition-loops. 
Dit wil zeggen dat je een stuk-code enkel en alleen uitvoert als het de conditie voldaan is.

C bevat ook een exit-condition-loop, namelijk een loop die eindigt als een conditie niet voldaan is.

```{.c}
#include <stdio.h>

#define GELDIGE_CODE     13

int main(void)
{
 int code;
    do
    {
        printf("Om toegang te verkrijgen, \n");
        printf("voer de geheime code in : ");
        scanf("%d", &code);
    } while (code != GELDIGE_CODE);
    printf("Welkom!\n");

    return 0;
}
```

Als je dezelfde functionaliteit zou willen schrijven met een gewone while-loop zou
duplicatie krijgen:

```{.c}
#include <stdio.h>

#define GELDIGE_CODE     13

int main(void)
{
 int code;

  printf("Om toegang te verkrijgen, \n");
  printf("voer de geheime code in : ");
  scanf("%d", &code);

 while (code != GELDIGE_CODE) {
        printf("Om toegang te verkrijgen, \n");
        printf("voer de geheime code in : ");
        scanf("%d", &code);
    } ;
    printf("Welkom!\n");

    return 0;
}
```

### Duiding: wanneer do while gebruiken

In het vorige voorbeeld zien we dat we do-while kunnen gebruiken om herhaling te vermijden.

In de praktijk wordt deze do while minder gebruikt als while- en for-loops

De regel is simpel hier, gebruik do while enkel als je code er leesbaarder door wordt (door bijvoorbeeld herhaling te vermijden)

### Duiding: Break- en continue-statements

In bepaalde gevallen wil op onverwachte ogenblikken een loop verlaten of een aantal stappen overslaan.
Hiervoor bestaan 2 keywords:

* **break**  
  Onderbreken van de code in de clausule vanaf de lijn van deze statement (en de loop). 
  De test-evaluatie wordt niet meer uitgevoerd

* **continue**  
  Onderbreken van de code in de clausule. 
  De test-evaluatie wordt wel opnieuw uitgevoerd

### Voorbeeld: continue-statement

```{.c}
#include <stdio.h>

int main()
{
   int i;

   for(i=0;i<5;i++) {
    if(i%2 == 0) {
     continue;
    }
     printf("%i ",i);
   }
   return 0;
}
```

```
1 3
```

### Voorbeeld: break-statement

```{.c}
#include <stdio.h>

int main()
{
   int i;

   for(i=0;i<5;i++) {
    if(i==3) {
     break;
    }
       printf("%i ",i);
   }
   return 0;
}
```

```
0 1 2
```


### Duiding: Conditionele expressie/operator

Tot nog toe hebben we condities enkel in complexe statements gebruikt.
Er is echter nog een manier om condities toe te passen namelijk via een conditionele expressie.

Zo een expressie heeft de volgende vorm:

```{.c}
<conditie>?<expressie_waar>:<expressie_niet_waar>
```

### Voorbeeld: Conditionele expressie/operator

Stel dat je bijvoorbeeld een functie schrijft die het verschil geeft tussen 2 getallen zou je dit als volgt kunnen doen:
```{.c }
int difference(int a, int b)
{
    if(a>b) {
       return  a-b;
    } else {
       return b-a;
 }
}
```

De conditionele expressie laat ons echter toe dit veel korter te beschrijven

```{.c }
int difference(int a, int b)
{
 return (a > b):a-b:b-a;
}
```

### Duiding: switch-statements

Switch lijkt op een if conditie in de zin dat het condities nakijkt maar heeft
een andere structuur:

* Start met switch-element waar je een variabele aan meegeeft
* Een aantal case-elementen waar je een waarde aan meegeeft
* Een default-element dat wordt uitgevoerd in alle gevallen

Elementen:


```{.c}
switch(<variabele>) {
case(<conditie>):
  <statement>
  <statement>
  ...
case(<conditie>):
...
default:
  <statement>
  <statement>
   ... 
}
```

### Voorbeeld: switch

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


### Voorbeeld: fallthrough

In het voorbeeld hierboven plaatsten we een break-statement aan het einde van elke clausule.

Dit is nodig wegens het principe van fallthrough. 
Namelijk 1 maal een match gevonden zal elk statement (ongeacht de case) volgende op de match worden uitgevoerd.

Om deze switch dan te beeïndigen gebruikt me switch cases.
Stel dat je voor karakter a tem d een hoofdletter wil afdrukken. 

```{.c}
#include <stdio.h>
#include <ctype.h>

int main(void)
{
 char ch;
 printf("Geef een karakter in\n ");
 scanf("%c",&ch);

 switch (ch) {
 case 'a':
  printf("A\n");
 case 'b':
  printf("B\n");
 case 'c':
  printf("C\n");
 case 'd':
  printf("D\n");
 default:
  printf("Iets anders\n");
 }
 return 0;
}
```

Het resultaat dat we vervolgens krijgen is dat alle karakters worden afgedrukt ipv
enkel het karakter A.

```
Geef een karakter in
a
A
B
C
D
Iets anders
```

In plaats daarvan moet je dan break-statements toevoegen:

```{.c}
#include <stdio.h>
#include <ctype.h>

int main(void) {
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);


  char ch;
  printf("Geef een karakter in\n ");
  scanf("%c",&ch);

  switch (ch) {
  case 'a':
    printf("A\n");break;
  case 'b':
    printf("B\n");break;
  case 'c':
    printf("C\n");break;
  case 'd':
    printf("D\n");break;
  default:
    printf("Iets anders\n");
  }
  return 0;
}
```

Daarna krijgen we dan wel het verwachte resultaat.

```
Geef een karakter in
a
A
```


### Voorbeeld: fallthrough om cases te groeperen

Deze **fallthrough** kan je echter wel expliciet gebruiken om een groepering te maken.
Stel dat je bijvoorbeeld "A of B of C" wil afdrukken kan je als volgt te werk gaan.

```{.c}
#include <stdio.h>
#include <ctype.h>

int main(void)
{
  char ch;
  printf("Geef een karakter in\n ");
  scanf("%c",&ch);

  switch (ch) {
  case 'a':
  case 'b':
  case 'c':
    printf("A of B of C\n");break;
  case 'd':
    printf("D\n");break;
  default:
    printf("Iets anders\n");
  }
  return 0;
}
```

