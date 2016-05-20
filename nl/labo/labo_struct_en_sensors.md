## Labo: structures en sensoren

Gegeven volgende basis-code:

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
	//zet aantal waardes by default op 0
}

void voeg_waarde_toe(struct sensor* een_sensor,int type,int waarde) {
	//update de aantal_waardes (niet meer dan 5)
}

void print_gemiddelde(struct sensor* sensoren,int aantal) {

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
	voeg_waarde_toe(&sensors[2],TYPE_TEMP,2);
	voeg_waarde_toe(&sensors[2],TYPE_LICHT,5);
	//.. DOE ook nog de andere sensoren

	int aantal_sensors=3; //je kan dit ook met een operator die ik al 6 maal heb uitgelegd (sizeof)
	print_gemiddelde(sensors,aantal_sensors);

	return 0;
}
```

Bedoeling van deze code is een simulatie-programma voor sensoren waar:

* Je verschillende sensoren kan beheren in een struct-array
* Methodes hebt om deze structs te bewerken
    * Een st
*


### Opdracht 1: hello world (blinking led voor microcontrollers)

#### Deel A
