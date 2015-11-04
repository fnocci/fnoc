# Copyright 2013 Thatcher Peskens
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# forked from https://github.com/dockerfiles/django-uwsgi-nginx

from ubuntu:14.04

maintainer Dockerfiles

run apt-get update 

run apt-get install -y --no-install-recommends \
    python-software-properties \
    python-setuptools \
    build-essential \
    supervisor \
    python-dev \
    python \
    git 

run easy_install pip 
run pip install uwsgi
run pip install flask 

run mkdir -p /var/log/supervisor

# install fibonics code from this repo
RUN adduser --disabled-password --gecos '' fibonemc
add . /home/fibonemc/fnoc/

# setup all the configfiles
#run rm -f /etc/nginx/sites-enabled/default
#run ln -s /home/fibonemc/fnoc/nginx-app.conf /etc/nginx/sites-enabled/
#run ln -s /home/fibonemc/fnoc/supervisor-app.conf /etc/supervisor/conf.d/

expose 80
cmd ["supervisord", "-n"]
