# docker-webrunelite
deploy:
```
docker build --name="webrunelite" --restart="always" --volume="/etc/localtime:/etc/localtime:ro" --network="host"  dylanve115/webrunelite
```
## Environment variables:
### Required:
PASSWORD = VNC Password
