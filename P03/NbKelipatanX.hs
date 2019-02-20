module NbKelipatanX where
-- NbKelipatanX - nbKelipatanX(m,n,x)
-- DEFINISI DAN SPESIFIKASI
nbKelipatanX :: Int -> Int -> Int -> Int
    -- menerima masukan tiga buah integer m, n, dan x
    -- lalu menghasilkan banyaknya bilangan kelipatan x dari m sampai n
-- REALISASI
nbKelipatanX m n x = if (mod m x)==0 then
                         if m==n then 1 -- Basis
                         else 1+(nbKelipatanX (m+1) n x) -- Rekurens
                     else
                         if m==n then 0 -- Basis
                         else (nbKelipatanX (m+1) n x) -- Rekurens
