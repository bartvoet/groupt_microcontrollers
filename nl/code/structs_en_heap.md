Tot nu toe hebben we gezien hoe basistype variabelen declareren zoals int , long, etc, en complexe types zoals arrays en structs.

### Wat is de stack?

* speciale regio van het geheugen
* die tijdelijke variabelen
* gebruikt die door elke functie  
 (met inbegrip van de main () functie) opslaat.

De stack is een **LIFO** ( last in, first out) datastructuur, en wordt beheerd en geoptimaliseerd door de CPU Iedere keer dat een functie een nieuwe variabele declareert, wordt deze op **stack** of stapel geduwd.

Telkens wanneer de cpu een functie verlaat, worden alle variabelen van de stapel gegooid...  
Zodra een variabele wordt bevrijd, word dat geheugengebied beschikbaar voor andere variabelen op deze stack.

Het voordeel van de stack, is dat het geheugen dynamisch is maar toch voor u wordt beheerd.  
Je hoeft niet naar het geheugen toe te wijzen met de hand, of bevrijden zodra je niet meer nodig hebt.  

Ook is dit soort geheugen zeer snel door dat dit rechtstreeks beheerd wordt door de CPU (wat niet noodzakelijk het geval is bij heap-geheugen)

Wat meer is, omdat de CPU organiseert stack geheugen zo efficiënt , het lezen van en schrijven naar variabelen stack is erg snel.

### Wat is een heap

De heap is een andere regio van het geheugen:

* die niet automatisch voor jou wordt beheerd
* ookn niet rechtstreeks beheerd door de CPU

Om het geheugen op de heap toe te wijzen , moet je malloc () of calloc ( ), die zijn ingebouwd als C functies.
