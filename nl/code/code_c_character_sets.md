
## C en karakters

ANSI C bepaalt 2 character-sets. De eerste is de source character-set, zijnde de karakters die in een source file mogen worden gebruikt.  
De 2de is de "execution character set" , bestaande uit alle karakters geinterpreteerd gedurende de uitvoering van het programma, zoals bijvoorbeeld de karakters in ene string-constante.  

Elk van deze "character sets" bevat als basis:

* The 52 upper- and lower-case karakters van het latijnse alfabet:  
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z  
a b c d e f g h i j k l m n o p q r s t u v w x y z  
* De 10 decimale getallen:  
0  1  2  3  4  5  6  7  8  9
* De volgende 29 grafische karakters:  
!  "  #  %  &  '  (  )  *  +  ,  -  .  /  :  ;
<  =  >  ?  [  \  ]  ^  _  {  |  }  ~
* De 5 "whitespace characters":
space, horizontal tab, vertical tab, newline, form feed

In uitbreiding hiervan bevat de basis "execution character set" het volgende:

* Het null character \0, hetgeen een string beindigd  
* De "control characters" die altijd starten met een eenvoudige "escape sequence" , ter controle van terminals en printers:  

| Escape sequence | Action ondisplay device |   | Escape sequence                  | Action ondisplay device                  |
|-----------------|-------------------------|---|----------------------------------|------------------------------------------|
| \a              | Alert (beep)            |   | \'                               | The character '                          |
| \b              | Backspace               |   | \"                               | The character "                          |
| \f              | Form feed               |   | \?                               | The character ?                          |
| \n              | Newline                 |   | \\                               | The character \                          |
| \r              | Carriage return         |   | \o \oo \ooo(o = octal digit)     | The character with this octal code       |
| \t              | Horizontal tab          |   | \xh..(h..= string of hex digits) | The character with this hexadecimal code |
| \v              | Vertical tab            |   |                                  |                                          |
