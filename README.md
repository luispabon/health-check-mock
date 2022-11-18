# Health check mock

This is a simple service that returns 200 on any path.

You can use this as a stand in for a real service that won't be failing health checks before you actually have its container ready.

No need to specify `command` or `entrypoint`, simply run the container.

Listens on `port 80`.
