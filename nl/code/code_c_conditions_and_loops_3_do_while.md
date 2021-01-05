

## Loops en condities: do while en switch

We hebben eerder condities en loops (herhalingen gezien):

* **Logische** en **relationele** operatoren (&&,||,==, ...)
* **if-statements**
  Evalueren van een expressie (als verschillend van 0)
  Op die basis een stuk code uitvoeren
* if- , else- , else if **clausules**
* **while-loop-statements**
  Herhalen zolang een expressie waar is (waar if maar 1 maal uitvoert)
* **Nesten** van deze **samengestelde** statements
* **for**-loop zeer interessant als je moet tellen  
  (later gaan we zien dat dit heel nuttig is bij arrays)

In dit 3de deel bekijken de resterende fucntionaliteiten:

* **do while** (exit-condition loop)
* **break** en **continue**-statements
* **conditionele expressies (?-operator)**
* **switch**-statements


### De "do while"-loop

De **while- en for-loop** die we tot nog toe hebben gezien zijn **entry-condition-loops**.
Dit wil zeggen dat je een stuk **code** (binnen de brackets) enkel en alleen **uitvoert als het de conditie voldaan is**.

In C bestaat er ook nog de "do while"-loop, deze is een voorbeeld van een **exit-condition-loop**.   
Namelijk een loop die **eindigt als een conditie niet voldaan is**, maw de code inde loop zal minstens 1 maal worden uitgevoerd.

#### Voorbeeld "do-while"

Als **voorbeeld** nemen we een programma dat blijf loopen zolang je geen **geldige toegangs-code** ingeeft:

```c
#include <stdio.h>

int main(void)
{
    int code;
    do
    {
        printf("Om toegang te verkrijgen, \n");
        printf("voer de geheime code in : ");
        scanf("%d", &code);
    } while (code != 13);
    printf("Welkom!\n");

    return 0;
}
```

De code binnen de loop - het inlezen van de geheime code -  moet zowiezo minstens 1 maal uitgevoerd worden.  
De test (is de code verschillend van de toegangscode 13) wordt na het uivoeren van deze code pas uitgevoerd.  
Als de test true oplevert (code is verschillend van 13) zal de code binnen de loop opnieuw worden uitgevoerd.  

#### Do-while vs while

Je kan dezelfde functionaliteit ook schrijven met een gewone while-loop.
In dat geval moet je echter 2 maal de "inlees"-code schrijven...

```c
#include <stdio.h>

int main(void)
{
 int code;

  printf("Om toegang te verkrijgen, \n");
  printf("voer de geheime code in : ");
  scanf("%d", &code);

 while (code != 13) {
        printf("Om toegang te verkrijgen, \n");
        printf("voer de geheime code in : ");
        scanf("%d", &code);
  }
  printf("Welkom!\n");

  return 0;
}
```

#### Wanneer do while gebruiken?

In het vorige voorbeeld zien we dat we do-while kunnen gebruiken om **herhaling te vermijden**.

In de praktijk wordt deze do while minder gebruikt als while- en for-loops

De regel is simpel hier, gebruik do while **enkel als je code er leesbaarder** door wordt (door bijvoorbeeld herhaling te vermijden)

### Break- en continue-statements

In bepaalde gevallen wil op onverwachte ogenblikken een **loop verlaten of** een aantal stappen **overslaan**.
Hiervoor bestaan 2 keywords, namelijk **break** en **continue** ...

#### Break-statement

Break zorgt ervoor dat je **loop** wordt **afgebroken**.  
In het voorbeeld hieronder zal de loop worden afgebroken als i gelijk is aan 3.

```c
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
   printf("\nNa de loop...\n");
   return 0;
}
```

Waar deze loop zonder break "0 1 2 3 4" zou afdrukken, wordt er met break maar tem 2 afgedrukt

```
0 1 2
Na de loop
```

#### Continue-statement

Bij een continue-statement wordt de code volgende op de continue wordt niet meer uitgevoerd (net zoals bij ).  
Het grote verschil echter is dat de loop wel wordt verdergezet, in het


```c
#include <stdio.h>

int main()
{
   int i;

   for(i=0;i<5;i++) {
    if(i == 3) {
     continue;
    }
     printf("%i ",i);
   }
   printf("\nNa de loop...\n");
   return 0;
}
```

```
0 1 2 4
Na de loop
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
