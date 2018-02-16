import Process
import Watch
import System.Environment
import Control.Concurrent.MVar
import System.FilePath

import qualified Data.ByteString.Lazy as LB
import Data.Digest.Pure.MD5

getMD5 targetFile = do
    fileContent <- LB.readFile targetFile
    return $ md5 fileContent

action :: Show a => FilePath -> MVar MD5Digest -> FilePath -> a -> IO ()
action targetFile targetFileMD5 program fileChange = do
    oldMD5 <- readMVar targetFileMD5
    print fileChange
    newMD5 <- getMD5 targetFile
    if oldMD5 /= newMD5 then runProc program targetFile else print "NO CHANGE"
    modifyMVar_ targetFileMD5 (\_ -> return newMD5)


-- target = "C:/temp/tst.hs"
-- program = "c:/users/tim dwyer/appdata/roaming/local/bin/doctest.exe"
main :: IO ()
main = do
    (target:program:_) <- getArgs
    md5 <- getMD5 target
    mv <- newMVar md5
    watch (action target mv program) (takeDirectory target)
