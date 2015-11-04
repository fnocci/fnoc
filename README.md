
# fnoc calculates the fibonacci sequence up to n on a web service 

...in reasonable time where n <= 20000; where n > 20000 it truncates the sequence;
where n < 0 it reports an error.  where the URL is totally malformed it reports an error.

The input is provided in a parameter on the URL; the output is JSON 

## Quick Start and test:
* git clone https://github.com/fnocci/fnoc
* cd into top level directory
* docker build -t fnoc .
* docker run fnoc 

## Some Quick tests on the machine you've started 
* docker network (to find out the container's ip address, IP)
* curl IP
* curl IP/fibonacci
* curl IP/fibonacci?n=10
* curl IP/fibonacci?n=10000
* curl IP/


## Deployment technology:
* Flask, uWSGI and Nginx in a single Ubuntu 14.01 LTS  Docker container
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

Some ad hoc tests:

References:
[https://github.com/dockerfiles/django-uwsgi-nginx](https://github.com/dockerfiles/django-uwsgi-nginx)

[http://flask.pocoo.org/docs/deploying/uwsgi/#configuring-nginx](http://flask.pocoo.org/docs/deploying/uwsgi/#configuring-nginx)

