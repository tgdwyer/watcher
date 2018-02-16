import Process
import Watch

action arg = do
    print arg
    docTest

main = watch action
