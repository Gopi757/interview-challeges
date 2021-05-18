# 1. Project Setup

Write a production-ready Dockerfile implementation to have the nginx 
container showing the `public/index.html`'s "hello, world". Build and 
run the container.

It should be based on the official Nginx docker image: https://hub.docker.com/_/nginx

Write README to include the steps to build and run.

# 2. Implement a local development setup

Write a docker-compose.yml file that will build and run the application,
reflecting local changes on refresh (e.g. updates to public/index.html).

Update README to reflect these steps.

# 3. A problem to solve

Our IT Security have a policy that containers mustn't run as root.
So we need nginx as a non-root user. Our initial implementation was:

```Dockerfile
FROM nginx
ADD ./public/ /usr/share/nginx/html/
USER 1000:1000
```

```docker-compose.yml
version: "3"

services:
  web:
    build: .
    ports:
    - 8080:80
```

but this failed on startup:

```
% docker compose up web
[+] Running 1/0
 ⠿ Container docker2_web_1  Recreated                                                                                                                                                                                     0.1s
Attaching to web_1
web_1  | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
web_1  | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
web_1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
web_1  | 10-listen-on-ipv6-by-default.sh: info: can not modify /etc/nginx/conf.d/default.conf (read-only file system?)
web_1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
web_1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
web_1  | /docker-entrypoint.sh: Configuration complete; ready for start up
web_1  | 2021/05/14 12:41:25 [warn] 1#1: the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
web_1  | nginx: [warn] the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
web_1  | 2021/05/14 12:41:25 [emerg] 1#1: mkdir() "/var/cache/nginx/client_temp" failed (13: Permission denied)
web_1  | nginx: [emerg] mkdir() "/var/cache/nginx/client_temp" failed (13: Permission denied)
web_1 exited with code 1
```

Please write a short explanation to the developers of the issue and what changes we need to make.

Implement the changes, and explain any impact of the changes you can see.