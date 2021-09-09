#!/bin/sh

gunicorn wsgi:app -w 3 -t 30 -b 0.0.0.0:"${APP_PORT}"
