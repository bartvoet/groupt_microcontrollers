# Interrupts en timers

Tot nog toe hebben we simpele **lineaire** programma's geschreven.  
Werken met embedded programma's vereist echter dat je meerdere taken tegelijkertijd moet uitvoeren.   

Daarom gaan we in dit hoofdstuk kennismaken met **2 nieuwe BASIS-elementen**:

* **Interrupts**  
  Een mechanisme/manier om code te schrijven die wordt uitgevoerd telkens zich een specifiek event voordoet  
* **Tellers** en **timers**  
  Een mechanisme aanwezig in de meeste morderne MCU's om events te tellen.  
  Als je dit mechanimse combineert met een klok (of vast puls-signaal) kan je een timer genereren.    
  Gecombineerd met interrupts kan dit mechanisme er ook voor zorgen dat bepaalde code wordt uitgevoerd op bepaalde tijdstippen. 

We gaan deze 2 concepten apart introduceren, als besluit gaan we nog een aantal concepten introduceren die hierop van toepassing zijn zoals:

* **Asynchroon** programmeren
* **Gedeelde "state"** en het **volatile**-keyword
* Een aantal **"best practices"** rond het werken met interrupts en timers ...
