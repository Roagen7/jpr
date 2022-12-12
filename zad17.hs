explen :: Int -> Int
explen n = expansion 2 n []
    where
        expansion :: Int -> Int -> [Int] -> Int
        expansion num den li  -- rozwinięcie póki nie zaczyna się powtarzać
            | or[num == 0, num == den] = 0
            | num `elem` li = (length li) - (positionInSequence num li)
            | num * 2 >= den = expansion (num * 2-den) den (li ++ [num])
            | otherwise = expansion (num * 2) den (li ++ [num])
        positionInSequence :: Int -> [Int] -> Int
        positionInSequence n (x:xs) =  -- wyszukaj pierwszą liczbę która zaczyna powtarzanie
            if n == x
                then 0
                else 1 + positionInSequence n xs
        positionInSequence n [] = -1

output :: Int -> String
output n = "Maksymalny okres to: " ++ show md ++ ", dla liczby: " ++ (
    foldl (\x y -> x ++ fst y ++ " ") "".
    filter (\x -> snd x == md) -- bierzemy wszystkie wyniki i wypisujemy je
    ) decompositionList
    where 
        maxDecomposition :: [(String, Int)] -> Int
        maxDecomposition (x:xs) = max (snd x) (maxDecomposition xs)
        maxDecomposition [] = 0

        md :: Int
        md = maxDecomposition decompositionList

        decompositionList :: [(String, Int)]
        decompositionList = map (\x -> ("1/" ++ show x, explen x)) [2..n]

main :: IO()
main = do   
    putStrLn "Podaj liczbe:"
    num <- getLine
    print (output (read num :: Int) )
        
-- dla 18: okres 12, liczba 1/13