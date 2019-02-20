module CountStartEnd where
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
-- CountStartEnd - countStartEnd(l,n)
-- DEFINISI DAN SPESIFIKASI
countStartEnd :: [Int] -> Int -> Int
countElements :: [Int] -> Int
sumElements :: [Int] -> Int
getNew :: [Int] -> Int -> Int
    -- countStartEnd l n mengembalikan hasil penjumlahan n elemen pertama dan terakhir dari l
    -- l adalah list integer yang akan dihitung elemennya.
    -- n adalah berapa elemen dari awal dan akhir yang akan dihitung
    -- prekondisi: n >= 0
-- REALISASI
countElements l | (isEmpty l) = 0
                | otherwise = 1+(countElements (tail l))
sumElements l | (isEmpty l) = 0
              | otherwise = (head l)+(sumElements (tail l))
getNew l n | n==0 = []
           | otherwise = (getNew (konso (head l) (tail l)) (n-1)
countStartEnd l n | n==0 = 0
                  | (2*n)>(countElements l) = (sumElements l)
                  | otherwise = (sumElements (getNew 
