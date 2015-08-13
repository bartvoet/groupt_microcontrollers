## Starten met tools: AVR toolchain (compilen en flashen)

We willen starten met het het compilen en flashen van een c-programma op een AVR-microcontroller.  
Hiervoor heb je 3 belangrijke onderdelen voor nodig:

* **avr-gcc**: versie van gcc getarget naar AVR
* **avrdude**: het programma dat praat met de programmer
* **gdb-avr**: een extensie op GDB om te kunnen debuggen (dit komt een later deel aan bod.

Dit deel legt uit:

* hoe dat je deze tools moet installeren op verschillende OS
* legt uit hoe dat je deze tools kan gebruiken vanuit command-line

> **Nota:**  
> Deze voorbeelden zijn gegeven in de terminal.  
> 1-maal deze tools geïnstalleerd kan je in principe dit ook via Eclipse  
> (dit bekijken we later)


### Installatie Linux

Bij linux-distributies is avr-gcc beschikbaar via de verschillende package-managers.

Ubuntu en Debian:   
```sudo apt-get install avrdude avrdude-doc binutils-avr avr-libc gcc-avr gdb-avr```

Fedora en Red Hat:  
```sudo yum install avrdude avr-gcc avr-binutils avr-libc avr-gdb```

### Installatie Mac

Voor Mac is Crosspack de aangewezen installatie-software, er zijn ook geen dependencies op xcode of MacPorts (dus je moet niet specifiek een account maken)  
http://www.obdev.at/downloads/crosspack/CrossPack-AVR-20131216.dmg

### Installatie FreeBSD

Zoals bij Linux ook de klassieke package-manager volstaat (ports).  
De volgende packages dienen te geïnstalleerd worden.  
avr-gcc, avr-binutils, avr-libc, avr-gdb, avrdude 

### Installatie Windows (xp tem 7)  

Als je met je eigen PC werkt is het aangeraden van WinAVR te installeren, deze installeert alles wat je nodig hebt en past de PATH-variabele.
Een andere mogelijk is de arduino-omgeving te installeren, deze bevat ook de nodige gcc-software (en moet je een aantal PATH-variabelen gaan aanpassen).  

> **Nota:**  
> Andere mogelijkheid is de software te gebruiken meegeleverd bij de cursus (start de command-line 'comandline_bash_with_toolchain.bat').  
> Dit is echter niet aangeraden (dit is enkel een noodoplossing als je geen eigen PC hebt)

> **Nota:**  
> Windows 8 is nog niet uitgeprobeerd maar zou in principe moeten werken (op eigen risico)

### Test-programma

Hieronder vindt je het voorbeeld-programma dat we hebben gebruikt bij de introductie van AVR:
Je mag dit programma gewoon kopiëren en plakken in een file genaamd led.c.

``` {.c}
#include <avr/io.h>
#include <util/delay.h>

int LED_NUMMER = PB5;

int main(void)
{
  DDRB |= (1<<LED_NUMMER);

  while (1)
  {
      PORTB |= (1<<LED_NUMMER);
      _delay_ms(500);
      PORTB &= ~(1<<LED_NUMMER);
      _delay_ms(500);
  }
  return 0;
}

```

1 maal dat je deze file hebt bewaard kan je starten aan de volgende stap (compilen en builden)

### Compileren en flashen van de code 

![](../../pictures/toolchain_for_avr_s.png)

* Bewaar het onderstaande programma op je harde schijf (lokaal niet op het netwerk)
* Navigeer via command line naar de directory waar je code staat

Voer daarna de volgende 4 commando's uit (vervang /dev/ttyACM0 door de specifieke poort waar de Arduino is op aan gesloten):

* Compilatie:  
  avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o led.o led.c
* Linken:  
  avr-gcc -mmcu=atmega328p led.o -o led
* Omzetten naar een hex-file:  
  avr-objcopy -O ihex -R .eeprom led led.hex
* Downloaden naar de AVR-mcu via een programmer (in dit geval de bootloader van AVR) : 
  avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:led.hex

### Command-line voorbeeld

* Eerst voer je de 3 eerste commando's uit om tot een (door AVR) uitvoerbaar bestand te komen:

```
$ avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o led.o led.c
$ ls
led.c  led.o
$ avr-gcc -mmcu=atmega328p led.o -o led
$ ls
led  led.c  led.o
$ avr-objcopy -O ihex -R .eeprom led led.hex
$ ls
led  led.c  led.hex  led.o
```

* Daarna download je de hex-file naar de microcontroller:

```
$ avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:led.hex

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.00s

avrdude: Device signature = 0x1e950f
avrdude: NOTE: "flash" memory has been specified, an erase cycle will be performed
         To disable this feature, specify the -D option.
avrdude: erasing chip
avrdude: reading input file "led.hex"
avrdude: input file led.hex auto detected as Intel Hex
avrdude: writing flash (176 bytes):

Writing | ################################################## | 100% 0.04s

avrdude: 176 bytes of flash written

avrdude: safemode: Fuses OK (E:00, H:00, L:00)

avrdude done.  Thank you.

```

* Als alles goed verlopen is krijg je bovenstaande output
