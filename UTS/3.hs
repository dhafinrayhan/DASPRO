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
maks2 :: Int -> Int -> Int
min2 :: Int -> Int -> Int
-- REALISASI
isEmpty l = null l
isOneElmt l = (length l) == 1
maks2 a b = if a>=b then a else b
min2 a b = if a<=b then a else b

-- 3
-- DEFINISI DAN SPESIFIKASI
isElement :: Int -> [Int] -> Bool -- (lupa nama persis fungsinya yang di UTS)
-- menerima sebuah integer e dan sebuah list of integer li
-- mengembalikan true bila e merupakan elemen pada li
intersectLists :: [Int] -> [Int] -> [Int]
-- menerima dua buah list of integer
-- mengembalikan list dengan elemen-elemen yang ada pada kedua list tersebut
-- (urutan seperti list pertama)
maksminList :: [Int] -> (Int,Int)
-- menerima sebuah list of integer
-- mengembalikan tuple berisi bilangan terbesar dan bilangan terkecil pada list
splitListPivot :: [Int] -> ([Int],[Int],Int)
-- menerima sebuah list of integer
-- membagi list menjadi dua,
-- list pertama berisi bilangan yang kurang dari atau sama dengan bilangan Pivot
-- list kedua berisi bilangan yang lebih dari bilangan Pivot
-- bilangan Pivot adalah elemen terakhir dari list
   
-- REALISASI
isElement e li = if isEmpty li then False -- Basis
                else if (head li) == e then True -- Basis
                     else isElement e (tail li) -- Rekurens

intersectLists l1 l2 = if (isEmpty l1)||(isEmpty l2) then [] -- Basis
                       else if isElement (head l1) l2 then konso (head l1) (intersectLists (tail l1) l2) -- Rekurens
                            else intersectLists (tail l1) l2 -- Rekurens
                               
maksminList li = if isOneElmt li then (head li,head li) -- Basis
                 else let (m,n) = maksminList (tail li) in -- Rekurens
                          (maks2 m (head li),min2 n (head li))
                          
splitListPivot li = if isOneElmt li then ([(head li)],[],(last li)) -- Basis
                    else let (m,n,o) = splitListPivot (tail li) in -- Rekurens
                             if (head li) <= o then (konsDot m (head li),n,o)
                             else (m,konsDot n (head li),o)
