# OAuth2 Proxy

![Build, scan & push](https://github.com/Polarix-Containers/oauth2-proxy/actions/workflows/build.yml/badge.svg)

### Features & usage

- Drop-in replacement for the [official image](https://github.com/oauth2-proxy/oauth2-proxy).
- Based on the latest [Alpine](https://alpinelinux.org/) containers.
- Unprivileged image: you should check your volumes' permissions (eg `/data`), default UID/GID is 200000.
- Backported dependency bumps for vulnerability fixes.

### Current backports

There is no current backport for the latest release.

### Licensing
- The code in this repository is licensed under the Apache license. 😇
- OAuth2 Proxy is under the MIT license. Copyright to OAuth2 Proxy belongs to the OAuth2 Proxy project.
- Any image built by Polarix Containers is provided under the combination of license terms resulting from the use of individual packages.
