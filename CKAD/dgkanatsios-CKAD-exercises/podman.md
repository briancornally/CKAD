# podman

- https://podman.io/docs/installation

brew install podman
podman machine init
podman machine start
podman info

This machine is currently configured in rootless mode. If your containers
require root permissions (e.g. ports < 1024), or if you run into compatibility
issues with non-podman clients, you can switch using the following command:

        podman machine set --rootful

API forwarding listening on: /Users/bc/.local/share/containers/podman/machine/qemu/podman.sock

The system helper service is not installed; the default Docker API socket
address can't be used by podman. If you would like to install it run the\nfollowing commands:

sudo /opt/homebrew/Cellar/podman/4.7.1/bin/podman-mac-helper install
podman machine stop /opt/homebrew/Cellar/podman/4.7.1/bin/podman-mac-helper
podman machine start /opt/homebrew/Cellar/podman/4.7.1/bin/podman-mac-helper
ls -lh /opt/homebrew/Cellar/podman/4.7.1/bin/podman-mac-helper

                You can still connect Docker API clients by setting DOCKER_HOST using the

following command in your terminal session:

export DOCKER_HOST='unix:///Users/bc/.local/share/containers/podman/machine/qemu/podman.sock'
