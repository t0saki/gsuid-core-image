# Bundles upstream gsuid_core (checked out to ./src by CI) on top of the base
# built from upstream's docker/base/Dockerfile. Installs strictly from uv.lock,
# so the container starts without resolving or downloading anything.
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

WORKDIR /gsuid_core

COPY src/pyproject.toml src/uv.lock src/README.md ./
RUN uv sync --frozen --no-dev --no-install-project \
    && playwright install chromium

COPY src/ ./
RUN uv sync --frozen --no-dev

EXPOSE 8765
CMD ["uv", "run", "--no-sync", "--python", "/venv/bin/python", "core", "--host", "0.0.0.0"]
