module CountEvenDigits where
-- CountEvenDigits - countEvenDigits(n)
-- DEFINISI DAN SPESIFIKASI
countEvenDigits :: Int -> Int
    -- countEvenDigits n menghasilkan banyaknya digit n yang merupakan bilangan genap
    -- catatan: 0 dianggap genap
-- REALISASI
countEvenDigits n = if n==0 then 1
                    else if (mod n 2)==0 then
                        if n<10 then 1
                        else 1+(countEvenDigits (div n 10))
                    else
                        if n<10 then 0
                        else (countEvenDigits (div n 10))
