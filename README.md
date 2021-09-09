# API Flask/Gunicorn base

## Build
```bash
~$ docker build -t api-flask-base .
```

## Run
```bash
~$ docker run -d --rm --name api-flask-base -p 5000:5000 api-flask-base
```

## Test API
```bash
~$ curl -X GET http://172.17.0.2:5000/
```
