# pass file
A pass extension that apply some file functions

## Description
*pass-file* extends the pass with a file command thats provide a command to add files to passwordstore and get files back from passwordstore to the current location.

## Usage
```
pass file 1.0 - A pass extension that apply to add a file to passwordstore

Usage:
        pass file [-a <file> <pass item>] [-g <pass-name>] [-V] [-h]
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
If you do not want to install this extension as system extension, you need to enable user extension with PASSWORD_STORE_ENABLE_EXTENSIONS=true pass. You can create an alias in .bashrc: alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'

**Requirements**
* pass 1.7.0 or greater.

## Contribution
Feedback, contributors, pull requests are welcome.

## License
```
    Copyright (C) 2017  Alexandre PUJOL

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