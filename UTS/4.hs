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
isOneElmt :: [Int] -> Bool
-- isOneElmt(L) true jika list of integer l hanya
-- mempunyai satu elemen
-- REALISASI
isEmpty l = null l
isOneElmt l = (length l) == 1

-- FUNGSI TAMBAHAN (agar program dapat dieksekusi)
f :: Int -> Bool
g :: Int -> Bool
f k = if k == 1 then False else null [ x | x <- [2..k-1], (mod k x) == 0]
-- memeriksa bilangan prima
g k = (mod k 3) == 0
-- memeriksa kelipatan 3

-- 4a
-- DEFINISI DAN SPESIFIKASI
hapusIf :: [Int] -> (Int -> Bool) -> (Int -> Bool) -> [Int]
    -- menerima sebuah list of integer li, dan dua buah fungsi f dan g yang mengembalikan boolean
    -- lalu menghapus setiap elemen pada li yang memenuhi f atau g
-- REALISASI
hapusIf li f g = if isEmpty li then []
                 else if (f (head li))||(g (head li)) then hapusIf (tail li) f g
                      else konso (head li) (hapusIf (tail li) f g)
                      
-- 4b
-- (list dan output tidak sama seperti di soal UTS)
-- hapusIf [6,3,5,12,21,6,13,32,18,12,6,11,1,4] (\x->(mod x 2)==0) (\x->(x < 5)||(x > 10))
-- [5]
-- (? lupa soal) hapusIf [1,2,11,12,13,14,15,16,17,18] (\x->(mod x 2)/=0) (\x->(x > 10)&&(x < 20))
-- [2]
-- (? lupa soal) hapusIf [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22] (\x->(mod x 2)=0) (\x->((mod x 3)==0)||((mod x 5)==0))
-- [1,7,11,13,17,19]
