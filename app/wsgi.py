import os

from flask import Flask

app = Flask(__name__)


@app.route('/', methods=['GET'])
def init():
    return '<h1>Hello!</h1>'


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=os.getenv('APP_PORT', 5000))

