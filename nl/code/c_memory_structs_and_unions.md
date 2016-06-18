## Structures

Binnen de programmeer-taal C bestaan er **2 "groepen"** van **data-types** (types van variabelen).

Aan de ene kant bestaan er **Enkelvoudige** of primitieve variabelen:

* Bevatten **1 waarde**
* Bestaan in verschillende groottes
    * char => 1 byte
    * short => 2 bytes
    * ...
* Verschillende encodings
    * Integers met tekenbit (signed)
    * Integers zonder tekenbit (unsigned)
    * Floating-point-types (float, double)

De andere groep noemen **samengestelde** of **complexe** data-types:

* Deze kunnen **verschillende waardes** bevatten
* Letterlijk **gegroepeerd** onder 1 variabele

We hebben al een eerste type gezien, namelijk **arrays**:

* Kan 0 tot n (**enkelvoudige**) waardes bevatten
* Waar n natuurlijk **beperkt** is tot de **grootte van de adressen**
* Deze waarden zijn van het **zelfde type**
* Deze waarden kunnen gelezen en gewijzigd worden een **index**  
  Maw
* Kunnen genest zijn, je kan een array van arrays hebben...

### Wat zijn structs?

Een **andere data-structuur** die heel veel wordt gebruikt is de **struct** (of languit gezegd structures).  
Structs laten je - net als een array - toe verschillende 0 tot n **waarden** te groeperen maar:

* Deze waardes mogen van **verschillende types** zijn
* Zijn Adresseerbaar via een **naam** (**niet** via een **index** zoals bij arrays)
* Elk van deze **velden** dient een naam te bevatten

> Vergelijkbare concepten vinden we in andere talen meestal terug via het concept van objecten.  
> Verschil is dat je daar niet enkel data kan aan koppelen maar ook functies... zie het laatste hoofdstuk ivm python

### Een voorbeeld ...

Laten we in dit hoofdstuk starten met een voorbeeld van een applicatie die punten van studenten bijhoudt en afdrukt.  
(zonder structs voorlopig nog)

```c
#include <stdio.h>

int main()
{
  char* student_naam;
  int labo_points;
  int exam_points;

  student_naam = "Jan Python";
  labo_points = 20;
  exam_points = 20;

  printf("De student %s heeft %i labo-punten en %i examen-punten\n",
		                              student_naam,labo_points,exam_points);

  return 0;
}
```

Dit voorbeeld bevat 3 **variabelen** **relevant** voor een **student** in deze richting ...

### ... met structs

We kunnen dit voorbeeld omvormen naar een **equivalent** voorbeeld met **structs**.  
Het begin van deze code start met het declareren van een struct, dit omvat:

* Het **keyword** **struct** gevolgd door
* De **naam** van dit **type** (student)
* De **velden** (of onderdelen) van dit struct-type

> Dit is een eerste **verschil met arrays**, je moet een "custom" of "specifiek" **type** declareren.   


```c
#include <stdio.h>

struct student {
   char* student_naam;
   int labo_points;
   int exam_points;
};

int main()
{
  struct student een_student;

  een_student.student_naam = "Jan Python";
  een_student.labo_points = 20;
  een_student.exam_points = 20;

  printf("De student %s heeft %i labo-punten en %i examen-punten\n",
		  een_student.student_naam,een_student.labo_points,een_student.exam_points);

  return 0;
}
```

Het type - dat we boven hebben gedeclareerd - kunnen we dan dan gebruiken net als een gewone variabele (van een enkelvoudig type).

```c
struct student een_student;
```

Het enige **verschil** is dat je voor de **declaratie** van zo'n variabele het **keyword struct** moet gebruiken.  

> Zo weet de compiler (en degene die jou code leest) dat dit een zelf-gedefinieerd type (en niet een bestaand type)

Daarna kan je de velden van deze struct-variabele (deel-variabelen) gebruiken via de **naam** dit veld.   
Je gebruikt een **.-notatie** (dot in het engels wordt hier veel voor gebruikt) om de verschillende velden te benoemen.

```c
een_student.exam_points = 20;
```
Dit geldt zowel voor het initialiseren van een waarde als voor het uilezen van deze waardes.

```c
printf("De student %s heeft %i labo-punten en %i examen-punten\n",
    een_student.student_naam,een_student.labo_points,een_student.exam_points);
```

> Dit is een 2 verschil met arrays waardat je een index gebruikte om aan de verschillende velden te raken.

### Declaratie en initialisatie (1)

Je kan ook een struct-variabele - net zoals we eerder hebben gezien voor primitieve variabelen - tegelijkertijd initialiseren en declareren.

```c
#include <stdio.h>

struct student {
   char* student_naam;
   int labo_points;
   int exam_points;
};

int main()
{
  struct student een_student = {
		 .student_naam = "Jan Python",
		 .labo_points = 20,
		 .exam_points = 20
  };

 printf("De student %s heeft %i labo-punten en %i examen-punten\n",
		  een_student.student_naam,een_student.labo_points,een_student.exam_points);

  return 0;
}
```

In plaats van de velden - met de eerder getoonde dot-notatie - afzonderlijk te initalisatie kan je dit ook doen bij declaratie zoals hierboven beschreven.

### Declaratie en initialisatie (2)

Je kan zelfs nog korter maken door de veld-namen weglaten, maar dan is de volgorde waarin de individuele velden belangrijk.  
Deze komen dan overeen met de volgorde hoe dat de velden gedeclareerd zijn binnen het type.

```c
#include <stdio.h>

struct student {
   char* student_naam;
   int labo_points;
   int exam_points;
};

int main()
{
  struct student een_student = {"Jan Python",20, 20 };

  printf("De student %s heeft %i labo-punten en %i examen-punten\n",
		  een_student.student_naam,een_student.labo_points,een_student.exam_points);

  return 0;
}
```
Welke vorm je prefereert (met of zonder veldnamen) hangt fel af van de situatie en is ook een kwestie van stijl en voorkeur.

Dit soort van  initialisatie tijdens declaratie hebben we nog al gezien, namelijk bij arrays.

```c
int een_array[] = {1,2,3}
printf("%i",een_array[0]);
```


### Opbouw van structs in het geheugen... en arrays

Belangrijk om te weten is dat bij een struct - net als bij een array - alle velden na elkaar in het geheugen worden geplaatst.

```c
#include <stdio.h>

struct student {
   char* student_naam;
   int labo_points;
   int exam_points;
};

int main()
{
  struct student een_student = {"Jan Python",20, 20 };

  printf("   sizeof(...naam)     = %zu \n",sizeof(een_student.student_naam));
  printf(" + sizeof(...labo...)  = %zu \n",sizeof(een_student.labo_points));
  printf(" + sizeof(...exam...)  = %zu \n",sizeof(een_student.exam_points));

  printf(" + ---------------------------- \n");

  printf(" = sizeof(struct...)   = %zu\n",sizeof(struct student));
  printf(" = sizeof(een_student) = %zu\n",sizeof(een_student));

  printf("\n");

  printf("Adres student               = %p\n",&een_student);
  printf(" == \n");
  printf("Adres student.student_naam  = %p\n",&een_student);
  printf(" +  sizeof(...naam)         = %zu \n",sizeof(een_student.student_naam));
  printf("= Adres student.labo_points = %p\n",&een_student.labo_points);
  printf(" + sizeof(...labo...)       = %zu \n",sizeof(een_student.labo_points));
  printf("Adres student.exam_points   = %p\n",&een_student.exam_points);

  return 0;
}
```

Om dit te bewijzen voeren we bovenstaand stuk code uit:

```bash
  sizeof(...naam)     = 8
+ sizeof(...labo...)  = 4
+ sizeof(...exam...)  = 4
+ ----------------------------
= sizeof(struct...)   = 16
= sizeof(een_student) = 16

Adres student               = 0x7ffd6402cca0
==
Adres student.student_naam  = 0x7ffd6402cca0
+  sizeof(...naam)          = 8
= Adres student.labo_points = 0x7ffd6402cca8
+ sizeof(...labo...)        = 4
Adres student.exam_points   = 0x7ffd6402ccac
```

We bemerken hier (voorlopig):

* De **struct** is zo groot als de **som** van de groottes van zijn **velden**
* Het **adres** van **elk veld** is afhankelijk van


### Een struct als argument

Een struct kan je net zoals een primiteve variabele meegeven aan een functie.

```c
#include <stdio.h>
#include <string.h>

struct student {
   char student_naam[50];
   int labo_points;
   int exam_points;
};

void print_student(struct student student) {
	int gemiddelde = (student.labo_points + student.exam_points)/2;

	printf("Student %s heeft %i labo-punten en %i examen-punten",
			student.student_naam,student.labo_points,student.exam_points);
	printf(", zijn/haar gemiddelde is %i en %s is ",gemiddelde,student.student_naam);
	if(gemiddelde > 10) {
		printf("geslaagd");
	} else {
		printf("niet geslaagd");
	}
	printf("\n");
}

int main( ) {
   struct student a = {
		   .student_naam="Jan Java",
		   .labo_points=18,
		   .exam_points=14
   };
   struct student b = {
		   .student_naam="Peter Python",
		   .labo_points=16,
		   .exam_points=12
   };

   print_student(a);
   print_student(b);

   return 0;
}
```

Dit geeft als resultaat:

```bash
Student Jan Java heeft 18 labo-punten en 14 examen-punten, zijn haar gemiddelde is 16 en Jan Java is geslaagd
Student Peter Python heeft 16 labo-punten en 12 examen-punten, zijn haar gemiddelde is 14 en Peter Python is geslaagd
```

### Struct vs Arrays

Een struct kan je dus gewoon **als waarde** doorgeven aan een **functie**.   
Telkens als je een struct meegeeft aan een functie wordt er een copy meegemaakt in het geheugen van deze struct.

Dit is niet zoals bij arrays die eigenlijk als pointer worden meegegeven aan functies.  

```c
#include <stdio.h>

struct test_structuur {
	unsigned short a;
	unsigned short b;
};

void een_struct_functie(struct test_structuur een_structuur_als_argument)
{
	printf("Positie een_structuur_als_argument  != %p\n",&een_structuur_als_argument);
}

void een_array_functie(unsigned short een_array_als_argument[])
{
	printf("Positie een_array_als_argument      == %p\n",een_array_als_argument);
}

int main()
{
   struct test_structuur een_structuur = { 0xAABB,0xCCDD };
   unsigned short een_array[] = { 0xAABB,0xCCDD };


   printf("Positie een_structuur               => %p\n",&een_structuur);
   een_struct_functie(een_structuur);
   printf("Positie een_array                   => %p\n",&een_array);
   een_array_functie(een_array);

   return 0;
}
```

### Waarom structs gebruiken: meerdere functies!

De belangrijkste **eigenschap van structs** is dat je date kan de **groeperen**.  
Een gevolg hiervan is dat je hier **herhaling** mee kan **vermijden**

Een eerste **voorbeeld** is als je **dezelfde data** moet doorgeven aan **meerdere functies**  
We hernemen het "studenten"-voorbeeld en splitsen een aantal functies uit.


```c
#include <stdio.h>
#include <string.h>

struct student {
   char student_naam[50];
   int labo_points;
   int exam_points;
};

int gemiddelde_score_student(struct student een_student)
{
	return (een_student.exam_points + een_student.labo_points)/2;
}

int student_is_geslaagd(struct student een_student)
{
	return gemiddelde_score_student(een_student) >= 10;
}

void print_geslaagd_of_niet(struct student een_student) {
	if(student_is_geslaagd(een_student)) {
		printf("geslaagd");
	} else {
		printf("niet geslaagd");
	}
}

void print_student(struct student een_student) {
	printf("Student %s heeft %i labo-punten en %i examen-punten",
			een_student.student_naam,een_student.labo_points,een_student.exam_points);
	printf(", zijn/haar gemiddelde is %i en %s is ",
			gemiddelde_score_student(een_student),een_student.student_naam);
	print_geslaagd_of_niet(een_student);
	printf("\n");
}

int main( ) {
   struct student a = {
		   .student_naam="Jan Java",
		   .labo_points=18,
		   .exam_points=14
   };
   struct student b = {
		   .student_naam="Peter Python",
		   .labo_points=16,
		   .exam_points=12
   };

   print_student(a);
   print_student(b);

   return 0;
}
```

In bovenstaande code hebben we de functie print_student uitgesplitst in een aantal kleinere functies.  
Door een struct mee te geven besparen we ons de moeite meerdere malen meerdere argumenten mee te geven aan verschillende functies.

### Waarom structs gebruiken: toevoegen (of wijzigen) van velden!

```c
#include <stdio.h>
#include <string.h>

struct student {
   char student_naam[50];
   int labo_points;
   int exam_points;
   int medewerking;
};

int gemiddelde_score_student(struct student een_student)
{
	return (een_student.exam_points + een_student.labo_points + een_student.medewerking)/3;
}

int student_is_geslaagd(struct student een_student)
{
	return gemiddelde_score_student(een_student) >= 10;
}

void print_geslaagd_of_niet(struct student een_student) {
	if(student_is_geslaagd(een_student)) {
		printf("geslaagd");
	} else {
		printf("niet geslaagd");
	}
}

void print_student(struct student een_student) {
	printf("Student %s heeft %i labo-punten, %i examen-punten en %i voor medewerking",
			een_student.student_naam,een_student.labo_points,een_student.exam_points,een_student.medewerking);
	printf(", zijn/haar gemiddelde is %i en %s is ",
			gemiddelde_score_student(een_student),een_student.student_naam);
	print_geslaagd_of_niet(een_student);
	printf("\n");
}

int main( ) {
   struct student a = {
		   .student_naam="Jan Java",
		   .labo_points=18,
		   .exam_points=14,
		   .medewerking=16
   };
   struct student b = {
		   .student_naam="Peter Python",
		   .labo_points=16,
		   .exam_points=12,
		   .medewerking=14
   };

   print_student(a);
   print_student(b);

   return 0;
}
```

```bash
Student Jan Java heeft 18 labo-punten, 14 examen-punten en 16 voor medewerking, zijn/haar gemiddelde is 16 en Jan Java is geslaagd
Student Peter Python heeft 16 labo-punten, 12 examen-punten en 14 voor medewerking, zijn/haar gemiddelde is 14 en Peter Python is geslaagd
```

### Geneste structs

Een volgende wijziging die we aanbrengen is het uitsplitsen van naam in een voornaam en achternaam.  
We maken hiervoor een aparte struct-definitie voor aan (gezien we deze in het volgende voorbeeld gaan herbruiken)


```c
#include <stdio.h>
#include <string.h>

struct naam {
	char voornaam[25];
	char achternaam[25];
};

struct student {
   struct naam student_naam;
   int labo_points;
   int exam_points;
   int medewerking;
};

int gemiddelde_score_student(struct student een_student)
{
	return (een_student.exam_points + een_student.labo_points + een_student.medewerking)/3;
}

int student_is_geslaagd(struct student een_student)
{
	return gemiddelde_score_student(een_student) >= 10;
}

void print_geslaagd_of_niet(struct student een_student) {
	if(student_is_geslaagd(een_student)) {
		printf("geslaagd");
	} else {
		printf("niet geslaagd");
	}
}

void print_student(struct student een_student) {
	printf("Student %s %s heeft %i labo-punten, %i examen-punten en %i voor medewerking",
			een_student.student_naam.voornaam,een_student.student_naam.achternaam,
			een_student.labo_points,een_student.exam_points,een_student.medewerking);
	printf(", zijn/haar gemiddelde is %i en %s is ",
			gemiddelde_score_student(een_student),
			een_student.student_naam.voornaam);
	print_geslaagd_of_niet(een_student);
	printf("\n");
}

int main( ) {
  struct student a = {
      .student_naam= {.voornaam = "Jan", .achternaam = "Java"},
      .labo_points=18,
      .exam_points=14,
      .medewerking=16
  };
  struct student b = {
      .student_naam= {.voornaam = "Peter", .achternaam = "Python"},
      .labo_points=16,
      .exam_points=12,
      .medewerking=14
  };

   print_student(a);
   print_student(b);

   return 0;
}
```

```c
Student Jan Java heeft 18 labo-punten, 14 examen-punten en 16 voor medewerking, zijn/haar gemiddelde is 16 en Jan is geslaagd
Student Peter Python heeft 16 labo-punten, 12 examen-punten en 14 voor medewerking, zijn/haar gemiddelde is 14 en Peter is geslaagd
```


### Arrays van structs

```c
#include <stdio.h>
#include <string.h>

struct naam {
	char voornaam[25];
	char achternaam[25];
};

struct student {
   struct naam student_naam;
   int labo_points;
   int exam_points;
   int medewerking;
};

int gemiddelde_score_student(struct student een_student)
{
	return (een_student.exam_points + een_student.labo_points + een_student.medewerking)/3;
}

int student_is_geslaagd(struct student een_student)
{
	return gemiddelde_score_student(een_student) >= 10;
}

void print_geslaagd_of_niet(struct student een_student) {
	if(student_is_geslaagd(een_student)) {
		printf("geslaagd");
	} else {
		printf("niet geslaagd");
	}
}

void print_student(struct student een_student) {
	printf("Student %s %s heeft %i labo-punten, %i examen-punten en %i voor medewerking",
			een_student.student_naam.voornaam,een_student.student_naam.achternaam,
			een_student.labo_points,een_student.exam_points,een_student.medewerking);
	printf(", zijn/haar gemiddelde is %i en %s is ",
			gemiddelde_score_student(een_student),
			een_student.student_naam.voornaam);
	print_geslaagd_of_niet(een_student);
	printf("\n");
}

int main() {

	int i;

     struct student studenten[] = {
		{
		   .student_naam= {.voornaam = "Jan", .achternaam = "Java"},
		   .labo_points=18,
		   .exam_points=14,
		   .medewerking=16
		},{
		   .student_naam= {.voornaam = "Peter", .achternaam = "Python"},
		   .labo_points=16,
		   .exam_points=12,
		   .medewerking=14
	    },{
		   .student_naam= {.voornaam = "Cedric", .achternaam = "C"},
		   .labo_points=16,
		   .exam_points=12,
		   .medewerking=14
	   }
	};

    for(i=0;i<3;i++) {
    	print_student(studenten[i]);
    }

   return 0;
}
```

### Structs en pointers

```c
#include <stdio.h>
#include <string.h>

struct name {
	char name[50];
	char last_name[50];
};

struct student {
   struct name name;
   int labo_points;
   int exam_points;
};

void print_studenten(struct student studenten[],int aantal) {
	int i;

	for(i=0;i<aantal;i++) {
		struct student student = studenten[i];
		int gemiddelde = (student.labo_points + student.exam_points)/2;

		printf("Student %s %s heeft %i labo-punten en %i examen-punten",
				student.name.name,student.name.last_name,student.labo_points,student.exam_points);
		printf(", %s %s gemiddelde is %i en is ",student.name.name,student.name.last_name,gemiddelde);
		if(gemiddelde > 10) {
			printf("geslaagd");
		} else {
			printf("niet geslaagd");
		}
		printf("\n");
	}
}

void maak_student_aan(struct student* een_student,char* voornaam,char* naam) {
	strcpy(een_student->name.name , naam);
	strcpy(een_student->name.last_name, voornaam);
}

void zet_punten(struct student* een_student,int labo,int examens) {
	een_student->labo_points=labo;
	een_student->exam_points=examens;
}

int main( ) {
   struct student studenten[2];

   maak_student_aan(&studenten[0],"Student","1");
   maak_student_aan(&studenten[1],"Student","2");

   zet_punten(&studenten[0],18,14);
   zet_punten(&studenten[1],16,12);

   print_studenten(studenten,(sizeof(studenten)/sizeof(struct student)));

   return 0;
}
```

### sizeof

```c
#include <stdio.h>
#include <string.h>

struct name {
	char name[50];
	char last_name[50];
};

struct student {
   struct name name;
   int labo_points;
   int exam_points;
};


int main( ) {
   struct student studenten[2];
   struct student een_student;

   printf("   %zu \n",sizeof(een_student.name));
   printf(" + %zu \n",sizeof(een_student.labo_points));
   printf(" + %zu \n",sizeof(een_student.exam_points));

   printf(" + ---- \n");

   printf(" = %zu",sizeof(struct student));
   printf(" = %zu\n",sizeof(een_student));
   printf(" * 2 = %zu\n",sizeof(studenten));

   printf(" Aantal studenten = %zu\n",sizeof(studenten)/sizeof(struct student));

   return 0;
}
```

### unions

```c
union [name] {
   field definition;
   field definition;
   ...
   field definition;
} [variable1,variable2];  
```

```c
#include <stdio.h>
#include <string.h>

union data {
   long long ll;
   int i;
   char str[24];
} data;

int main()
{
	printf("Grootte union = %zu\n",sizeof(long long));
	printf("Grootte union = %zu\n",sizeof(data));
	return 0;
}
```
