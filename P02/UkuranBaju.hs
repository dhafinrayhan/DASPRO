module UkuranBaju where
-- UkuranBaju - ukuranBaju(t,b)
-- DEFINISI DAN SPESIFIKASI
ukuranBaju :: Int -> Int -> Int
        -- menerima data tinggi badan t dan berat badan b
        -- lalu menentukan ukuran baju yang sesuai ketentuan:
        -- Baju ukuran M diberikan kepada mereka yang tingginya <= 150 cm (berapa pun berat badannya).
        -- Baju ukuran XL diberikan ke mereka yang tingginya > 170 cm dan berat badannya > 60 kg tapi masih <= 80 kg.
        -- Jika seseorang tingginya > 150 cm, tapi masih <= 170 cm dan berat badannya <= 80 kg, maka orang ini mendapatkan baju ukuran L. Kalau berat badannya > 80 kg, dia mendapatkan baju ukuran XL.
        -- Orang yang tingginya > 170 cm dan berat badannya <= 60 kg, mendapat baju ukuran L.
        -- Karena keterbatasan pembuat kaos, tidak ada kaos lain selain M, L, dan XL sehingga untuk yang tidak memenuhi kategori di atas tidak akan mendapatkan kaos. Dalam hal ini, untuk yang bersangkutan diberikan kategori khusus yaitu 4.
-- REALISASI
ukuranBaju t b = if (t <= 150) then 1
                 else if (t <= 170) then
                     if (b <= 80) then 2
                     else 3
                 else -- (t > 170)
                     if (b <= 60) then 2
                     else if (b <=80) then 3
                     else 4
-- CONTOH APLIKASI
-- ukuranBaju 160 75
