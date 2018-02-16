module Tst
where

-- |
-- >>> factorial 3
-- 6
factorial 1 = 1
factorial n = n * factorial (n - 1)
