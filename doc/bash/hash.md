# Message Digest (message digest) Functions

The SHA hashes are computed as described in [FIPS PUB 180-4](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf)

#### Contents
  - [Usage](#usage)
  - [Functions](#functions)
      - [md5()](#md5)
        - [Usage](#usage)
      - [sha1()](#sha1)
        - [Usage](#usage)
      - [sha224()](#sha224)
        - [Usage](#usage)
      - [sha256()](#sha256)
        - [Usage](#usage)
      - [sha384()](#sha384)
        - [Usage](#usage)
      - [sha512()](#sha512)
        - [Usage](#usage)
      - [sha512-224()](#sha512-224)
        - [Usage](#usage)
      - [sha512-256()](#sha512-256)
        - [Usage](#usage)

## Usage

```
source "${LOGGING_FUNCTIONS_FILE:-/usr/local/include/bash/hash}"
```

## Functions

#### md5()

Returns the [MD5](https://www.rfc-editor.org/rfc/rfc1321.html) message digest of standard input.

##### Usage

```
$ seq 1 10 | md5
3b0332e02daabf31651a5a0d81ba830a
```


#### sha1()

Returns the SHA-1 message digest of standard input.

##### Usage

```
$ seq 1 10 | sha1
612ca68d0305c821750a452e9d5bf050e915824f
```


#### sha224()

Returns the SHA-224 message digest of standard input.

##### Usage

```
$ seq 1 10 | sha224
27cbcb9e6bbd5123bb897c1b11c6e2c36dfc7ec75cd2e194c4aac7ad
```


#### sha256()

Returns the SHA-256 message digest of standard input.

##### Usage

```
$ seq 1 10 | sha256
bf794518e35d7f1ce3a50b3058c4191bb9401e568fc645d77e10b0f404cf1f22
```


#### sha384()

Returns the SHA-384 message digest of standard input.

##### Usage

```
$ seq 1 10 | sha384
0f376e63af6e9e5b06754b45ac75416c940c21f699be861ff6da9d395fed13e5de416865b8e382bb00d3fdb4f6629fd5
```


#### sha512()

Returns the SHA-512 message digest of standard input.

##### Usage

```
$ seq 1 10 | sha512
63ea70d6ef287c5a1db399ef6963bd02bb8d97d654b205feb824afde68abd0ef44e9801190ae3e874765dcad041773362ef469828d39f89dbf310b016742aa9c
```


#### sha512-224()

Returns the SHA-512/224 message digest of standard input.

##### Usage

```
$ seq 1 10 | sha512-224
20620f3f6ff46d9c47de3a13bbbc224f11daf96cf57f1b3864480e9f
```


#### sha512-256()

Returns the SHA-512/256 message digest of standard input.

##### Usage

```
$ seq 1 10 | sha512-256
33baa4c33851469a9b7cac95dc969578eb0ee37705de47c6776fca4e2dba82ff
```

