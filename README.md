# docker-runelite

simple noVNC with runelite

deploy:
```
docker run --name="runelite" --restart="always" dylanve115/runelite
```
## Environment variables:
### Required:
PASSWORD = VNC Password

SCREENSIZE = Screen resolution of virtual screen (By default: 1048x504x24 as this machtes up with RuneLite with the settings bar open.)
Size of Runelite window cant be changed in runelite settings.
