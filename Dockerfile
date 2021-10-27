FROM python:3.7.2
WORKDIR /demo_app
COPY requirements.txt .
RUN \
apk add --no-cache postgresql-libs && \
apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
python3 -m pip install -r requirements.txt --no-cache-dir && \
apk --purge del .build-deps
COPY . .
EXPOSE 7000
CMD ["python", "manage.py", "runserver", "0.0.0.0:7000"]