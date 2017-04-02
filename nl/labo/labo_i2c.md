## Labo: i2c

Deze labo-opdracht dient met 2 personen gemaakt te worden.

### Opdracht

Deze opdracht houdt in:

* Een gyroscoop uit te lezen
* De waardes afprinten met USART

Gegeven:

* De USART-abstracties die was meegegegeven uit de USART
* De code om de een L3G4200D aan te spreken

### Deel A: download de datasheet

We werken met een gyroscoop L3G4200D.
Download de datasheet, zet de url naar deze datasheet in commentaar in de code (deel C)

#### Deel B:

Maak een header-file aan met de naam i2c.h.

Deze bevat volgende operaties:

```c
i2c_start_conditie();
i2c_versturen(unsigned char byte);
i2c_start_conditie();
i2c_wachten_tot_einde();
i2c_lezen_zonder_ack();
i2c_stop_conditie()
```

> **Nota:**  
> Vergeet de pull-ups niet te activeren

#### Deel C: implementeer I2C

Voorzie een implementatie voor de I2C-header-file.  
Gebruik hiervoor de datasheet en wat we gezien hebben in de les.  

De code om de gyroscoop aan te roepen is gegeven (dus je moet enkel het TWI/I2C gedeelte impementeren)

### Deel D: maak een connectie tussen de PMOD Gyro en test

Test deze code uit.
Belangrijk is de gyroscoop te connecteren op 3.3 VCC en niet op de 5 V

### Deel E: documenteer

Vul aan verklaring?? in de gegeven code


#### Code te gebruiken

```{.c}
#include <util/delay.h>
#include <util/twi.h>
#include <avr/io.h>
#include <stdio.h>
#include "serieel.h"
#include "i2c.h"

#define L3G4200D_ADDRES                105

#define CTRL_REG1 0x20
#define CTRL_REG2 0x21
#define CTRL_REG3 0x22
#define CTRL_REG4 0x23
#define CTRL_REG5 0x24


void schrijf_naar_register(int deviceAddress, unsigned char reg, unsigned char val) {
    i2c_start_conditie();
    i2c_versturen((deviceAddress << 1) + 0);
    i2c_versturen(reg);
    i2c_versturen(val);
    i2c_stop_conditie();
}

unsigned char lees_uit_register(int deviceAddress, unsigned char code) {
    i2c_start_conditie();
    i2c_versturen((deviceAddress << 1) + 0);
    i2c_versturen(code);

    i2c_start_conditie();
    i2c_versturen((deviceAddress << 1) + 1);
    i2c_wachten_tot_einde();
    unsigned char ret = i2c_lezen_zonder_ack();

    i2c_stop_conditie();
    return ret;
}


void initialiseer_L3G4200D(int schaal) {

    // Verklaring??
    schrijf_naar_register(L3G4200D_ADDRES, CTRL_REG1, 0b00001111);

    // Verklaring??
    schrijf_naar_register(L3G4200D_ADDRES, CTRL_REG2, 0b00000000);

    // Verklaring??
    schrijf_naar_register(L3G4200D_ADDRES, CTRL_REG3, 0b00001000);

    // Verklaring??
    if (schaal == 250) {
        schrijf_naar_register(L3G4200D_ADDRES, CTRL_REG4, 0b00000000);
    } else if (schaal == 500) {
        schrijf_naar_register(L3G4200D_ADDRES, CTRL_REG4, 0b00010000);
    } else {
        schrijf_naar_register(L3G4200D_ADDRES, CTRL_REG4, 0b00110000);
    }

    // Verklaring??
    schrijf_naar_register(L3G4200D_ADDRES, CTRL_REG5, 0b00000000);
}

int lees_as(int MSB_register,int LSB_register )
{
    unsigned char MSB = lees_uit_register(L3G4200D_ADDRES, MSB_register);
    unsigned char LSB = lees_uit_register(L3G4200D_ADDRES, LSB_register);
    int x = (((int) MSB << 8) | (int) LSB);
    return x;
}


#define X_MSB_REG    0X29
#define X_LSB_REG    0X28
#define Y_MSB_REG    0X2B
#define Y_LSB_REG    0X2A
#define Z_MSB_REG    0X2D
#define Z_LSB_REG    0X2C

#define DELAY_TUSSEN_METINGEN_MS       2000
#define NEW_LINE                       "\n\r"
#define SCHAAL_VOOR_METINGEN_FIJN      2000

int main(void) {

    serieel_initialiseer();
    _delay_ms(11);

    i2c_initialiseer();
    initialiseer_L3G4200D(SCHAAL_VOOR_METINGEN_FIJN);
    _delay_ms(11);

    while (1) {
        serieel_verstuur_string("x: ");
        serieel_verstuur_getal(lees_as(X_MSB_REG,X_LSB_REG));
        serieel_verstuur_string(" y: ");
        serieel_verstuur_getal(lees_as(Y_MSB_REG,Y_LSB_REG));
        serieel_verstuur_string(" z: ");
        serieel_verstuur_getal(lees_as(Z_MSB_REG,Z_LSB_REG));
        serieel_verstuur_string(NEW_LINE);
        _delay_ms(DELAY_TUSSEN_METINGEN_MS);
    }
    return 0;
}
```
