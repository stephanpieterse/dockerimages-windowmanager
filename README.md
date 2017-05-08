Docker image for running your window manager from docker.

# Usage

Clone this repo to somewhere.

Switch to a virtual terminal either with CTRL+ALT+F[1-7], or open one
with `sudo open -c [num] -l -s bash`. The first might be easier if you want to
switch between X instances though.

Start a new X session with `sudo xinit xterm -- :1`. You can use any number instead
of 1 (except 0 if you are running a default session).

In xterm, cd to this repo, and run `./build.sh`. This will build the docker image.
Once that is done, you can use `./run.sh` to launch the WindowManager from docker
and attach it to your running instance.

# Tested WindowManagers / DE's
- Openbox
  + Works great, nothing special needed it seems.
- MATE
  + Needs Metacity or Marco installed additionally.
- Cinnamon
  + Seems to be needing some MIR things that I have not had the patience to set up.
- Gnome
  + Works great, mouse seems to be a bit laggy.
- KDE / Plasma
  + Works great, mouse seems very enthusiastic.
  
# Known Issues
- PulseAudio sound (on original X) does not seem to like it if you have 2 running Xorg instances. So sound might be an issue. There is a probably a line in a log somewhere indicating what I messed up.
- On Linux Mint, switching between virtual desktops / terminals seems to give problems when VirtualBox is running.
