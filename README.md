# Container to mirror the [InstantOS](https://instantos.io/) mirror

This container is designed to provide quick and 'instant' way to create your own [InstantOS](https://instantos.io/) mirror.

Simply run this with Docker / Podman and go to port 8080 in your web browser.

```bash
podman run -d --name instant-mirror -p 8080:80 -e ALLOW='all' jo3l/instant-mirror
```
You can allow a subnet range e.g. 192.168.0.0/24 (only your local network) or 'all' for anyone. Otherwise, it Denys all entry.
