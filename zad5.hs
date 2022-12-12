subsets :: Eq a => [a] -> [[a]]
subsets (x:xs) = ss ++ map (x :) ss
    where 
        ss = subsets xs
subsets [] = [[]]

main :: IO()
main = do   
    print (subsets [1,2,3])
