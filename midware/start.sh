#!/bin/bash

echo "pip install -r requirements.txt"
pip install -r requirements.txt

echo ""

echo "uwsgi --http 0.0.0.0:5000 --module my_midware:app"
uwsgi --http 0.0.0.0:5000 --module my_midware:app
