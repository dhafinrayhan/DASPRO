-- 2a
-- DEFINISI DAN SPESIFIKASI
isTahunKabisat :: Int -> Bool
    -- menerima masukan integer x
    -- lalu mengembalikan true bila x merupakan tahun kabisat
-- REALISASI
isTahunKabisat x = if ((mod x 4)==0)&&((mod x 100)/=0)||((mod x 400)==0) then True
                   else False
-- CONTOH APLIKASI
-- isTahunKabisat 2100
-- False

-- 2b
-- DEFINISI DAN SPESIFIKASI
hitungTahunKabisat :: Int -> Int -> Int
    -- menerima 2 buah integer a dan b
    -- lalu mengembalikan banyaknya tahun kabisat dari a sampai b
-- REALISASI
hitungTahunKabisat a b = if a > b then 0 -- Basis
                         else (if (isTahunKabisat a) then 1 else 0) + (hitungTahunKabisat (a+1) b) -- Rekurens
