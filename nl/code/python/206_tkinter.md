## TkInter

### Leeg scherm

~~~python
from tkinter import *
window = Tk()
window.mainloop()
~~~

### Leeg scherm met titel

~~~python
from tkinter import *
window = Tk()
window.title("Let's make some gui")
window.mainloop()
~~~

### ... met label

~~~python
from tkinter import *
window = Tk()
window.title("Let's make some gui")
lbl = Label(window, text="Hello gui")
lbl.pack()
window.mainloop()
~~~

### ... met button

~~~python
from tkinter import *
import sys
window = Tk()
window.title("Let's make some gui")
lbl = Label(window, text="Hello gui")
lbl.pack()
button = Button(window, text="Goodbye", command=sys.exit)
button.pack()
mainloop()
~~~

### font-size aanpassen

~~~python
from tkinter import *
import sys
window = Tk()
window.title("Let's make some gui")
lbl = Label(window, text="Hello gui", font=("Arial Bold", 40))
lbl.pack()
button = Button(window, text="Goodbye",bg="black", fg="white", command=sys.exit)
button.pack()
mainloop()
~~~

### grootte van het scherm aanpassen

~~~python
from tkinter import *
import sys
window = Tk()
window.title("Let's make some gui")
window.geometry('350x200')
lbl = Label(window, text="Hello gui", font=("Arial Bold", 40))
lbl.pack()
button = Button(window, text="Goodbye",bg="black", fg="white", command=sys.exit)
button.pack()
mainloop()
~~~

### Een actie koppelen aan aan een button (1)

~~~python
from tkinter import *
import sys

def clicked():
     lbl.configure(text="Button was clicked !!")

window = Tk()
window.title("Let's make some gui")
window.geometry('350x200')
lbl = Label(window, text="Hello gui", font=("Arial Bold", 20))
lbl.pack()
button = Button(window, text="Goodbye",bg="black", fg="white", command=sys.exit)
button.pack()
message_button = Button(window, text="Message",bg="white", fg="black", command=clicked)
message_button.pack()
mainloop()
~~~

### Een actie koppelen aan aan een button (2)

~~~python
from tkinter import *
import sys

def clicked():
     lbl.configure(text="Message: " + txt.get())

window = Tk()
window.title("Let's make some gui")
window.geometry('350x200')
lbl = Label(window, text="Hello gui", font=("Arial Bold", 20))
lbl.pack()
button = Button(window, text="Goodbye",bg="black", fg="white", command=sys.exit)
button.pack()
message_button = Button(window, text="Message",bg="white", fg="black", command=clicked)
message_button.pack()
txt = Entry(window,width=10)
txt.pack()
mainloop()
~~~

### Dropdown

~~~python
from tkinter import *
from tkinter.ttk import *
import sys

def clicked():
     lbl.configure(text="Message: " + txt.get())

window = Tk()
window.title("Let's make some gui")
window.geometry('350x200')
lbl = Label(window, text="Hello gui", font=("Arial Bold", 20))
lbl.pack()
button = Button(window, text="Goodbye", command=sys.exit)
button.pack()
message_button = Button(window, text="Message", command=clicked)
message_button.pack()
txt = Entry(window,width=10)
txt.pack()
combo = Combobox(window)
combo['values']= (1, 2, 3, 4, 5, "Text")
combo.current(1) #set the selected item
combo.pack()
mainloop()
~~~
