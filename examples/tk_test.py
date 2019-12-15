from tkinter import *
from tkinter import scrolledtext
from time import sleep
import serial
from serial.tools.list_ports import *

class SerialConnection:
    def __init__(self,connection_string,baud):
        self.ser = serial.Serial(port=connection_string,
            baudrate=baud,
            bytesize=serial.EIGHTBITS,
                        parity=serial.PARITY_NONE,
                        stopbits=serial.STOPBITS_ONE,
                        timeout=1,
                        xonxoff=0,
                        rtscts=0)
        sleep(2)


    def write_command(self,command):
        self.ser.write(command.encode())
        val = self.ser.readline().decode()
        return val.split(';')[1]

class Led:
    def __init__(self,master,serial,led_number):
        self.led_number = led_number
        row_number = self.led_number        
        Button(master,text='-',command=self.decrement_led).grid(row=row_number,column=0)
        self.scale = Scale(master, from_=1, to=10,orient=HORIZONTAL)
        self.scale.grid(row=row_number,column=1)
        Button(master,text='+',command=self.increment_led).grid(row=row_number,column=2)
        self.command("get({})".format(self.led_number))

    def command(self,com):
        val = serial.write_command(com)
        self.scale.set(val)

    def increment_led(self):
        self.command("up({})".format(self.led_number))

    def decrement_led(self):
        self.command("down({})".format(self.led_number))

master = Tk()
master.geometry('350x350')
for port in comports():
    print(port.device)
    print(port.manufacturer)
    print(port.pid)
    print(port.vid)

serial = SerialConnection('COM3',9600)
led = Led(master,serial,0)
led = Led(master,serial,1)

# txt = scrolledtext.ScrolledText(master,width=70,height=20)
# txt.grid(column=0,row=3,columnspan="3")


mainloop()