## Structures

Tot nog toe hebben we 2 "groepen" van data/variabelen gezien

**Enkelvoudige** variabelen zijnde data-structuren die 1 waarde bevatten:

* In verschillende groottes
      * char => 1 byte
      * short => 2 bytes
      * ...
* Met of zonder tekenbit (signed, unsigned)

Daarna hebben we ook een eerste soort **samengestelde** data gezien, namelijk arrays:

* Kan 0 tot n (**enkelvoudige**) waardes bevatten
* Waar n natuurlijk beperkt is tot de **grootte van de adressen**
* Van het **zelfde type**
* Deze waarden adresseerbaar via een **index**
* Kunnen genest zijn, je kan een array van arrays hebben...

### Wat zijn structs?

Een andere data-structuur die heel veel wordt gebruikt is de **struct** (of languit gezegd structures).  
Structs laten je - net als een array - toe verschillende 0 tot n **waarden** te groeperen maar:

* Deze waardes mogen van **verschillende types** zijn
* Zijn Adresseerbaar via een **naam** (**niet** via een **index** zoals bij arrays)
* Elk van deze **velden** dient een naam te bevatten

> Vergelijkbare concepten vinden we in andere talen meestal terug via het concept van objecten.  
> Verschil is dat je daar niet enkel data kan aan koppelen maar ook functies... zie het laatste hoofdstuk ivm python

Ook ander (bijzonder) verschil is dat een struct een type op zich is.
Je moet namelijk expliciet een type definieren waar je voor een array gewoon maar de variabele moest definieren.


### Voorbeeld

Als voorbeeld van een struct maken we een programma dat de punten voor de studenten uitrekent.

```c
#include <stdio.h>
#include <string.h>

struct student {
   char name[50];
   int labo_points;
   int exam_points;
};

void print_student(struct student student) {
	int gemiddelde = (student.labo_points + student.exam_points)/2;

	printf("Student %s heeft %i labo-punten en %i examen-punten",
			student.name,student.labo_points,student.exam_points);
	printf(", zijn haar gemiddelde is %i en %s is ",gemiddelde,student.name);
	if(gemiddelde > 10) {
		printf("geslaagd");
	} else {
		printf("niet geslaagd");
	}
	printf("\n");
}

int main( ) {
   struct student a;
   struct student b;

   strcpy(a.name , "Student 1");
   strcpy(b.name, "Student 2");

   a.labo_points=18;
   a.exam_points=14;

   b.labo_points=16;
   b.exam_points=12;

   print_student(a);
   print_student(b);

   return 0;
}

```

Dit geeft als resultaat:

```bash
Student Student 1 heeft 18 labo-punten en 14 examen-punten, zijn haar gemiddelde is 16 en Student 1 is geslaagd.
Student Student 2 heeft 16 labo-punten en 12 examen-punten, zijn haar gemiddelde is 14 en Student 2 is geslaagd.
```

### Declaratie van een variabele:

* Als je een een **variabele** van dit type **declareert** gebruik je - net zoals bij gewone data-types - de naam van het type
* Maar voorafgegaan door het **keyword struct**

### Declaratie van een struct-type

* Een variabele wordt **gedeclareerd** als een **specifiek type**
* Dit gebeurt in dit geval (en meestal) buiten functies, op globaal niveau.  
  Zo'n type kan ook binnen een functie worden gedeclareerd maar dit gebeurt zelden
  (dan verlies je ook het voordeel van zichtbaarheid)

Dit gebeurt met volgende **structuur**:

```c
struct [name] {

   type field;
   type field;
   ...
   type field;
}[variable,variable,...]
```

Uit bovenstaande structuur-beschrijving kunnen ook we afleiden dat:

* De naam optioneel is
* Je direct variabelen kan declareren in het type

Dit wordt minder gebruikt maar is wel de moeite waard om te vermelden.  
Zie onderstaand voorbeeld.

```c
#include <stdio.h>
#include <string.h>

struct {
   char name[50];
   int labo_points;
   int exam_points;
} a,b;

int main( ) {
   strcpy(a.name , "Student 1");
   strcpy(b.name, "Student 2");

   a.labo_points=18;
   a.exam_points=14;

   b.labo_points=16;
   b.exam_points=12;

   //en printen maar

   return 0;
}
```

### Geneste structs

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

void print_student(struct student student) {
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

int main( ) {
   struct student a;
   struct student b;

   strcpy(a.name.name , "Student");
   strcpy(a.name.last_name, "1");

   strcpy(b.name.name , "Student");
   strcpy(b.name.last_name, "2");


   a.labo_points=18;
   a.exam_points=14;

   b.labo_points=16;
   b.exam_points=12;

   print_student(a);
   print_student(b);

   return 0;
}
```

### Arrays van structs

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

void print_student(struct student student) {
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

int main( ) {
   struct student studenten[2];
   int i;

   strcpy(studenten[0].name.name , "Student");
   strcpy(studenten[0].name.last_name, "1");

   strcpy(studenten[1].name.name , "Student");
   strcpy(studenten[1].name.last_name, "2");


   studenten[0].labo_points=18;
   studenten[0].exam_points=14;

   studenten[1].labo_points=16;
   studenten[1].exam_points=12;

   for(i=0;i<sizeof(studenten)/sizeof(struct student);i++) {
	   print_student(studenten[0]);
   }

   return 0;
}
```

### Structs

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

void print_student(struct student student) {
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

struct student maak_student_aan(char* voornaam,char* naam) {
	struct student een_student;
	strcpy(een_student.name.name , naam);
	strcpy(een_student.name.last_name, voornaam);
	return een_student;
}

void zet_punten(struct student* een_student,int labo,int examens) {
	een_student->labo_points=labo;
	een_student->exam_points=examens;
}

int main( ) {

   struct student student_1=maak_student_aan("Student","1");
   struct student student_2=maak_student_aan("Student","2");

   zet_punten(&student_1,18,14);
   zet_punten(&student_2,16,12);

   print_student(student_1);
   print_student(student_2);

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
