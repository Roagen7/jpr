explen :: Int -> Int
explen n = expansion 2 n []
    where
        expansion :: Int -> Int -> [Int] -> Int
        expansion num den li = 
            if or[num == 0, num == den]
                then 0
            else if num `elem` li
                then (length li) - (positionInSequence num li)
            else if num * 2 >= den
                then  (expansion (num * 2-den) den (li ++ [num]))
            else (expansion (num * 2) den (li ++ [num]))
        positionInSequence :: Int -> [Int] -> Int
        positionInSequence n (x:xs) = 
            if n == x
                then 0
                else 1 + positionInSequence n xs
        positionInSequence n [] = -1

output :: Int -> String
output n = "max period=" ++ (show md) ++ " for " ++ (
    (foldl (\x y -> x ++ (fst y) ++ " ") "").
    (filter (\x -> (snd x) == md))
    ) decompositionList
    where 
        maxDecomposition :: [(String, Int)] -> Int
        maxDecomposition (x:xs) = max (snd x) (maxDecomposition xs)
        maxDecomposition [] = 0

        md :: Int
        md = maxDecomposition decompositionList

        decompositionList :: [(String, Int)]
        decompositionList = map (\x -> ("1/" ++ (show x), explen x)) [2..n]

main :: IO()
main = do   
    putStrLn $ show (output 18)
        