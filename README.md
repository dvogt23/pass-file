# pass file
A pass extension that apply some file functions

## Description
*pass-file* extends the pass with a file command thats provide a command to add files to passwordstore and get files back from passwordstore to the current location.

## Usage
```
pass file 1.0 - A pass extension that apply to add a file to passwordstore

Usage:
        pass file [a <file> <pass item>] [g <pass-name>] [-V] [-h]
            Provide a command to add files to passwordstore and
            get files back from passwordstore to the current location.

        Options:
            a, add          Add file to passwordstore
            g, get          Get file from passwordstore
            -v, --version   Show version information.
            -h, --help      Print this help message and exit.

    More information may be found in the pass-file(1) man page.
```

## Installation

**From the AUR (Arch Linux)**

Using an AUR helper like yay

```sh
yay -S pass-file
# or
yay -S pass-file-git
```
Or following the instructions on the
[Arch Wiki](https://wiki.archlinux.org/index.php/Arch_User_Repository)

**From git**
```sh
git clone https://github.com/dvogt23/pass-file/
cd pass-file
sudo make install
```

**OS X**
```sh
git clone https://github.com/dvogt23/pass-file/
cd pass-file
make install PREFIX=/usr/local
```

**Requirements**
* `pass 1.7.0` or greater.
* If you do not want to install this extension as system extension, you need to enable user extension with `PASSWORD_STORE_ENABLE_EXTENSIONS=true pass`. You can create an alias in `.bashrc`: `alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'`

## Examples

**Save private.pfx file**
```
zx2c4@laptop ~ $ pass file add private.pfx Site/username
```

**Get file to current location**
```
zx2c4@laptop ~ $ pass file get Site/username/private.pfx
```

## Contribution
Feedback, contributors, pull requests are welcome.

## License
```
    Copyright (C) 2017

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
```
