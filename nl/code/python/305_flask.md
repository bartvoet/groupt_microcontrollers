## Werken met Flask

### Installatie

~~~
$ pip install Flask
~~~

### Eerste programma

~~~python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
~~~

### Programma draaien

~~~
$ export FLASK_APP=hello.py
$ flask run
 * Running on http://127.0.0.1:5000/
~~~

~~~
$ export FLASK_APP=hello.py
$ python -m flask run
 * Running on http://127.0.0.1:5000/
~~~

### Werken met roputes

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