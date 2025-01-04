# OAuth2 Proxy

![Build, scan & push](https://github.com/Polarix-Containers/oauth2-proxy/actions/workflows/build.yml/badge.svg)

### Features & usage

- Drop-in replacement for the [official image](https://github.com/oauth2-proxy/oauth2-proxy).
- Based on the latest [Alpine](https://alpinelinux.org/) containers.
- Unprivileged image: you should check your volumes' permissions (eg `/data`), default UID/GID is 3011.
- Backported dependency bumps for vulnerability fixes.

### Current backports

| Go Package                        | Change                  | Link                                                   |
| --------------------------------- | ----------------------- | ------------------------------------------------------ |
| github.com/go-jose/go-jose/v3     | `v3.0.1` -> `v3.0.3`    | https://github.com/oauth2-proxy/oauth2-proxy/pull/2831 |
| golang.org/x/crypto               | `v0.29.0` -> `v0.31.0`  | https://github.com/oauth2-proxy/oauth2-proxy/pull/2884 |
| golang.org/x/net                  | `v0.31.0` -> `v0.33.0`  | https://github.com/oauth2-proxy/oauth2-proxy/pull/2886 |

### Licensing
- The code in this repository is licensed under the Apache license. 😇
- Gitea is under the MIT license. Copyright to Gitea belongs to the OAuth2 Proxy project.
- Any image built by Polarix Containers is provided under the combination of license terms resulting from the use of individual packages.
