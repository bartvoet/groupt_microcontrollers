## Labo: PWM

### Opdracht 1: PWM

Probeer de duty-cycles op de osciloscoop te zetten
Probeer verschillende frequenties, bv. 1Mhz, 1 Khz,1hz...  
Ga uit van een éénvoudige opstelling (2 leds).

#### Deel A: bitbanging

Probeer - zonder naar de code te kijken - zelf je pwm te genereren op 1 led.  
Probeer verschillende duty-cycles.

Probeer verschillende frequenties, bv. 1Mhz, 1 Khz,1hz...

#### Deel B: interrupt gebaseerd

Werk verder uit via interrupts

#### Deel C: Fast PWM

Idem dito maar dan gebruik makende van de "echte" pwm-modes.  
Probeer in de code ook te noteren hoe je deze berekening hebt gemaakt.

### Opdracht 2: Koppelen aan ADC

#### Deel A: koppelen aan vorige oefening

Probeer PWM (fast of phase correct) te koppelen aan de labo met ADC.  
De led moet harder of zachter gaan branden afhankelijk van de ADC-input.

#### Deel B: afregelen met ADC

Probeer de ADC te calibreren met een potentio-meter (adc-multiplexing), zoals beschreven in het ADC-hoofdstuk.  

#### Deel C: afregelen

Probeer de ADC te calibreren digitaal via USART.
