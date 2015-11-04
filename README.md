
fnoc calculates the fibonacci sequence up to n on a web service 

Flask, uWSGI and Nginx in a single Ubuntu 14.01 LTS  Docker container

## Deployment technology:
* Docker to build and deploy containerized application
* Ubuntu 14.01 LTS because it will have maintenance support until 2019
* Nginx is a fast standard web server with built in uWSGI protocol support
* uWSGI benchmarks as the fastest WSGI application container 
* Flask is a good web services development module and comes with less baggage than Django or Pyramid

Maintenance methodology:

If the OS, uWSGI or Nginx need, e.g. security patches applied

### re-build from scratch and tag the image
* docker build -t fnoc .

and redeploy the docker image to the server of choice through, for example, salt

References:
[https://github.com/dockerfiles/django-uwsgi-nginx](https://github.com/dockerfiles/django-uwsgi-nginx)

[http://flask.pocoo.org/docs/deploying/uwsgi/#configuring-nginx](http://flask.pocoo.org/docs/deploying/uwsgi/#configuring-nginx)

