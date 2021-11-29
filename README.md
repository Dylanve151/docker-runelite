# docker-runelite

simple noVNC with runelite

deploy:
```
docker build --name="runelite" --restart="always" --volume="/etc/localtime:/etc/localtime:ro" --network="host"  dylanve115/runelite
```
## Environment variables:
### Required:
PASSWORD = VNC Password
