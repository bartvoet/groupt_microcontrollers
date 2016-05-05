## Labo: interrupts (pin en timers)

Doel van de opdracht is het verwerken van 2 zaken die we hebben geleerd:

* interrupts in het algemeen
* pint-interrupts
* timers

### Opdracht 1

#### Deel A: setup

Probeer onderstaande code uit (zie introductie in interrupts).  
Bekijk de code in de methode "initialiseer_de_interrupts()" en vergelijk dit met de datasheet.  

De opdracht is een korte verklaring in commentaar te zetten en te verwijzen naar de relevante paginas of secties in de atmega328p-datasheet.

```c
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>


#define DELAY                   200
#define LED_PORT                PORTB
#define LED_DDR                 DDRB
#define LED0                    PB2
#define LED1                    PB3
#define BUTTON_PIN              PIND
#define BUTTON_PORT             PORTD
#define BUTTON                  PD2

ISR(PCINT2_vect)
{
    if (bit_is_set(BUTTON_PIN, BUTTON)) {
        LED_PORT |= (1 << LED1);
    } else {
       LED_PORT &= ~(1 << LED1);
    }
}


void initialiseer_de_interrupts()
{
    PCICR  |= (1 << PCIE2);    // activeer de pin-interrupts voor de D-bank
    PCMSK2 |= (1 << PCINT18);  // masker om aan te duiden op welk pins er moet worden gereageerd
    // PCMSK2 |= (1 << PD2);   // minder officieel maar werkt ook
    sei();                     // activeer all interrupts
}

void initialiseer_de_pins() {
    LED_DDR |= (1 << LED0) | (1 << LED1);
    BUTTON_PORT |= (1 << BUTTON);
}

int main(void)
{
  initialiseer_de_pins();
  initialiseer_de_interrupts();
  LED_PORT |= (1 << LED1);
  while (1) {
    _delay_ms(DELAY);
    LED_PORT ^= (1 << LED0);
  }
  return (0);
}
```

#### Deel B

Verwijder de inhoud van de while-loop:

```c
...
while (1) {
_delay_ms(DELAY);
LED_PORT ^= (1 << LED0);
}
...
```

zodat je een lege loop krijgt:

```c
...
while (1) {
}
...
```

Implementeer deze toggle (LED_PORT ^= (1 << LED0)) nu binnen een timer-interrupt.

#### Deel C (optioneel)

Probeer een pin-interrupt met een andere vector (PCINT0_vect of PCINT1_vect).  
Doe hiervoor het nodige opzoek-werk in de datasheet
