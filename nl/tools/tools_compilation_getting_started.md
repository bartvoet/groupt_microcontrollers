## Een programman "builden"

Zoals bij de introductie meegegeven moet je een C-programma eerste compilen eer dat je het kan gebruiken als een uitvoerbaar bestand (of executable).

In het geval van C moet dit compilatie-proces opnieuw worden uitgevoerd voor omgevingen met verschillende

* processor-famillie (x86, ARM, AVR, ...)
* operating systeem (Linux, Windows, Mac OS X, ...)

![](../../pictures/compile_build.png)

Compilen (van een C-programma) wordt uitgevoerd in 2 stappen:

* **Compileren:**  
  De C-files worden elk omgezet naar een object-file (extensie .o).  
  Hier wordt de C-code reeds vertaald naar machine-taal
* **Linken:**  
  Hier worden 1 of meerdere object files met elkaar verbonden (en eventueel gelinkt aan externe libraries)

We starten met gcc te installeren

### GCC

De tool die we in deze cursus hiervoor gebruiken is GCC (of als alternatief GCC)

GCC is een command-line-tool die c-code kan omzetten naar een uitvoerbaar bestand en is de standaard-implementatie van de Unix C-compiler.  
Een goed alternatief dat mag gebruikt worden in de cursus is CLang maar we beperken voorlopig de instructies tot GCC.

> De microsoft C-compiler word niet gesupporteerd in deze cursus wegens:
>
> * Niet gratis beschikbaar
> * Niet werkende op alle platformen
> * De support voor C in Visual Studio wordt afgebouwd

Alvorens te compileren starten we met de installatie van GCC (of CLang in het geval van Mac)
