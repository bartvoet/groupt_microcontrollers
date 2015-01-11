## Introductie in programmeren  

Programma:

![](../../pictures/code_hierachy_of_statements.png)

Dit is een introductie en/of eerste kennismaking met programmeren aan de hand van de programmeer-taal C.

We pakken dit stap-voor-stap en starten ook enkel met de absolute basis (niet meer dan nog om een basis command-line-programma te schrijven):

* Basis-structuur van een applicatie
    * Statements en expressies
    * Operatoren en functies (aanroepen)
    * Variabelen en constanten
    * Assignments
* Input en output verwerken in een command-line-applicatie

>**Nota:**  
>Sommige zaken worden in dit hoofdstuk uitermate vereenvoudigd en zelfs onvolledig voorgesteld.
>Waarom?  
>Programmeren is niet de meest eenvoudige activiteit en we willen niet te snel vooruit lopen om iedereen (met of zonder eerdere programmeer-ervaring) van in het begin dezelfde basis (en kansen) mee te geven.


### Wat is een (software-)programma?
In essentie is bestaat een (uitvoerbaar) programma (executable) uit :

* een (of meerdere) **bestand**(en)  die een welbepaalde **sequentie van instructies** bevatten
* deze instructies worden door een **computer** (meer bepaald een processor) **geïnterpreteerd** en **uitgevoerd**.

Binnen een computer is een **CPU (processor)** verantwoordelijk voor het 1 voor 1 verwerken van deze instructies.  
In de praktijd gaat deze **CPU**:

* het programma van een hard-disk of een ander medium afhalen
* de instructies van dit programma in het RAM-geheugen laden
en heeft toegang tot het geheugen voor het opslaan van data.

![](../../pictures/intro_external_logical_computer_view.png)

### Soorten van instructies (gemeenschappelijk voor alle talen)

Binnen zo een programma zijn er verschillende soorten statements:  

* Berekeningen maken
* Afdrukken van het resultaat op een scherm of een andere medium
* Herhalen van instructies
* Aanroepen van functies en procedures
* Enkel uitvoeren van deze instructies onder bepaalde voorwaarden
* Lezen van randapparatuur (bv. scherm, toetsenbord, ...)  
* ...

![](../../pictures/basic_structure_programm.png)

> In somige gevallen kunnen deze instructies zelfs pas opgeroepen worden bij bepaalde events (wordt pas binnen een paar lessen besproken)

### Programmeertalen

Hoe dat dit in zijn werk gaat bekijken we aan de hand van een programmeertaal.  
Er bestaan veel verschillende programmeer-talen zoals C, C++, Java, Python, C#, ...

Voor deze cursus gaan we dit bekijken aan de hand van de programmeertaal C, momenteel nog altijd de meest gebruikte programmeertaal in de wereld van microctrollers en embedded programming.

In praktijk start een C-programma zijn leven als 1 (of meerdere) tekst-files.
Voor dit aan te maken heb je niet meer nodig dan een teksteditor (zoals bv. notepad, vim, notepad++, emacs, ...) zoals geillustreerd hieronder:

![](../../pictures/intro_printscreen_of_editor.png)

Ter illustratie zie je hier enkele voorbeelden van hetzelfde programma - printen van "Hello World" geschreven in verschillende talen.

####  Assembler

De **statements** uit een programma worden gewoonlijk vertaald naar machine-taal.
Machine-taal zijn instructies die gecodeerd in een serie bytes (opcodes),deze instructie zijn meestal tussen 1 en 3 bytes lang (in geval van x86).

Deze **instructies** verschillen van processor tot processor, de instructies die worden gebruikt voor x86 (wat in een 32-bit-computer) zijn niet te vergelijken met bijvoorbeeld degene die voor een microcontroller worden gebruik (later zullen we hier nog over uitwijden als we de AVR-achitectuur bestuderen).

Aangezien dat deze instructies niet leesbaar zijn (tenzij je echt veel moeite zou doen), bestaat er assembler.
Dit is

```
.data
hello:
        .string "Hello world\n"

.text
.globl _start
_start:
        movl $4, %eax
        movl $1, %ebx
        movl $hello, %ecx
        movl $13, %edx
        int $0x80

        movl $1, %eax
        movl $0, %ebx
        int $0x80
```
Om dit uit te voeren

```
$ as helloworld.s -o helloworld.o  
$ ld -s -o helloworld helloworld.o  
$ ./helloworld  
```

#### Voorbeeld in C

```
#include <stdio.h>

int main(int argc, char** argv)
{
  printf("Hello World\n");
  return 0;
}

```

```
$ gcc helloworld.c -o helloworld
$ ./helloworld
$ Hello World
$
```


#### Voorbeeld in Java

```java
public class HelloWorld {
    public static void main(String[] args) {  
        System.out.println("Welkom in de cursus microcontrollers");
    }
}
```

```
$ javac HelloWorld.java
$ java HelloWorld
$ Hello World
$
```

#### Voorbeeld in Python

```
print("hello world")
```

```
$ python helloworld.py
$ Hello World
$
```


##### Compileren en linken
Deze tekst kan je echter niet direct door een CPU laten uitvoeren.  
Alvorens je dat programma kan uitvoeren op het platform naar keuze (computer, microcontroller ...) moet deze tekst-file getransformeerd worden naar een uitvoerbare binaire file (in het geval van C).  

![](../../pictures/intro_position_of_writing_code.png)

Deze transformatie wordt uitgevoerd door  3 programma's:

* Een assembler die je code vertaalt naar assembler (zie later)  
* Een **compiler** die deze assembler vertaalt naar binaire objecten
* Een **linker** die deze binaire objecten linkt tot een uitvoerbaar programma

Dit programma kan dan rechtstreeks geïnterpreteerd worden door een CPU

##### Command-line
In de praktijk zijn er programma's die dat voor jou doen.  Voorbeelden van zulke compilers zijn gcc en msc.  
Ter illustratie zie je hieronder een voorbeeld van hoe dat je met GCC (via de terminal) een tekstbestand (helloworld.c) transformeert naar een programma (helloworld)

![](../../pictures/intro_printscreen_of_gcc.png)


Hoe dat precies in zijn werk gaat wordt in het volgend hoofdstuk uitgelegd.  
Voorlopig kan je er vanuit gaan (indien gcc geinstalleerd is) je dit onder de volgende vorm kan aanroepen:  
```gcc <c-file> -o <programmanaam>```  
om een uitvoerbaar command-line applicatie te verkrijgen.  
Het gebruik van deze tools wordt in een volgend hoofdstuk uitgelegd zodat we zelf de voorbeelden en labo's kunnen kunnen compileren en uitvoeren.

> Vooraleer te starten met microcontrollers oefenen we de basis van programmeren met c in aan de hand van dit soort programma's dat je van de command-line kan aanroepen.

> Hierover volgt in de volgende hoofdstukken nog zeer veel diepgang, voorlopig focussen we ons op de eerste activiteit, namelijk het schrijven  van code zelf.
