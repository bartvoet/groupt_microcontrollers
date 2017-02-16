# Samenvatting deel 1

Een kleine herhaling/samenvatting van de belangrijkst elementen

## Statement

* **Statement:**
    * een stuk code dat resulteert in een actie
* **Expressie:** elke stuk code dat in een waarde resulteert
    * Functie-aanroep
    * Naam van een variabele
    * Literal
    *  Wiskundige expressie
    *  Relationele expressie
    * Logische expressie
* **Wiskundige expressie**
    * Bestaat uit een operanden en operatoren
    * Unitaire opereranden hebben slechts 1 operand
* **Variabele:**
    * **referentie** naar een stukje **geheugen**
    * daar kan je een **waarde** in bijhouden
* Een variabele heeft en **type** dat
    * bepaalt het gedrag bij bewerken
    * bepaalt de hoeveelheid plaats van het geheugen deze inneemt
* **Declaratie**:
    * Aangeven dat je een variabele gaat gebruiken
    * Opdat het programma weet hoeveel geheugen je gaat gebruiken
* **String**
    * Een stuk **tekst**
* **Enkelvoudige statements**
    * Assignment (of initialisatie van een variabele)
    * Functie-aanroep
* **block-statements**

## Overzicht van operatoren

| Operator | Operatie         |
|:---------|:-----------------|
| +        | optellen         |
| -        | aftrekken        |
| *        | vermenigvuldigen |
| /        | delen            |
| %        | rest             |

## Input-Output

* Deze zitten in de library stdio, dus om deze te gebruiken ```#include <stdio.h>```
* printf kan je gebruiken om tekst naar het scherm te schrijven
* scanf kan je gebruiken te lezen van consoles
* Deze werken met placeholders in een vast stuk tekst
    * %i voor getallen
    * %s voor tekst
    
## Bit-level operaties

**Basis**

* Shift-operators:
     * >>,<<
     * Let op overflow
* Bitwise-operators:
     * inverter: ~
     * bitwise and: &
     * bitwise or: |
     * bitwise xor: ^
* BITMASK
     * == PATROON
     * Laat je toe in bits te denken zonder te rekenen

**Kenmerken van bitwise-operatoren:**

```c
& => 0 is dominant
| => 1 is dominant
^ => 1 iverter, 0 is buffer
```

**Basis-bitmasks:**

```c
1 bit-positie                    => (1 << pos)
1 volledige byte                 => (0xFF << pos)
                                 => (0xFF << (pos * 8))
combineren/plakken van bitmasks  => (1 << pos1) | (1 << pos2)
inverteren van bitmasks          => ~(1 << pos)
                                 => ~0xAA == 0x55
```
**Basis-operaties:**

```c
GET     =>   if( x &  (1 << pos))  
SET     =>   x = x |  (1 << pos)  
CLEAR   =>   x = x & ~(1 << pos)
TOGGLE  =>   x = x ^  (1 << pos)
INVERT  =>   ~0xFF == 0x00
        =>   ~0xAA == 0x55
```

**Andere:**

```c
0xFF == ~0x00
```
