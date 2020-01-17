# datasheet-sync

Keep all your projects datasheets in one place and see when they change.
This utility downloads everything that's in `datasheets.csv` and makes a
text version out of it to easily see the diff in the history.

When downloading datasheets, it first checks if the file was modified on
the server, and if not does not download it again.

## Usage

To use it, just clone this repository wherever suits you and start adding
your URLs to `datasheets.csv` and commit it. When finished run
`./datasheet-sync.sh` and it will download and process everything. When it finishes, it will stage and commit the
changed and new datasheets.

If you don't want to run the utility manually, just add a cronjob or
equivalent to run it periodically.
