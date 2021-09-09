FROM python:3.9.7-alpine3.14

LABEL name="API Flask/Gunicorn base" \
      license="GLPv3" \
      maintainer="Javier Dominguez Gomez"


ENV APP_PORT=5000 \
    APP_USER="johndoe" \
    APP_GROUP="johndoe" \
    BASEDIR="/app" \
    MODULE="app"

EXPOSE ${APP_PORT}

COPY requirements.txt /
COPY entrypoint.sh ${MODULE} ${BASEDIR}/

RUN addgroup -S ${APP_GROUP} \
    && adduser -S ${APP_USER} -G ${APP_GROUP} \
    && chown -R ${APP_USER}:${APP_GROUP} ${BASEDIR} \
    && chmod 700 ${BASEDIR}/entrypoint.sh

RUN pip3 install -r /requirements.txt

USER ${APP_USER}

WORKDIR ${BASEDIR}

ENTRYPOINT ["./entrypoint.sh"]
