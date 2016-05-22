## Labo: structures en sensoren

Het idee achter de onderstaande gegeven basis-code is:

* En het printen van de **gemiddelde** van elke type **meetdata**
* We maken een heel **éénvoudige library** voor **sensors**
* Waarmee we **meetdata** kunnen met opslagen


```c
struct sensor_waarde {
	int type;
	int waarde;
};

struct sensor {
	char* naam;
	int aantal_waardes;
	struct sensor_waarde waardes[5];
};

void creer_sensor(struct sensor* een_sensor,char* naamwaarde) {
	//TODO: zet aantal waardes by default op 0
}

void voeg_waarde_toe(struct sensor* een_sensor,int type,int waarde) {
	//TODO: update de aantal_waardes (niet meer dan 5)
}

void print_gemiddelde(struct sensor* sensoren,int aantal) {
	//TODO: print de gemiddeldes per type af
	//TIP 1: je moet een loop schrijven
	//TIP 2: de tussen-resultaten (groepering per type)
	//       kan je bijhouden in een array (met structs)
}

#define TYPE_TEMP  1
#define TYPE_LICHT 2

int main() {

	int i = 0;
	struct sensor sensors[3];
	creer_sensor(&sensors[0],"LDR");
	creer_sensor(&sensors[1],"Temperatuur");
	creer_sensor(&sensors[2],"Multi-sensor");

	//..
	voeg_waarde_toe(&sensors[0],TYPE_LICHT,3);
	voeg_waarde_toe(&sensors[1],TYPE_TEMP,4);
	voeg_waarde_toe(&sensors[2],TYPE_TEMP,2);
	voeg_waarde_toe(&sensors[2],TYPE_LICHT,5);
	//.. DOE ook nog de andere sensoren

	int aantal_sensors=3; //je kan dit ook met een operator die ik al 6 maal heb uitgelegd (sizeof)
	print_gemiddelde(sensors,aantal_sensors);

	return 0;
}
```

> Deel C en D zijn vanzelfsprekend optioneel en zonder verplichting

### Deel A: implementeer de TODO's

Implementeer de **3 functies**:

* creer_sensor
* voeg_waarde_toe
* print_gemiddelde

zoals aangeven in de **TODO**-boodschappen.

Zorg dat je een output krijgt die lijkt om onderstaande  (type en gemiddelde waarde)

```bash
Type 1 heeft als gemiddelde 3
Type 2 heeft als gemiddelde 4
```

### Deel B: Test je programma verder ...

Test een beetje verder

* Voeg wat extra meet-waardes toe
* Voeg wat sensors toe
* ...

Kijk na of dit nog correct blijft...

### Deel C: Header files (optioneel)

Bedoeling is je code ietswat modulairder te maken in aanloop naar deel D

* Isoleer de implementatie van de 3 functies (main-niet inbegrepen) in een aparte source-file (sensors.c)
* Verplaatst de struct-definities naar een aparte header-file (sensors.h).
* Plaats in deze header-file ook de functie-definities

### Deel D: Integeratie met AVR (optioneel)

Nu je code is geisoleerd kan je sensors.c en en sensors.h integreren in een AVR-project.  
Probeer dit bij voorbeeld te integreren met echte sensor-metingen (bijvoorbeeld via ADC...)
