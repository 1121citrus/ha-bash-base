# Logging

#### Contents
  - [Usage](#usage)
  - [Functions](#functions)
      - [debug()](#debug)
        - [Usage](#usage)
        - [Passing a log message argument](#passing-a-log-message-argument)
        - [Piping messages into debug](#piping-messages-into-debug)
      - [dryrun()](#dryrun)
        - [Usage](#usage)
        - [Passing a log message argument](#passing-a-log-message-argument)
        - [Piping messages into debug](#piping-messages-into-dryrun)
      - [error()](#error)
        - [Usage](#usage)
        - [Passing a log message argument](#passing-a-log-message-argument)
        - [Piping messages into error](#piping-messages-into-error)
      - [ignore()](#ignore)
        - [Usage](#usage)
        - [Passing a log message argument](#passing-a-log-message-argument)
        - [Piping messages into ignore](#piping-messages-into-ignore)
      - [info()](#info)
         - [Usage](#usage)
         - [Passing a log message argument](#passing-a-log-message-argument)
         - [Piping messages into info](#piping-messages-into-info)
      - [log()](#log)
         - [Usage](#usage)
         - [Passing a log message argument](#passing-a-log-message-argument)
         - [Piping messages into the logger](#piping-messages-into-the-logger)
      - [warn()](#warn)
         - [Usage](#usage)
         - [Passing a log message argument](#passing-a-log-message-argument)
         - [Piping messages into info](#piping-messages-into-info)
      - [warning()](#warning)

## Usage

```bash
source /usr/local/1121citrus/include/bash/common-functions
```

Note that these are Bash  __functions__  and, hence, cannot be `exec`'ed.

```console
$ docker run -i --rm 1121citrus/ha-bash-base:latest debug message
/usr/local/bin/docker-entrypoint.sh: line 11: exec: debug: not found
```

compared to

```console
docker run -i --rm -e DEBUG=true 1121citrus/ha-bash-base:latest bash -c 'debug message'
20251002T172747 bash [DEBUG] message
```

or

```console
echo debug message | docker run -i --rm 1121citrus/ha-bash-base:latest
20251002T172206 bash [DEBUG] message
```

The first form uses the container's `exec` entry point and does not execute under
a shell so the function is not available. The second and third forms causes the
`debug` statement to execute within an initialized Bash shell and so the functions
are available.

## Functions

#### debug()

Shorthand for:

```bash
log DEBUG a debug message
```

##### Usage

##### Passing a log message argument

Within `my-script`

```bash
debug a debug message
```

produces output like:

```
20250728T041501 my-script [DEBUG] a debug message
```

##### Piping messages into debug

Given a file `messages`:

```
export FOO=foo
export BAR=bar
```

```bash
cat messages | debug
```

produces output like:

```
20250728T041501 my-script [DEBUG] export FOO=foo
20250728T041501 my-script [DEBUG] export BAR=bar
```

#### dryrun()

Shorthand for:

```bash
log DRYRUN a dryrun message
```

##### Usage

##### Passing a log message argument

Within `my-script`

```bash
dryrun a dryrun message
```

produces output like:

```
20250728T041501 my-script [DRYRUN] a dryrun message
```

##### Piping messages into dryrun

Given a file `messages`:

```
export FOO=foo
export BAR=bar
```

```bash
cat messages | dryrun
```

produces output like:

```
20250728T041501 my-script [DRYRUN] export FOO=foo
20250728T041501 my-script [DRYRUN] export BAR=bar
```

#### error()

Shorthand for:

```bash
log ERROR oops!
```

with the added behavior of exiting with an error status (specified by the `EXIT_CODE` environment variable, which defaults to one (1))

##### Usage

##### Passing a log message argument

Within `my-script`

```bash
trap 'debug exit' EXIT
error file /config/config.yaml not found
```

produces output like:

```
20250728T041501 my-script [ERROR] file /config/config.yaml not found
20250728T041501 my-script [DEBUG] exit
```

##### Piping messages into error

Given a file `messages`:

```
file /config/config.yaml not found
set CONFIG_FILE
```

```bash
trap 'debug exit' EXIT
cat messages | error
```

produces output like:

```
20250728T041501 my-script [ERROR] file /config/config.yaml not found
20250728T041501 my-script [ERROR] set CONFIG_FILE
20250728T041501 my-script [DEBUG] exit
```

#### ignore()

Shorthand for:

```bash
log IGNORE message
```

##### Usage

##### Passing a log message argument

Within `my-script`

```bash
debug ignore message
```

produces output like:

```
20250728T041501 my-script [IGNORE] message
```

##### Piping messages into ignore

Given a file `messages`:

```
export FOO=foo
export BAR=bar
```

```bash
cat messages | ignore
```

produces output like:

```
20250728T041501 my-script [IGNORE] export FOO=foo
20250728T041501 my-script [IGNORE] export BAR=bar
```

#### info()

Shorthand for:

```bash
log INFO message
```

##### Usage

##### Passing a log message argument

Within `my-script`

```bash
info message
```

produces output like:

```
20250728T041501 my-script [INFO] message
```

##### Piping messages into info

Given a file `messages`:

```
export FOO=foo
export BAR=bar
```

```bash
cat messages | info
```

produces output like:

```
20250728T041501 my-script [INFO] export FOO=foo
20250728T041501 my-script [INFO] export BAR=bar
```


#### log()

Formats and writes a log message.

##### Usage

##### Passing a log message argument

Within `my-script`

```bash
log SEVERE 'Wake up! A really big problem has occurred!'
```

produces output like:

```
20250728T041501 my-script [SEVERE] Wake up! A really big problem has occurred!
```

##### Piping messages into the logger

Given a file `messages`:

```
Wake up! A really big problem has occurred!
There is a gas leak!
The house is on fire!
```

```bash
cat messages | log SEVERE
```

produces output like:

```
20250728T041501 my-script [SEVERE] Wake up! A really big problem has occurred!
20250728T041501 my-script [SEVERE] There is a gas leak!
20250728T041501 my-script [SEVERE] The house is on fire!
```

#### warn()

Shorthand for:

```bash
log WARN message
```

##### Usage

##### Passing a log message argument

Within `my-script`

```bash
warn message
```

produces output like:

```
20250728T041501 my-script [WARN] message
```

##### Piping messages into info

Given a file `messages`:

```
export FOO=foo
export BAR=bar
```

```bash
cat messages | warn
```

produces output like:

```
20250728T041501 my-script [WARN] export FOO=foo
20250728T041501 my-script [WARN] export BAR=bar
```

#### warning()

Synonym of `warn`.



