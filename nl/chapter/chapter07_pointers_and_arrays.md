# Pointers, arrays en seriële communicatie

We hebben tot nog toe met **enkelvoudige data-types** gewerkt:

* Via een **variabele** kan je een getal **wegschrijven** naar het **geheugen**
* Je kan je dit later (in je programma) terug uit het geheugen **lezen** door de naam van deze variabele te gebruiken als **expressie**

Zoals we in de komende weken gaan zien bestaan er ook types verschillende stukken data (getallen) in 1 variabele te verzamelen zoals:

* Arrays
* Structs
* Union

In dit hoofdstuk concentreren we ons op het eerste van deze 3 samengestelde data-types, meer concreet

* **Arrays** die je toelaten een (collectie van data-elementen van hetzelfde type)
* **Strings** die op dit principe verder bouwen (array van ASCCI-karakters)
* We geven ook een eerste introductie in **pointers** (in relatie tot Arrays)  
  (we bouwen hier nog op voort in de volgende hoofdstukken)

Daarna bekijken we een eerste interessante toepassing in het veld van de microcontrollers van Strings; seriële communicatie van je microcontroller.

Eerst echter - voor we aan arrays starten - gaan we echter iets dieper in op hoe data wordt **geencodeerd** in het geheugen...
