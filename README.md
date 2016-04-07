# zvanilla

Start a zsh session with a different `.zshrc`.

## Usage

```
zsh zvanilla.zsh [-h] [-k] [-s <shell command>] [-t <tmpdir>] <zshrc>"
```

Without a file, it will start a zsh session with no initial configurations.

The environment variable `ZVANILLA_DIR` can be used to reference the temporary
directory that is used as the `ZDOTDIR`.

## Example

This script was originally written to test out
[zplug](https://github.com/b4b4r07/zplug) in a vanilla environment.

```console
% cat ~/zshrc
export ZPLUG_HOME=$ZVANILLA_DIR
export ZPLUG_ROOT=$ZVANILLA_DIR

unset ZPLUG_LOADFILE
# export ZPLUG_LOADFILE=~/.zplug.zsh

source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-syntax-highlighting'

zplug check || zplug install

zplug load
% zvanilla ~/zshrc
% exit
%
```

Some more examples.

```console
% cat my_zshrc.zsh
echo 'Hello, World!'
PROMPT='>>> '
% ./zvanilla.zsh my_zshrc.zsh
Hello, World!
>>> exit
%
```

Or, you can use [curl](https://curl.haxx.se/) to download and directly execute
the script without saving it.

```console
% cat my_zshrc.zsh
echo 'Hello, World!'
PROMPT='>>> '
# First -s is an option for zsh to pass in arguments
% zsh -c "$( curl -L https://git.io/zvanilla )" -s -s /usr/local/bin/zsh -t . my_zshrc.zsh
Hello, World!
>>> exit
%
```

## License
MIT

## Author
Naoki Mizuno
