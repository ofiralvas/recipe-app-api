<<<<<<< HEAD
FROM python:3.9-alpine3.13
LABEL maintainer="ofiralvas"

ENV PYTHONUNBUFFERED 1

COPY ./requierments.txt /tmp/requierments.txt
COPY ./requierments.dev.txt /tmp/requierments.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requierments.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requierments.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user
=======
FROM python:3.9-alpine3.13
LABEL maintainer="ofiralvas"

ENV PYTHONUNBUFFERED 1

COPY ./requierments.txt /tmp/requierments.txt
COPY ./requierments.dev.txt /tmp/requierments.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requierments.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requierments.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user
>>>>>>> c2af00f3fe0ffb08e30b36700c6d791ef122017e
