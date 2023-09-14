```
 _______  _______  _______  _______ 
|       ||       ||       ||       |
|    ___||   _   ||_     _||   _   |
|   | __ |  | |  |  |   |  |  | |  |
|   ||  ||  |_|  |  |   |  |  |_|  |
|   |_| ||       |  |   |  |       |
|_______||_______|  |___|  |_______|

A simple cli app writen in go that allowes you to 
easily navigate through your terminal.
```

## Contents
### [Installation](#installation) 
 - How to install the app
### [Usage](#usage) 
 - How to use the cli
### [Examples](#examples)
 - Example usage of the goto app

## Installation

### Requirements
 * Go installed
 * Bash

Start out by cloning the repository
```bash
git clone https://www.github.com/ProductionPanic/goto ./goto
```
Go into the cloned folder
```bash
cd ./goto
```
Fix permissions
```bash
chmod +x ./install.sh
```
Install the app
```bash
./install.sh
```

## Usage
```
Usage: goto [options] [dir]
Options:
  -h, --home		Start from home directory (~/)
  --help		show this help message
```

## Examples
Goto tries to guesse which dir you mean so a command like
```bash
goto -h down
```
Could run the following 
```bash
cd ~/Downloads/
```

-------------


Goto also allowes you to navigate nested directories
```bash
goto press config
```
Could be use to run the following
```bash
cd ./wordpress/wp-config
```

## License

This repository uses an MIT licencse
