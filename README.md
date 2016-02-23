# zvanilla

Start a zsh session with a different `.zshrc`.

## Usage

```
zsh zvanilla.zsh [-h] [-k] [-s <shell command>] [-t <tmpdir>] <zshrc>"
```

Without a file, it will start a zsh session with no initial configurations.

## Example
```
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

```
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
