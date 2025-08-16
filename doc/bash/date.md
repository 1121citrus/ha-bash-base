# Date and Time Functions

#### Contents
  - [Usage](#usage)
  - [Functions](#functions)
      - [current-month()](#current-month)
        - [Usage](#usage)
      - [current-year()](#current-year)
        - [Usage](#usage)
      - [day-of-month()](#day-of-month)
        - [Usage](#usage)
      - [today()](#today)
        - [Usage](#usage)
      - [tomorrow()](#tomorrow)
        - [Usage](#usage)
      - [yesterday()](#yesterday)
        - [Usage](#usage)

## Usage

```bash
source "${LOGGING_FUNCTIONS_FILE:-/usr/local/include/bash/date}"
```

## Functions

#### current-month()

Returns the current month as a 2 digit (leading zero) integer.

##### Usage

```bash
$ current-month
08
```


#### current-year()

Returns the current year as a 4 digit integer.

##### Usage

```bash
$ current-year
2025
```


#### day-of-month()

Returns the date in the current month as a 2 digit (leading zero) integer.

##### Usage

```bash
$ day-of-month
15
```


#### today()

Returns the date in YYYY-MM-DD format.

##### Usage

```bash
$ today
2025-08-15
```


#### tomorrow()

Returns the tomorrow's date in YYYY-MM-DD format.

##### Usage

```bash
$ tomorrow
2025-08-16
```


#### yesterday()

Returns the yesterday's date in YYYY-MM-DD format.

##### Usage

```bash
$ yesterday
2025-08-14
```
