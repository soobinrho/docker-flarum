<p align="center"><img src="https://flarum.org/img/logo.png"></p>
<p align="center"><img src="https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png" style="max-width:150px"></p>


## About this project
This repo is intended to be an aide for developing Flarum extensions using docker. The seeds are here for this to become production ready, although it's not quite there yet. PRs welcome.

#### Versions
- PHP: 7.4.3
- Debian: 10
- Percona: 5.7
- Redis: 5
- PHPMyAdmin: latest

#### Default Configuration
All Flarum settings are default, except
- Mail driver set to `log`
- `Bokt/flarum-redis` is installed and enabled, for both cache and queue
- `fof/console` is installed, with supporting cron pre-configured. Add scheduled tasks with ease to the Flarum scheduler
- Login credentials `admin/admin`
- Access via `http://localhost:8001`
- PHPMyAdmin credentials `flarum/flarum`
- PMA access via `http://localhost:8002`

## About Flarum

**[Flarum](https://flarum.org/) is a delightfully simple discussion platform for your website.** It's fast and easy to use, with all the features you need to run a successful community. It is designed to be:

* **Fast and simple.** No clutter, no bloat, no complex dependencies. Flarum is built with PHP so it’s quick and easy to deploy. The interface is powered by Mithril, a performant JavaScript framework with a tiny footprint.

* **Beautiful and responsive.** This is forum software for humans. Flarum is carefully designed to be consistent and intuitive across platforms, out-of-the-box.

* **Powerful and extensible.** Customize, extend, and integrate Flarum to suit your community. Flarum’s architecture is amazingly flexible, with a powerful Extension API.

![screenshot](https://flarum.org/img/screenshot.png)

## Installation

This project wraps a default Flarum installation, adds Redis drivers, and spins up an additional container acting as the queue worker. DB uses Percona 5.7, and PHPMyAdmin is also included.

```bash
$ composer install
$ docker-compose build
$ docker-compose up
```

Read the **[Installation guide](https://flarum.org/docs/install.html)** for more information. For support, refer to the [documentation](https://flarum.org/docs/), and ask questions on the [community forum](https://discuss.flarum.org/) or [Discord chat](https://flarum.org/discord/).


## License

Flarum is open-source software licensed under the [MIT License](https://github.com/flarum/flarum/blob/master/LICENSE).

