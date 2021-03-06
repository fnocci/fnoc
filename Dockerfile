# fnoc Docker modified for the fnoc flask application
#
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

maintainer fnocci

run apt-get update 

run apt-get install -y --no-install-recommends \
    python-software-properties \
    python-setuptools \
    build-essential \
    python-dev \
    python \
    supervisor \
    nginx \
    git 

run easy_install pip 
run pip install uwsgi
run pip install flask 

# install fibonics code from this repo
add . /home/fibonemc/fnoc/

# and have it be owned by same user that runs nginx
run chown www-data:www-data /home/fibonemc/fnoc/

#setup the nginx configs more cleanly 
run echo "daemon off;" >> /etc/nginx/nginx.conf
run rm /etc/nginx/sites-enabled/default
run cp /home/fibonemc/fnoc/nginx.conf /etc/nginx/sites-available/nginx-fnoc.conf
run ln -s /etc/nginx/sites-available/nginx-fnoc.conf /etc/nginx/sites-enabled/nginx-fnoc.conf

# since we've installed uwsgi with pip, need to give it an upstart file 
# and put its initialization file in the appropriate location
run cp /home/fibonemc/fnoc/uwsgi.conf /etc/init/uwsgi.conf 

run mkdir -p /etc/uwsgi/sites
run cp /home/fibonemc/fnoc/uwsgi.ini /etc/uwsgi/sites/uwsgi-fnoc.ini
run ln -s /home/fibonemc/fnoc/supervisor-app.conf /etc/supervisor/conf.d/

expose 80

cmd ["supervisord", "-n"]
