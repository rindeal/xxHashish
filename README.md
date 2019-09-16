xxHashish
=========

xxHash in pure POSIX shell script

The original xxHash code can be found at https://github.com/Cyan4973/xxhash.

Requirements: A POSIX-compatible shell with 64-bit arithmetic (preferably
a recent version, although macOS's bash 3.2 works), and m4 for building.

xxhsum.sh requires hexdump.

**Usage:**

Ok, this is how you use it:
```
./xxhsum.sh [-H0|-H1] [FILES...] (defaults to xxhash.sh)
-H0: XXH32, -H1: XXH64 (default)

. xxhash.sh
XXH32 "file in hex, no spaces or prefix" "seed"
XXH64 "file in hex, no spaces or prefix" "seed"
```
