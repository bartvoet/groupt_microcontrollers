## Structures, enums en unions

Tot nog toe hebben we 2 "groepen" van data gezien

**Enkelvoudige** variabelen zijnde data-structuren die 1 waarde bevatten:

* In verschillende groottes
      * char => 1 byte
      * short => 2 bytes
      * ...
* Met of zonder tekenbit (signed, unsigned)

Daar na hebben we ook een eerste soort **samengestelde** data gezien, namelijk arrays:

* Kan 0 tot n (**enkelvoudige**) waardes bevatten
* Waar n natuurlijk beperkt is tot de **grootte van de adressen**
* Van het **zelfde type**
* Deze waarden adresseerbaar via een **index**
* Kunnen genest zijn, je kan een array van arrays hebben...

### Structures

Een andere data-structuur die heel veel wordt gebruikt is de **structure** (of korter gezegd structures).  
Structures laten je net als een array toe verschillende 0 tot n **waarden** te groeperen maar:

* Waardes mogen van **verschillende types** zijn
* Adresseerbaar via een **naam**
* Elk van deze **velden** dient een naam te bevatten

> Vergelijkbare concepten vinden we in andere talen meestal terug via het concept van objecten.  
> Verschil is dat je daar niet enkel data kan aan koppelen maar ook functies... zie het laatste hoofdstuk ivm python

### Voorbeeld

#include <stdio.h>
#include <string.h>

```c
struct Student {
   unsigned char name[50];
   unsigned char labo_points;
   unsigned char exam_points;
};

int main( ) {

   struct Student a;
   struct Student b;

   strcpy(a.name , "Student 1");
   strcpy(b.name, "Student 2");



   Book1.book_id = 6495407;

   /* book 2 specification */
   strcpy( Book2.title, "Telecom Billing");
   strcpy( Book2.author, "Zara Ali");
   strcpy( Book2.subject, "Telecom Billing Tutorial");
   Book2.book_id = 6495700;

   /* print Book1 info */
   printf( "Book 1 title : %s\n", Book1.title);
   printf( "Book 1 author : %s\n", Book1.author);
   printf( "Book 1 subject : %s\n", Book1.subject);
   printf( "Book 1 book_id : %d\n", Book1.book_id);

   /* print Book2 info */
   printf( "Book 2 title : %s\n", Book2.title);
   printf( "Book 2 author : %s\n", Book2.author);
   printf( "Book 2 subject : %s\n", Book2.subject);
   printf( "Book 2 book_id : %d\n", Book2.book_id);

   return 0;
}
```

```c
struct [name] {

   type field;
   type field;
   ...
   type field;
}[variabelen]
```

```

```
