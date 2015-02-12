## Starten met tools: Compilen met command line

### Command line

dir of ls
cd
mkdir

### GCC

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
