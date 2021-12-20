FROM python:3.9

RUN mkdir midware

COPY requirements.txt /midware
COPY start.sh /midware
COPY my_midware.py /midware

WORKDIR /midware


CMD [ "/midware/start.sh" ]