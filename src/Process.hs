module Process
    ( docTest,
      processTest
    ) where
import System.IO
import System.Process

docTest = do
    (_, Just hout, _, _) <- createProcess (proc "C:/Users/Tim Dwyer/AppData/Roaming/local/bin/doctest.exe" ["C:\\temp\\watcher\\tst.hs"]){ std_out = CreatePipe, cwd = Just "." }
    dateOut <- hGetContents hout
    putStrLn "> run tests..."
    putStrLn dateOut

processTest = do
    (Just hin, Just hout, _, _) <- createProcess (proc "grep" ["hello"]){ std_in = CreatePipe, std_out = CreatePipe }
    hPutStr hin "hello grep\ngoodbye grep"
    grepBytes <- hGetContents hout
    putStrLn "> grep hello"
    putStrLn grepBytes

    (_, Just hout, _, _) <- createProcess (proc "bash" ["-c", "ls -a -l -h"]){ std_out = CreatePipe }
    lsOut <- hGetContents hout
    putStrLn "> ls -a -l -h"
    putStrLn lsOut
