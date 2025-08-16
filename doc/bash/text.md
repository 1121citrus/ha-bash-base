# Text Manipulation Functions


#### Contents
  - [Usage](#usage)
  - [Functions](#functions)
      - [append()](#append)
        - [Usage](#usage)
      - [commify()](#commify)
        - [Usage](#usage)
      - [commaspacify()](#commaspacify)
        - [Usage](#usage)
      - [double-quote()](#double-quote)
        - [Usage](#usage)
      - [is-false()](#is-false)
        - [Usage](#usage)
      - [is_false()](#is-false)
      - [is-number()](#is-number)
        - [Usage](#usage)
          - [Example 1](#example-1)
          - [Example 2](#example-2)
      - [is-true()](#is-true)
        - [Usage](#usage)
      - [is_true()](#is-true)
      - [prepend()](#prepend)
        - [Usage](#usage)
      - [prettycommify()](#prettycommify)
        - [Usage](#usage)
      - [quote()](#quote)
        - [Usage](#usage)
      - [spacify()](#spacify)
        - [Usage](#usage)
      - [to-lower()](#to-lower)
        - [Usage](#usage)
      - [tolower()](#tolower)
      - [to-upper()](#to-upper)
        - [Usage](#usage)
      - [toupper()](#toupper)

## Usage

```
source "${TEXT_FUNCTIONS_FILE:-/usr/local/include/bash/text-functions}"
```

## Functions

#### append()

Appends its arguments to each line of input.

##### Usage

```
$ echo interesting data | append ' # Interesting!'
interesting data # Interesting!
```

#### commify()

Collapses the input into a comma separated string.

##### Usage

```
$ seq 1 10 | commify
1,2,3,4,5,6,7,8,9,10
```


#### commaspacify()

Collapses the input into a comma-space separated string.

##### Usage

```
$ seq 1 10 | commaspacify
1, 2, 3, 4, 5, 6, 7, 8, 9, 10
```


#### double-quote()

Surrounds input lines with ASCII double quote character.

##### Usage

```
$ seq 1 10 | double-quote
"1"
"2"
"3"
"4"
"5"
"6"
"7"
"8"
"9"
"10"
```


#### is-false()

Shorthand for `! is-true arg`

##### Usage

```
$ is-false yes ; echo exit status $?
exit status 1
$ is-false napkins ; echo exit status $?
exit status 0
```

returns exit code 0 if the argument is not true and 1 otherwise. See `[is-true()](#is-true)`.


#### is_false()

Shorthand for `[is-false()](#is-false)`


#### is-number()

If the argument is decimal string then it is written to standard output and returns true,
otherwise the input is discarded and the function returns false.

##### Usage

###### Example 1
```
$ is-number 10 ; echo exit status $?
10
exit status 0
```

###### Example 2

```
$ is-number napkins ; echo exit status $?
exit status 1
```


#### is-true()

Returns true if the argument is one of `1`, `true`, `t`, `yes` or `y`. The comparison is case insensitive.

##### Usage

```
$ is-true yes ; echo exit status $?
exit status 0
$ is-true napkins ; echo exit status $?
exit status 1
```

returns exit code 0 if the argument is true and 1 otherwise. See is_false().


#### is_true()

Shorthand for `[is-true()](#is-true)`


#### prepend()

Prepends its arguments to each line of input.

##### Usage

```
$ echo interesting data | prepend '>> '
>> interesting data
```

#### prettycommify()

Like `commaspacify()` but with ' and ' between the last two elements.

##### Usage

```
$ seq 1 10 | prettycommify
1, 2, 3, 4, 5, 6, 7, 8, 9 and 10
```

#### quote()

Surrounds input lines with ASCII single quote character.

##### Usage

```
$ seq 1 10 | quote
'1'
'2'
'3'
'4'
'5'
'6'
'7'
'8'
'9'
'10'
```


#### spacify()

Collapses the input into a space separated string.

##### Usage

```
$ seq 1 10 | spacify
1 2 3 4 5 6 7 8 9 10
```


#### to-lower()

Converts `stdin` to lower case and writes to `stdout`.

##### Usage

```
$ echo UPPERCASE | to-lower
uppercase
```

#### tolower()

Synonym of `[to-lower()](#to-lower)`.


#### to-upper()

Converts `stdin` to upper case and writes to `stdout`.

##### Usage

```
$ echo lowercase | to-upper
LOWERCASE
```

#### toupper()

Synonym of `[to-upper()](#to-upper)`.



