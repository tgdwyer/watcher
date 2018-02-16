module Process
    ( runProc
    ) where
import System.IO
import System.Process

runProc programPath args = do
    putStrLn $ "> running  " ++ programPath ++ " on " ++ head args ++ "..."
    (_, Just hout, _, _) <- createProcess (proc programPath args){ std_out = CreatePipe, cwd = Just "." }
    dateOut <- hGetContents hout
    putStrLn dateOut

-- processTest = do
--     (Just hin, Just hout, _, _) <- createProcess (proc "grep" ["hello"]){ std_in = CreatePipe, std_out = CreatePipe }
--     hPutStr hin "hello grep\ngoodbye grep"
--     grepBytes <- hGetContents hout
--     putStrLn "> grep hello"
--     putStrLn grepBytes

--     (_, Just hout, _, _) <- createProcess (proc "bash" ["-c", "ls -a -l -h"]){ std_out = CreatePipe }
--     lsOut <- hGetContents hout
--     putStrLn "> ls -a -l -h"
--     putStrLn lsOut
