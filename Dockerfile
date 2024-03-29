FROM python:3.10

ENV PYTHONUNBUFFERED 1

RUN apt-get -y update && apt-get -y install vim && apt-get clean
RUN mkdir /project
ADD . /project

WORKDIR /project
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]