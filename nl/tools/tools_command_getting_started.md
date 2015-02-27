## Starten met tools: Command line

Elke software-ontwikkelaar (en zeker als je met MCU's werkt) moet de beginselen kennen van het werken met command-line.  
Dit argument is nog sterker als je met embedded devices werkt die veelal enkel te besturen zijn via command-line

### CLI/shell/terminal

Een **shell** of **CLI** (command-line-interface) zorgt ervoor dat een gebruiker: 

* via tekst-**commando's** (acties) kan uitvoeren naar een **programma** toe 
* in meeste gevallen het operating system zelf (maar soms ook specifiek programma's met een CLI) 
* deze tekst-commando's kunnen meestal ook **gebundeld** worden in een **script** (dat je dan kan uitvoeren van een CLI)   
* nadat de opdracht is uitgevoerd krijgt de gebruiker weer de kans om de shell of het programma aan te spreken door op de opdrachtregel een nieuwe opdracht op te geven.  

De CLI geldt als tegenhanger van de grafische gebruikersomgeving (ofwel de GUI, Graphical User Interface).  

> **Nota:**  
> Als voorbeeld van zo'n GUI-omgeving gaan Eclipse bekijken.  

### Starten met CLI

Elk operating system bevat een CLI: 

**Linux**

In Linux kan je dit via een terminal-emulator zoals:  

* GNOME Terminal
* Terminator
* Guake
* ...

Een andere optie is Linux opstarten zonder grafische shell (X-server)

**MAC OS X**

In MAC OS X kan je de terminal bereiken via Programma’s - Hulpprogramma’s - Terminal
Net zoals bij Linux is de terminal omgeving gebaseerd op Bash (Bourne Again Shell) en kan je gelijkaardige commando's uitvoeren

**FreeBSD**
Gelijkaardig aan Linux en Mac OS X

**Windows 7**

In Windows heb je de keuze tussen de programma's (meestal te vinden bij de adminstratieve tools):

* CMD
* Powershell
* ConEmu (te installeren)

De Windows commando's hebben echter hun beperkingen.  
Vandaar dat er alternatieven bestaan als **MingW/MSYS** die je een Bash-compatibele omgeving meebrengen (zodat je gelijkaardige commando's als Linux kan uitvoeren)

### Algemene commando's

PATH-variabele

**ls**: directory inhoud Mac/Linux  
**ls -al**:  alle bestanden inclusief de verborgen bestanden met extra informatie  
**dir**: directory inhoud Windows  

**cd** directorypath: wijzigen huidige directory  
**cd ..** 1 directory naarboven  
**cd** naar je home directory  

**pwd** wat is je huidige directory

**>>** de output van een commando naar een file afleiden (kan gemakkelijk zijn als je wil loggen naar een file)
**>** zelfde als vorige commando maar 

Het commando ```ls -al > hello.txt``` zal bijvoorbeeld een file hello.txt maken met de inhoud van een directory


### Een C-programma op command-line (GCC)

GCC is een command-line-tool die c-code kan omzetten naar een uitvoerbaar bestand

Compilen gebeurt altijd in 2 stappen (later gaan we verder uitdiepen)


Stap 1:  
je schrijft je code naar een bestand en geeft dit een naam met de extensie C

```{.c}
#include <stdio.h>

void main() {
	printf("!!!Hello World!!!");
}
```

Stap 2:  
Je compileert het bestaand naar een object-file, dit is ...

```{.sh}
$ ls
hello.c
$ gcc -c hello.c
$ ls
hello.c  hello.o
$ gcc hello.o -o hello
$ ./hello 
!!!Hello World!!!
$ 
```

> In Windows gebruik je voor je executable de extensie exe, dus het laaste commando ```gcc hello.o -o hello.exe``` 

### Teksteditor

Bijgeleverd notepad++, zeker geen tekstverwerker zoals word, ...
