```
void initButton() {
	DDRB &= ~(1 << BUTTON_INPUT);
	PCICR |= (1 << PCIE0);
	PCMSK0 |= (1 << PCINT4);
}

ISR(PCINT0_vect) {
	if (milis - lastMillis >= 1000) { //software de-bouncing
		lastMillis = milis;
		lightStatus ^= (1);//toggle between true and false
		if(lightStatus!=1){
			if(checkForToggle()){
				setLight(9);
			}else {
				setLight(0);
			}
		}

	}
}
```


