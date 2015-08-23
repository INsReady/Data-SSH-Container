# Data-SSH-Container

A custom data container with SSHd service.

The custom entrypoint is used to link all host read-only files.

This container is used in multisite architecture:

![Image of multisite architecture]
(https://docs.google.com/drawings/d/1hYWw_vOra1SaABxmtv22spo2IFtIaUKM3le7GNv0WeM/pub?w=1397&amp;h=641)

This container also has the tools below:

1. SSH
2. Git
3. php:5.6-cli
4. Composer
