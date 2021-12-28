FROM python:3.9

RUN mkdir midware

COPY requirements.txt /midware
COPY start.sh /midware
COPY my_midware.py /midware
ADD templates /midware/templates

WORKDIR /midware


CMD [ "/midware/start.sh" ]