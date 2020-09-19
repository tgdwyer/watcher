import Process
import Watch
import System.Environment
import System.FilePath

-- import Control.Concurrent.MVar
-- import qualified Data.ByteString.Lazy as LB
-- import Data.Digest.Pure.MD5

-- e.g.:
-- target = "/home/dwyer/src"
-- program = "/home/dwyer/.local/bin/doctest.exe"
main :: IO ()
main = do
    (target:program:_) <- getArgs
    putStrLn $ "Watching " ++ target ++ " ..."
    watch (runProc program) (takeDirectory target)

-- this was an experiment to see if MD5s could help with double firing events.
-- In the end, adding a debounce time to the watcher did the trick.
-- mainMD5 :: IO ()
-- mainMD5 = do
--     (target:program:_) <- getArgs
--     mv <- getMD5 target >>= newMVar
--     watch (action target mv program) (takeDirectory target)

-- getMD5 targetFile = do
--     fileContent <- LB.readFile targetFile
--     return $ md5 fileContent

-- action :: Show a => FilePath -> MVar MD5Digest -> FilePath -> a -> IO ()
-- action targetFile targetFileMD5 program fileChange = do
--     oldMD5 <- readMVar targetFileMD5
--     print fileChange
--     newMD5 <- getMD5 targetFile
--     if oldMD5 /= newMD5 then 
--         runProc program targetFile 
--     else print "NO CHANGE"
--     modifyMVar_ targetFileMD5 (\_ -> return newMD5)
    