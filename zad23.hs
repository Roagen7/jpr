maxList :: [[Int]] -> [Int]
maxList (x:xs) = 
    if length x >= length mlist
        then x
        else mlist
    where mlist = maxList xs
maxList [] = []

maximal_distribution :: Int -> [Int]
maximal_distribution n = maxList [memory!!i | i <- primes n]
    where 
        memory :: [[Int]]
        memory = (map opt [0..n])
        
        opt :: Int -> [Int]
        opt v = (maxList . (filter (\x -> sum x == v))) [
            if not (x `elem` memory!!(v-x)) 
                then memory!!(v - x) ++ [x]
                else []
            | x <- primes v] 
  
        primes :: Int -> [Int]
        primes p = [x | x <- [2..p], is_prime x]

        is_prime :: Int -> Bool
        is_prime p = 
            (length . 
            filter (\x -> and [p `mod` x == 0, x /= p])
            ) [2..p] == 0

main :: IO()
main = do   
    putStrLn $ (show (sum mdist)) ++ ": " ++ (show mdist)
    where
        mdist = maximal_distribution 69
    

