# PastejackingProtection
A bash script against pastejacking. If you don't know what pastejacking is, check these links:

* https://github.com/dxa4481/Pastejacking
* http://www.ush.it/team/ascii/hack-tricks_253C_CCC2008/wysinwyc/what_you_see_is_not_what_you_copy.txt

Add the following bash script to your `~/.bashrc`:

```bash
function pp {
    xclip -o | cat -A
    echo -ne "\nExecute? (y/n): "
    read execute
    # only execute when 'y' was answered
    # all other input is ignored
    if [[ $execute == "y" ]]; then
        eval `xclip -o`
    fi
}
```

# Example usage

Using the demo from the first link, we get:

```
aaron@aaron-pc:~$ pp
echo "evil"$

Execute? (y/n): n
aaron@aaron-pc:~$
```

```
aaron@aaron-pc:~$ pp
echo "evil"$

Execute? (y/n): y
evil
aaron@aaron-pc:~$ 
```

The second link has a much bigger script that you can test it on, but it's too big for this purpose to paste it here.

# Requirements

* `xclip` needs to be installed

Tested on Ubuntu 15.04 and 16.04
