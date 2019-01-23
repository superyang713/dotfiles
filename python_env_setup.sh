#!/bin/bash

mkdir ~/.local/share/virtualenvs/
cd ~/.local/share/virtualenvs/
echo "What's the name of the virtual env?"
read env

virtualenv $env
source $env/bin/activate
pip install rope jedi importmagic autopep8 flake8 jupyter yapf black
deactivate
