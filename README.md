# Summary

Run Firefox in a Docker container. Tested on Ubuntu Wily.

The host display is shared with OpenSSH X11 forwarding. The host audio is shared with PulseAudio network server and OpenSSH remote forwarding. The PulseAudio authentication cookie is shared with OpenSSH X11 forwarding.

# Install

Install Docker.

Add the user to the docker group.

    usermod -a -G docker <user>

Install PulseAudio Preferences.

    sudo apt-get install paprefs

Run PulseAudio Preferences, go to "Network Server", tick "Enable network access to local sound devices". Restart the computer.

# Run

    ./run.sh
