# Docker Container to mirror websites

This container is designed to provide a mirror of a specific site.

```bash
docker run -d -p 80:80 -e WGET_URL=<url> maxpearl/wget-mirror
```