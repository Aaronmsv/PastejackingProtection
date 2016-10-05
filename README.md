# PastejackingProtection
A bash script/function against pastejacking (also called **clipboard hijacking**). If you don't know what pastejacking is, check these links:

* https://github.com/dxa4481/Pastejacking
* http://www.ush.it/team/ascii/hack-tricks_253C_CCC2008/wysinwyc/what_you_see_is_not_what_you_copy.txt
* https://thejh.net/misc/website-terminal-copy-paste (good demo)

It shows the clipboard to you and gives you the option to execute the contents if you press `y`. Other input is ignored. It also prints special characters.

I used to paste everything in gedit first, check it and then paste it in the terminal, but this is faster and gives better output by showing special characters. It's also handy to prevent pasting commands ending with a newline from executing directly, even if it's not malicious.

###Alternatives###

* Using **Bash** there's the `edit-and-execute-command (C-xC-e)` option. This will open your editor where you can paste/edit the commands and Bash will execute it after closing the editor. Note that editors can be exploited the same way if you're not careful. For example pasting vim and emacs macros. See https://github.com/dxa4481/Pastejacking#how-do-you-protect-yourself
* **Zsh** with oh-my-zsh has a safe paste mode. It's also builtin since zsh 5.1+.
* **iTerm** will warn you when pasting newlines and can remove the newline for you.

NoScript is not sufficient because these attacks can be created with Javascript, but also HTML/CSS.

# Installation

There are two ways you can install this (assuming you use **Bash**):

* Copy `pp.sh` to `~/bin/` and add these lines to your `~/.bashrc`:
```
export PATH=$PATH:/home/USERNAME/bin
source pp.sh
```
* Copy the contents of `pp.sh` without the hashbang (the first line) directly to your `~/.bashrc`.

If you are using the Bourne shell you can use the `pp-compatibility.sh` script instead. (Change `source` to `.` for installing)

# Example usage

Using the demo from the first link, we expect to copy `echo "not evil"`. We get:

```
aaron@aaron-pc:~$ pp
echo "evil"^M$

Execute? (y/n): n
aaron@aaron-pc:~$
```

```
aaron@aaron-pc:~$ pp
echo "evil"^M$

Execute? (y/n): y
evil
aaron@aaron-pc:~$ 
```

That demo uses Javascript, but CSS can be used as well and NoScript can't protect you from that. The 3rd link is an example of that. You expected `git clone git://git.kernel.org/pub/scm/utils/kup/kup.git` but got:

```
aaron@aaron-pc:~$ pp
git clone /dev/null; clear; echo -n "Hello ";whoami|tr -d '\n';echo -e '!\nThat was a bad idea. Don'"'"'t copy code from websites you don'"'"'t trust!$
Here'"'"'s the first line of your /etc/passwd: ';head -n1 /etc/passwd$
git clone git://git.kernel.org/pub/scm/utils/kup/kup.git $

Execute? (y/n): n
aaron@aaron-pc:~$
```

The second link has a much bigger script that you can test it on, but it's too big for this purpose to paste it here.

# Requirements

* `xclip` needs to be installed

Tested on Ubuntu 15.04 and 16.04
