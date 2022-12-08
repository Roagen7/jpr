subsets :: Eq a => [a] -> [[a]]
subsets (x:xs) = (ss) ++ (map (\subset -> x:subset) ss)
    where 
        ss = subsets xs
subsets [] = [[]]

main :: IO()
main = do   
    putStrLn $ show (subsets [1,2,3])
