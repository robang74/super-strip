## sstrip

This is a fork of [aunali1/super-strip](https://github.com/aunali1/super-strip) with some minor changes.

### compile

```sh
make
```

### usage

```sh
❯ sstrip --help

Usage: sstrip [OPTIONS] FILE...
Remove all nonessential bytes from executable ELF files.

  -z, --zeroes        Also discard trailing zero bytes.
      --help          Display this help and exit.
      --version       Display version information and exit.
```

### w/ soar

Use [soar](https://github.com/pkgforge/soar) & Run:

```sh
# Default (LTO + PIE)
soar add 'sstrip#github.com.pkgforge-dev.super-strip'

# Compressed (LTO + PIE + UPXed)
soar add 'sstrip.upx#github.com.pkgforge-dev.super-strip'

# Compressed (LTO + PIE + UPXed + sstripped)
soar add 'sstrip.upx.ss#github.com.pkgforge-dev.super-strip'
```

<br>

## Rationale

Super-strip (`sstrip`) is a small utility that removes as much as possible from an ELF file without affecting the file's memory image.

Most ELF executables are built with both a program header table and a section header table. However, only the former is required in order for the OS to load, link and execute a program. sstrip attempts to extract the ELF header, the program header table, and its contents, leaving everything else in the bit bucket. It can only remove parts of the file that occur at the end, after the parts to be saved. However, this almost always includes the section header table, along with a few other sections that are not involved in program loading and execution.

It should be noted that most programs that work with ELF files are dependent on the section header table as an index to the file's contents. Thus, utilities such as gdb and objdump will often have limited functionality when working with an executable with no section header table. Some other utilities may refuse to work with them at all.

sstrip is at heart a very simple program. It depends upon the common practice of putting the parts of the file that contribute to the memory image at the front, and the remaining material at the end. This permits it to discard the latter material without affecting file offsets and memory addresses in what remains. Of course, the ELF standard permits files to be organized in almost any order, so if a pathological linker decided to put the program segment header table at the end of the file, sstrip would be unable to remove anything.
