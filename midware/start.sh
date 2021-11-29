#!/bin/bash

pip install -r requirements.txt

uwsgi --http 127.0.0.1:5000 --module webapp:app
