#!/bin/bash
exec gunicorn --config docker-gunicorn.conf.py wsgi:app