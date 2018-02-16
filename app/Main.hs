import Process
import Watch
import System.Environment

action program args fileChange = do
    print fileChange
    runProc program args

program = "c:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe"
args = ["c:\\temp\\tst.hs"]

main = do
    (program:args) <- getArgs
    watch (action program args)
