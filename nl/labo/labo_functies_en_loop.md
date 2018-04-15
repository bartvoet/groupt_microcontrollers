## Labo: functies en macro's

### Opdracht 1

Herschrijf het programma "leds laten blinken met for-loops" (of alternatief het verkeerslicht) zodat je dit zowel kan compileren

* voor AVR (met leds)
* als simuleren via de command-line (printf van bits)

Pas de volgende werkwijze toe:

* Maak een header-file led_platform.h aan en plaats daar 2 functie-prototypes (zie onder)
* Maak 2 implementaties aan (1 voor AVR en 1 voor computer)
* Idee is main gemeenschappelijk te houden voor beide (bevat de shifting-logica die niet verschilt)

```{.c}
public void write_bits(unsigned short bits);
public void delay(int second);
```

Maak ook 2 shell-scripts (.bat of .sh) aan om de compilatie te onderscheiden.

#### Timers Windows vs (u)(lin)ux

* Voor de delay-functie mag je onderstaande code plakken en pasten (c-standaard bevat geen officiële sleep/delay/wait)

```{.c}
#if defined(__WIN32__) || defined(_WIN32) || defined(WIN32) || defined(__WINDOWS__) || defined(__TOS_WIN__)

  #include <windows.h>

  void delay( unsigned long ms )
  {
    Sleep( ms );
  }

#else

  #include <unistd.h>

  void delay( unsigned long ms )
  {
    usleep( ms * 1000 );
  }
#endif
```

* Voor AVR mag je de volgende code plakken voor delay

```{.c}

#include <util/delay.h>

void delay(unsigned long ms)
{
    _delay_ms((double)ms);
}
```


### Opdracht 2

#### Deel A

Schrijf een functie die de 2de macht van een int neemt.  
Roep deze functie aan vanuit een main-methode

```{.c}
printf(macht_tot_de_2de(2));//print 4
```
Bekijk dit programma met cpp

#### Deel B

Schrijf een 2de functie waar je kan aan meegeven tot de hoeveelste macht je de berekent.  

```{.c}
printf(macht(2,3));//print 8
```

#### Deel C
Schrijf een macro die hetzelfde doet als Deel A.  
Verklaar in commentaar wat het voordeel zou kunnen zijn (hint probeer een met het long-datatype).  

```{.c}
printf(MACHT(3));//print 9
```

#### Deel D
Plaatst dit in een header-file
