## Werken met Flask

### Installatie

Vooraleer aan de uitleg te starten laten even starten met het instaleren van Flask, het framework dat we gaan gebruiken om te communiceren over http.  
Normaal gezien is pip reeds voorgeinstalleerd bij installatie van Python.

pip stelt je de package-installer voor Python. pip of **p**ackage **i**nstaller for **P**ython.
Je kan pip gebruiken om packages te installeren die je kan terugvinden in de Python Package Index (en andere)

~~~
$ pip install Flask
~~~

### Eerste programma

Het eerste dat we gaan doen is het installeren van een hello world packages

~~~python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
~~~

### Programma draaien

Om dit te draaien dien je te doen vanaf

~~~
$ export FLASK_APP=hello.py
$ flask run
 * Running on http://127.0.0.1:5000/
~~~

Als deze 

~~~
$ export FLASK_APP=hello.py
$ python -m flask run
 * Running on http://127.0.0.1:5000/
~~~

Als je nu een brower opent en suft naar http://127.0.0.1:5000/

Als alles goed gegaan is krijg je een vester

### HTTP

~~~
+--------------+               +--------------+
|              |               |              |
|              |               |              |
|              |               |              |
|              |<--------------+              |
|  SERVER      |               |    CLIENT    |
|              |               |              |
|              |               |              |
|              +-------------->|              |
|              |               |              |
|              |               |              |
+--------------+               +--------------+
~~~

* Browser die een html-pagina afhaalt
* Een python-programma dat data afhaalt (xml of json)

* get - read
* put - update
* post - create
* delete - delete

#### REST

### HTTP-clients

### Werken met routes

~~~python
@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    return 'Hello, World'
~~~

### Werken met parameters

~~~python
from flask import Flask, url_for
from markupsafe import escape

app = Flask(__name__)

@app.route('/')
def index():
    return 'index'

@app.route('/hello')
def login():
    return 'login'

@app.route('/user/<username>')
def profile(username):
    return 'user {}'.format(username)
~~~