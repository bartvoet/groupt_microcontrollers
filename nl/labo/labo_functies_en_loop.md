## Labo: functies en macro's 

### Opdracht 1

#### Deel A

Schrijf een functie die de 2de macht van een int neemt.  
Roep deze functie aan vanuit een main-methode

```{.c}
printf(macht_tot_de_2de(2));//print 4
```
Bekijk dit programma met cpp

#### Deel B

Schrijf een 2de functie waar je kan aan meegeven tot de hoeveelste macht je de berekent.  

```{.c}
printf(macht(2,3));//print 8
```

#### Deel C
Schrijf een macro die hetzelfde doet als Deel A.  
Verklaar in commentaar wat het voordeel zou kunnen zijn (hint probeer een met het long-datatype).  

```{.c}
printf(MACHT(3));//print 9
```

#### Deel D
Plaatst dit in een header-file

### Opdracht 2 (optioneel)

Herschrijf het knight-rider programma zodat je dit zowel kan compileren voor AVR als command-line.  
