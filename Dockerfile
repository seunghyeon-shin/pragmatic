FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/seunghyeon-shin/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirement.txt

RUN echo "SECRET_KEY=django-insecure-j@-99j$-z%w(=202h3py56@idacy!fc)3*e1!w)zdre#46=g+r" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]