# php-apache-debian-docker-image
PHP with Apache on Debian OS docker image with some popular modules pre-enabled

Enabled Apache modules (on top of the php:8.4-apache defaults): `unique_id`, `rewrite`, `headers`.

## How the image is built

A GitHub Actions workflow (`.github/workflows/docker-build.yml`) rebuilds the image every night at 19:00 UTC, on every push to `master`, and on demand.

1. Build from a freshly pulled `php:8.4-apache`, with no cache, and apply pending Debian security updates (`apt-get upgrade`).
2. Compare the result with the published `asimzeeshan/php:latest`: package versions, PHP version and extensions, Apache modules.
3. Scan both with Trivy (pinned by digest) for fixable HIGH/CRITICAL vulnerabilities. Publishing is blocked if the new build adds a fixable CRITICAL that the published image does not have.
4. Publish `latest` and a dated tag (`YYYYMMDD`) **only when the content changed**, so servers that auto-update are not restarted for an identical image. A manual run can force a publish.

Pull requests build and scan, but never publish.
