## Memory-classes

* scope
* duration
* linkage

### Te herhalen

* Compilen
* Memory-layout (stack, heap, global, ...)
* Translation unit
* Identity

### Keywords

* external
* static (verschillende betekenissen)
* volatile
* automatic
* register

### Scope

* Bepaalt waar een variabele binnen het programma kan gebruikt worden
* Wijst naar de zichtbaarheid

### Duration

* Period that a part of the memory can be reserved
* Global (static zorgt ervoor het te forceren)
* Local

### Linkage

* Internal vs external linkage
* Identifier-name referring to different identifiers in the same scope





```{.c}
int a;

int main()
{
  int a = 5;
  printf("a");
  
}
```
