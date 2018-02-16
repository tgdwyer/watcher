import Process
import Watch

action program args fileChange = do
    print fileChange
    runProc program args

program = "c:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe"
args = ["c:\\temp\\tst.hs"]

main = watch (action program args)
