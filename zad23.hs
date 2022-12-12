maxList :: [[Int]] -> [Int] -- lista o max długości 
maxList (x:xs) = 
    if length x >= length mlist
        then x
        else mlist
    where mlist = maxList xs
maxList [] = []

maximalDistribution :: Int -> [Int]
maximalDistribution n = maxList [memory!!i | i <- primes n]
    where 
        memory :: [[Int]] -- spamiętane maksymalne rozbicie liczby na składniki pierwsze
        memory = map opt [0..n]
        
        opt :: Int -> [Int] -- maksymalne rozbicie liczby na składniki pierwsze
        opt v = (maxList . filter (\x -> sum x == v)) [ -- opt(x) = max(opt(x - p1) ++ [x], opt(x - p2) ++ [x] ...)
            if x `notElem` (memory!!(v - x)) -- pozbycie się duplikatów
                then memory!!(v - x) ++ [x] 
                else []
            | x <- primes v] 
  
        primes :: Int -> [Int]
        primes p = [x | x <- [2..p], isPrime x]

        isPrime :: Int -> Bool
        isPrime p = 
            not (any (\x -> (p `mod` x == 0) && (x /= p)) [2..p])

main :: IO()
main = do   
    putStrLn "Podaj liczbe:"
    num <- getLine
    let mdist = maximalDistribution (read num :: Int)
    putStrLn $ show (sum mdist) ++ ": " ++ show mdist

-- dla 81: 79: [3,5,11,7,17,13,23]