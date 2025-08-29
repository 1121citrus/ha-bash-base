# Common Commands

Defines commands for:

* [date and time](./date.md)
* [hashing](./hash.md)
* [logging](./logging.md)
* [text manipulation](./text.md)

## Usage

Common commands and functions are loaded by default via Bash profiles and `rc` files,
so sourcing the common functions is generally unnecessary.

```bash
source "${COMMON_FUNCTIONS_FILE:-/usr/local/1121citrus/include/bash/dot-bashrc}"
```

Unlike functions, commands can be invoked with `docker run`:

```bash
function ha() {
    docker run -i --rm 1121citrus/ha-bash-base:${TAG:-latest} "${@}"
}

echo /dev/null | ha sha3-256
```