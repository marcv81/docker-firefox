FROM ubuntu:trusty

# Run debconf in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty-security multiverse" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ trusty-security multiverse" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y openssh-server pulseaudio firefox flashplugin-installer

# Create user
RUN adduser --disabled-password --gecos "" user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    mkdir -p /home/user/.ssh && \
    chown user:user /home/user/.ssh && \
    chmod 0700 /home/user/.ssh

# Enable X11 forwarding
RUN mkdir -p /var/run/sshd && \
    echo X11Forwarding yes >> /etc/ssh/ssh_config

# Create Firefox launcher
RUN echo "export LC_ALL=POSIX" >> /home/user/run-firefox && \
    echo "export PULSE_SERVER=tcp:127.0.0.1:50001" >> /home/user/run-firefox && \
    echo "firefox" >> /home/user/run-firefox && \
    chmod 755 /home/user/run-firefox

# Install authorized SSH key
COPY id_rsa.pub /home/user/.ssh/authorized_keys
RUN chown user:user /home/user/.ssh/authorized_keys && \
    chmod 0600 /home/user/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
