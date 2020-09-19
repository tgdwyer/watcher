module Process
    ( runProc
    ) where
import System.IO
import System.Process
import System.FSNotify
import System.Console.ANSI

cls :: IO ()
cls = do
    setCursorPosition 0 0
    clearScreen

runProc :: FilePath -> Event -> IO ()
runProc programPath (Modified f _ _) = do
    cls
    putStrLn $ "> running  " ++ programPath ++ " on " ++ f ++ "..."
    (_, Just hout, _, _) <- createProcess (proc programPath [f]){ std_out = CreatePipe, cwd = Just "." }
    dateOut <- hGetContents hout
    putStrLn dateOut

runProc programPath _ = print "Only watching file changes..."
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
