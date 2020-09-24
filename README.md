# Container to mirror the InstantOS mirror

This container is designed to provide quick and 'instant' way to create your own InstantOS mirror.

Simply run this with Docker / Podman and go to port 8080 in your web browser.

```bash
podman run -d --name instant-mirror -p 8080:80 jo3l/instant-mirror
```