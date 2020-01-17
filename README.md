# datasheet-sync

Keep all your projects datasheets in one place and see when they change.
This utility downloads everything that's in `datasheets.csv` and makes a
text version out of it to easily see the diff in the history.

When downloading datasheets, it first checks if the file was modified on
the server, and if not does not download it again.

## Requirements

 * git
 * pdftotext
 * curl
 * some POSIX shell (tested with BASH)
 * systemd (optional, you can run the script as you want)

## Usage

To use it, just clone this repository wherever suits you and start adding
your URLs to `datasheets.csv` and commit it. When finished run
`./datasheet-sync.sh` and it will download and process everything. When it finishes, it will stage and commit the
changed and new datasheets.

If you don't want to run the utility manually, just add a cronjob or
equivalent to run it periodically.

## Installation

Simply `./install-timer.sh` as user (not with sudo) - this will install it as a systemd timer for the current user.

If you move the containing directory elsewhere, you will need to reinstall it by simply re-running the install script.

## Disabling the service

Run `systemctl --user disable datasheet-sync.timer`

The service file and timer is located under `~/.local/share/systemd/user/` - delete if you want to
