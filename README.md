# gsuid-core-image

Weekly container build of [Genshin-bots/gsuid_core](https://github.com/Genshin-bots/gsuid_core) (GPL-3.0), published as `ghcr.io/t0saki/gsuid-core` (linux/amd64).

- Tags: `latest`, `v<version>`, `sha-<upstream commit>`
- Dependencies are installed strictly from upstream's `uv.lock`; the container needs no network to start.
- Each image is smoke-tested in CI before it is pushed.

```yaml
services:
  gsuidcore:
    image: ghcr.io/t0saki/gsuid-core:latest
    restart: unless-stopped
    ports:
      - "8765:8765"
    volumes:
      - ./data:/gsuid_core/data
      - ./plugins:/gsuid_core/gsuid_core/plugins
```

Disable the core's built-in `AutoUpdateCore` when using this image: updates ship with the image, and an in-container `git pull` can move the code ahead of the installed dependencies.
