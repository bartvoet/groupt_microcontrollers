## Loops en condities (vervolg)


### Voorbeeld: for-loop

```{.c}
int main()
{
    int i=0;
    for(i=0;i<10;i++) {
        printf("%i\n",i);
    }

    for(i=10;i>=0;i--) {
        printf("%i\n",i);
    }

    return 0;
}

```

```{.c}
int main()
{
    int i=0;
    while(i<10) {
        printf("%i",i);
        i++;
    }
    
    i = 0;
    while(i>=0) {
        printf("%i",i);
        i--;
    }


    return 0;
}

```



### Voorbeeld: for-loop en arrays

```{.c}
int main()
{
   int i=0;
   char* hello="Test";

   for(i=0;i<4;i++) {
      printf("%c\n",hello[i]);
   }
   return 0;
}
```

### Voorbeeld: , als operator

### Voorbeeld: do while

Niet zoveel gebruikt maar kan in bepaalde gevallen handig zijn

```{.c}
#include <stdio.h>

#define GELDIGE_CODE     13

int main(void)
{
    do
    {
        printf("Om toegang te verkrijgen, \n");
        printf("voer de geheime code in : ");
        scanf("%d", &code);
    } while (code != GELDIGE_CODE);
    printf("Welkom!\n");

    return 0;
}
```


### Duiding: Break en continue





### Voorbeeld: switch




