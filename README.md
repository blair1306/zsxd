
![Zelda: Mystery of Solarus XD Logo](/data/logos/logo.png)

# Zelda: Mystery of Solarus XD

This package contains the data files of the game Zelda: Mystery of Solarus XD.
This quest is a free, open-source game that works with Solarus,
an open-source Zelda-like 2D game engine.
To play this game, you need Solarus.
We assume in this readme that Solarus is already installed.

See our development blog (http://www.solarus-games.org) to get more
information and documentation about Solarus and our games.


## Play directly

You need to specify to the `solarus_run` binary the path of the quest data files
to use. The binary `solarus_run` accepts two forms of quest paths:
 - a directory having a subdirectory named `data` with all data inside,
 - a directory having a zip archive `data.solarus` with all data inside.

Thus, to run zsxd, if the current directory is the one that
contains the `data` subdirectory (and this readme), you can type:
```
$ solarus_run .
```
Or without arguments, if Solarus was compiled with the default quest set to `"."`:
```
$ solarus_run
```


## Install the quest

###  Default settings

If you want to install zsxd, cmake and zip are recommended.
Just type:
```
$ cmake .
$ make
```

This generates the `data.solarus` archive that contains all data files
of the quest. You can then install it with
```
$ make install
```

This installs the following files (assuming that the install directory
is `/usr/local`):
- the quest data archive (`data.solarus`) in `/usr/local/share/solarus/zsxd/`
- a script called `zsxd` in `/usr/local/bin/`

The `zsxd` script launches `solarus_run` with the appropriate command-line argument
to specify the quest path.
This means that you can launch the zsxd quest with the command:
```
$ zsxd
```
which is equivalent to:
```
$ solarus_run /usr/local/share/solarus/zsxd
```


###  Change the install directory

You may want to install zsxd in another directory
(e.g. so that no root access is necessary). 
You can specify this directory as a parameter of cmake:
```
$ cmake -D CMAKE_INSTALL_PREFIX=/home/your_directory .
$ make
$ make install
```
This installs the files described above, with the
`/usr/local` prefix replaced by the one you specified.
The script generated runs solarus_run with the appropriate quest path.
