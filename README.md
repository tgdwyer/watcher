# watcher
General purpose directory / file watcher that runs a specified task when files change.  Implemented in Haskell.

```
$ stack build && stack install
```
run doctest on tst.hs whenever tst.hs changes:
```
$ watcher "c:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe" "c:\\temp\\tst.hs"
Modified "C:\\temp\\tst.hs" 2018-02-16 07:21:06.3784167 UTC
> running  c:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe on c:\temp\tst.hs...
Examples: 1  Tried: 1  Errors: 0  Failures: 0$ stack exec watcher-exe "c:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe" "c:\\temp\\tst.hs"
Modified "C:\\temp\\tst.hs" 2018-02-16 07:21:06.3784167 UTC
> running  c:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe on c:\temp\tst.hs...
Examples: 1  Tried: 1  Errors: 0  Failures: 0
```