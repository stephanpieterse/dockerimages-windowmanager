FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get update && apt-get install -y sudo openbox tint2
# CMD ["/bin/bash",  "-c",  "openbox"]

# RUN apt-get update && apt-get install -y sudo mate-desktop-environment mate-session-manager marco
# CMD ["/bin/bash",  "-c",  "mate-session"]

# RUN apt-get update && apt-get install -y sudo ubuntu-gnome-desktop
# CMD ["/bin/bash",  "-c",  "gnome-session"]

RUN apt-get update && apt-get install -y sudo plasma-desktop
CMD ["/bin/bash",  "-c",  "/usr/bin/startkde"]

USER root
# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer
RUN usermod -a -G audio,video developer


RUN echo "developer:devpass" | chpasswd

RUN chown -R developer:developer /home/developer

RUN rm -rf /var/cache/apk
RUN apt-get autoclean autoremove
USER developer

