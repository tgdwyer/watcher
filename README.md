# watcher
General purpose directory / file watcher that runs a specified task when files change.  Implemented in Haskell.

Build and install with [stack](https://docs.haskellstack.org/en/stable/README/).
```
$ stack build && stack install
```
I use it to run [doctest](https://github.com/sol/doctest) on a source file with tests embedded in comments whenever that file changes,
e.g. to run doctest on tst.hs whenever tst.hs changes:
```
$ watcher c:/temp/tst.hs "$(where doctest)"
Watching C:/temp/tst.hs ...
```
Then, whenever tst.hs changes, you'll either see:
```
> running  c:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe on c:\temp\tst.hs...
Examples: 1  Tried: 1  Errors: 0  Failures: 0
```
or something like:
```
> running  c:/users/tim dwyer/appdata/roaming/local/bin/doctest.exe on C:\temp\tst.hs...
### Failure in C:\temp\tst.hs:5: expression `factorial 3'
expected: 7
 but got: 6
Examples: 1  Tried: 1  Errors: 0  Failures: 1
```
