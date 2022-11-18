# Health check mock

This is a simple service that returns 200 on any path.

You can use this as a stand in for a real service that won't be failing health checks before you actually have its container ready.

No need to specify `command` or `entrypoint`, simply run the container.

Listens on `port 80`.

Example to run locally:

```shell
~ docker run --rm -p8080:80 phpdockerio/health-check-mock
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration

  [ ... ]

/docker-entrypoint.sh: Configuration complete; ready for start up
2022/11/18 11:16:04 [notice] 1#1: using the "epoll" event method
2022/11/18 11:16:04 [notice] 1#1: nginx/1.23.2
2022/11/18 11:16:04 [notice] 1#1: built by gcc 11.2.1 20220219 (Alpine 11.2.1_git20220219)
2022/11/18 11:16:04 [notice] 1#1: OS: Linux 5.19.0-23-generic
2022/11/18 11:16:04 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2022/11/18 11:16:04 [notice] 1#1: start worker processes

  [ ... ]

022/11/18 11:16:04 [notice] 1#1: start worker process 37
```

On a separate terminal:

```shell
# Displaying headers
~ curl -v localhost:8080/
*   Trying 127.0.0.1:8080...
* Connected to localhost (127.0.0.1) port 8080 (#0)
> GET / HTTP/1.1
> Host: localhost:8080
> User-Agent: curl/7.85.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Server: nginx/1.23.2
< Date: Fri, 18 Nov 2022 11:16:42 GMT
< Content-Type: application/octet-stream
< Content-Length: 10
< Connection: keep-alive
< Content-Type: text/plain
<
* Connection #0 to host localhost left intact
I AM ALIVE⏎

~ curl localhost:8080/foo
I AM ALIVE⏎

~ curl localhost:8080/health-check
I AM ALIVE⏎
```
