## Bit-wise operaties

### Integer-types in C


### Bitwise operatoren in c

#### Bitwise operatoren vs logische operatoren

Tot nog toe hebben we logische operatoren gezien zoals &&, || en ! met als eigenschap:

* Een integer-operand met waarde 0 is een **logische 0**
* Elke integer-operand met een waarde <> 0 is een **logische 1**
* Je krijgt enkel 0 of 1 als uitkomst

De operatoren die we vandaag bekijken noemen we bitwise operatoren.  
Met bit-wise willen we zeggen dat deze op bit-niveau werken, ipv de operanden als 0 en 1 te gaan beschouwen gaan deze operator elke bit mat elkaar kan vergelijken.

We kunnen dit best met een stukje code gaan vergelijken

```{.c}
#include <stdio.h>
void main()
{
	printf("%i",2 && 2);
	printf("%i",2 & 2);	
}


```

#### Overzicht bitwise operatoren

| Operator | Betekenis             | Example      | Result (for each bit position)                    |
|----------|-----------------------|--------------|---------------------------------------------------|
| &        | AND                   | x & y        | 1, if 1 in both x and y                           |
| &#124;   | OR                    | x &#124; y   | 1, if 1 in either x or y, or both                 |
| ^        | XOR | x ^ y           | 1, if 1 in either x or y, but not both            |
| ~        | NOT                   | ~x           | 1, if 0 in x                                      |
| <<       | shift links           | x << y       | Each bit in x is shifted y positions to the left  |
| >>       | shift rechts          | x >> y       | Each bit in x is shifted y positions to the right |

#### Bitwise operator & 

& (and) zal in 0 resulteren als 1 van beide operanden gelijk is aan 0

| A | B | S  |
|:--|:--|:---|
| 0 | 0 | 0  |
| 0 | 1 | 0  |
| 1 | 0 | 0  |
| 1 | 1 | 1  |

|0|1|2|3|4|5|6|7|
|-|-|-|-|-|-|-|-|
|0|1|0|1|1|0|1|1|
|1|1|0|0|1|0|1|0|
|0|1|0|0|1|0|1|0|

#### Bitwise operator |

| (or) zal in 1 resulteren als 1 van beide opereranden niet gelijk is aan 0

| A | B | S  |
|:--|---|:---|
| 0 | 0 | 0  |
| 0 | 1 | 1  |
| 1 | 0 | 1  |
| 1 | 1 | 1  |

|0|1|2|3|4|5|6|7|
|-|-|-|-|-|-|-|-|
|0|1|0|1|1|0|1|1|
|1|1|0|0|1|0|1|0|
|1|1|0|1|1|0|1|1|

#### Bitwise operator ^

^ (xor) zal in 1 resulteren als 1 van beide operanden 1, anderse 0

| A | B | S  |
|:--|---|:---|
| 0 | 0 | 0  |
| 0 | 1 | 1  |
| 1 | 0 | 1  |
| 1 | 1 | 0  |


|0|1|2|3|4|5|6|7|
|-|-|-|-|-|-|-|-|
|0|1|0|1|1|0|1|1|
|1|1|0|0|1|0|1|0|
|1|0|0|1|0|0|0|1|

#### Bit-shifting


### Bits manipuleren

#### Bits lezen

#### Bits wijzigen naar 1 (met or)

#### Bits wijzigen naar 0 (met and)

#### Bits wisselen (met xor)
