module MaxOdd where
-- DEFINISI DAN SPESIFIKASI LIST
{- type List of Int: [ ] atau [e o List] atau [List o e]  
   Definisi type List of Int
   Basis: List of Int kosong adalah list of Int 
   Rekurens: 
   List tidak kosong dibuat dengan menambahkan sebuah elemen bertype Int di awal 
   sebuah list atau
   dibuat dengan menambahkan sebuah elemen bertype Int di akhir sebuah list -}

-- DEFINISI DAN SPESIFIKASI KONSTRUKTOR
konso :: Int -> [Int] -> [Int]
{- konso e li menghasilkan sebuah list of integer dari e (sebuah integer) dan li 
   (list of integer), dengan e sebagai elemen pertama: e o li -> li' -}
-- REALISASI
konso e li = [e] ++ li

konsDot :: [Int] -> Int -> [Int]
{- konsDot li e menghasilkan sebuah list of integer dari li (list of integer) dan 
   e (sebuah integer), dengan e sebagai elemen terakhir: li o e -> li' -}
-- REALISASI
konsDot li e = li ++ [e]

-- DEFINISI DAN SPESIFIKASI SELEKTOR
-- head :: [Int] -> Int
-- head l menghasilkan elemen pertama list l, l tidak kosong

-- tail :: [Int] -> [Int]
-- tail l menghasilkan list tanpa elemen pertama list l, l tidak kosong

-- last :: [Int] -> Int
-- last l menghasilkan elemen terakhir list l, l tidak kosong

-- init :: [Int] -> [Int]
-- init l menghasilkan list tanpa elemen terakhir list l, l tidak kosong

-- DEFINISI DAN SPESIFIKASI PREDIKAT
isEmpty :: [Int] -> Bool
-- isEmpty l  true jika list of integer l kosong
-- REALISASI
isEmpty l = null l
-- MaxOdd - maxOdd(l)
-- DEFINISI DAN SPESIFIKASI
maxOdd :: [Int] -> (Int,Int)
    -- menerima input list of integer
    -- lalu menghasilkan sebuah tuple dari bilangan ganjil yang paling sering muncul dan frekuensi kemunculannya
countElement :: [Int] -> Int -> Int
    -- menerima input list of integer l dan sebuah integer n
    -- mengembalikan banyaknya kemunculan n di l
maxOddRecc :: [Int] -> Int -> Int -> Int
    -- menerima input list of integer l dan sebuah integer n
    -- mengembalikan integer pada l yang ganjil dan paling sering muncul
-- REALISASI
countElement l n = if (isEmpty l) then 0 -- Basis
                   else
                       if (head l)==n then 1+(countElement (tail l) n) -- Rekurens
                       else (countElement (tail l) n) -- Rekurens
maxOddRecc l n nN = if (isEmpty l) then n -- Basis
                    else if ((mod (head l) 2)==1)&&((countElement l (head l))>n) then -- Rekurens
                        (maxOddRecc (tail l) (countElement l (head l)) (head l))
                    else (maxOddRecc (tail l) nN n) -- Rekurens
maxOdd l = let
               mO = (maxOddRecc l (-1) 0)
           in
               (mO,(countElement l mO))
