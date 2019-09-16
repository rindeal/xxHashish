xxHashish
=========

_xxHash in pure POSIX shell script_

The original xxHash code can be found at <https://github.com/Cyan4973/xxhash>.

This project is based on xxbash, which can be found at <https://github.com/easyaspi314/xxbash>

## Requirements

### Runtime

A POSIX-compliant shell with 64-bit arithmetic.

`xxhsum.sh` requires `hexdump` utility from _util-linux_ suite.

### Build

- GNU `m4`
- GNU `sed`
- GNU `awk`
- `perl`


## Usage

### `XXH64()`

`xxhashi.sh` contains `XXH64()` function.
This function accepts a single optional parameter `seed`, which MUST be a number.

`XXH64()` then reads a stream of hexadecimal representations (no `0x` prefix) of raw bytes from standard input,
**8** per line (the last line can be shorter), calculates the 64-bit _xxHash_ value and
prints its value on the standard output as a hexadecimal number without prefix.

##### Example

```sh
% . $PWD/xxhashi.sh
% XXH64 << '_EOF_'
> 0011223344556677
> AABBCC
> _EOF_
1a567375f093818e
%
```

### `xxhsum.sh`

Same as original `xxhsum` utility, but doesn't accept any options as arguments, only files.

##### Example

```sh
% ./xxhsum.sh *
58f1b152cb26661e  del_arith_ws.awk
6fb781d4d545dcb8  LICENCE.md
0d654df0ff965d04  Makefile
3acfa344b19c44b4  README.md
63902edc71ba8a6c  xxhashi.sh
9283f28be6dedd72  xxhashi.sh.in
d5d8a029f3fd0483  xxhsum.sh
```

## Performance

About 50x worse than reference implementation in C,
when run in a `dash` shell compiled with `-O2 -flto -march=native -fprofile-use`
on a single core of my specific machine with 4500 BogoMips,
using my specific test file (first 20 paragraphs of Lorem Ipsum) and
looping 200x over it.

More than 8x faster than `xxbash` from _easyaspi314@github_.

Your mileage will vary.
