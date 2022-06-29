# docker-runelite

simple noVNC with runelite

deploy:
```
docker run --name="runelite" --restart="always" dylanve115/runelite
```
## Environment variables:
### Required:
PASSWORD = VNC Password

SCREENSIZE = (By default: 1280x800x24) Screen resolution of virtual screen.
Size of Runelite window cant be changed in runelite settings.

DISPLAY = (By default :20) Doesn't do mutch. This is just so the variable is set in the docker terminal.

## Issues that I know:
###Sometimes doesnt boot:

Just start it again.

###cant login on runelite client: 

Just open the docker console and install a web browser.
```
apt-get update && apt-get install -y firefox-esr && firefox-esr
```
you can recreate the container after login and you will still be logged in to safe space.
