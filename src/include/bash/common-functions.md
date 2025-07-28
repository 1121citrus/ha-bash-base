# Common Bash Functions

## Usage

```bash
source "${COMMON_FUNCTIONS_FILE:-/usr/local/include/bash/common-functions}"
```

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


#### is_false()

Shorthand for `! is_true arg`

##### Usage

```bash
is_false "${ARGUMENT}"
is_false yes        # returns 1
is_false napkins    # returns 0
```

returns exit code 0 if the argument is not true and 1 otherwise. See is_true().


#### is_true()

Returns true is the argument is one of `1`, `true`, `t`, `yes` or `y`. The comparison is case insensitive.

##### Usage

```bash
is_true yes        # returns 0
is_true napkins    # returns 1
```

returns exit code 0 if the argument is true and 1 otherwise. See is_false().


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

#### tolower()

Converts `stdin` to lower case and writes to `stdout`.

##### Usage

```bash
echo UPPERCASE | tolower
```

produces output:

```
uppercase
```


#### toupper()

Converts `stdin` to upper case and writes to `stdout`.

##### Usage

```bash
echo lowercase | tolower
```

produces output:

```
LOWERCASE
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



