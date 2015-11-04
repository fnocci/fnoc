
fnoc calculates the fibonacci sequence up to n on a web service 

Deployment:
Flask, uWSGI and Nginx in a single Ubuntu 14.01 LTS  Docker container

Ubuntu 14.01 LTS will have maintenance support until 2019

uWSGI benchmarks as the fastest WSGI application container while 
Nginx is a standard web application server with built in uWSGI protocol support

If the OS, uWSGI or Nginx need, e.g. security patches applied

### Build and run
* docker build -t fnoc .
* docker run -d fnoc 

and redeploy the docker image through, for example, salt

References:
[http://flask.pocoo.org/docs/deploying/uwsgi/#configuring-nginx](http://flask.pocoo.org/docs/deploying/uwsgi/#configuring-nginx)

Docker file forked from [https://github.com/dockerfiles/django-uwsgi-nginx](https://github.com/dockerfiles/django-uwsgi-nginx)

