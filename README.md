# zvanilla

Start a zsh session with a different `.zshrc`.

## Usage

```
zsh zvanilla.zsh [-h] [-s <shell command>] [-t <tmpdir>] [zshrc]
```

Without a file, it will start a zsh session with no initial configurations.

## Example
```
% cat my_zshrc.zsh
echo 'Hello, World!'
PROMPT='>>> '
% zsh -c "$( curl -L https://git.io/zvanilla ) -s /usr/local/bin/zsh -t . my_zshrc.zsh"
Hello, World!
>>> exit
%
```

## License
MIT

## Author
Naoki Mizuno
