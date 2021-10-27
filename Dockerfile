FROM python:3.7.2
WORKDIR /demo_app
COPY requirements.txt .
RUN \
python3 -m pip install -r requirements.txt --no-cache-dir
COPY . .
EXPOSE 7000
CMD ["python", "manage.py", "runserver", "0.0.0.0:7000"]