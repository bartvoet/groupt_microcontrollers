## Werken met Files

### Open en close

Een file is een data-type dat je kan aanmaken met de functie open

~~~python
f = open("demofile.txt")
f.close()
~~~

Na gebruik moet je deze file sluiten met de functie close

### Modes

* "r" - Read
* "x" - Create - maakt een file aan, en geeft een error wanneer deze file al bestaat
* "a" - Append - maakt een file aan als deze nog niet bestaat, alle writes zijn toevoegingen
* "w" - Write -  maakt een file aan als deze nog niet bestaat, overschrijft bestaande file
* "r+" - Read + - lezen en schrijven tegelijk


### Lezen uit file 

~~~python
f = open("demofile.txt", "r")
print(f.read()) 
~~~

~~~python
f = open("demofile.txt", "r")
print(f.read(5)) 
~~~

~~~python
f = open("demofile.txt", "r")
print(f.read(5)) 
~~~

### Lijn per lijn lezen

~~~python
f = open("demofile.txt", "r")
print(f.readline())
print(f.readline()) 
~~~

### Loopen

Loopen door een file

~~~python
f = open("demofile.txt", "r")
for x in f:
  print(x) 
~~~





~~~python
f = open("myfile.txt", "x")
~~~

~~~python
#open and read the file after the appending:
f = open("demofile3.txt", "r")
print(f.read())
~~~

~~~python
f = open("myfile.txt", "w")
~~~

### Deleten van files

~~~python
import os
os.remove("demofile.txt") 
~~~

~~~python
import os
if os.path.exists("demofile.txt"):
  os.remove("demofile.txt")
else:
  print("The file does not exist") 
~~~

~~~python
import os
os.rmdir("myfolder") 
~~~
