FROM python:3.9.0

WORKDIR /home/

RUN echo "testing1234"

RUN git clone https://github.com/seunghyeon-shin/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirement.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=practice.settings.deploy && python manage.py migrate --settings=practice.settings.deploy && gunicorn practice.wsgi --env DJANGO_SETTINGS_MODULE=practice.settings.deploy --bind 0.0.0.0:8000"]