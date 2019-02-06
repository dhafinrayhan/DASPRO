module TesSyarat where
-- TesSyarat - tesSyarat(t,b)
-- DEFINISI DAN SPESIFIKASI
tesSyarat :: Float -> Float -> Int
        -- menerima data IP mahasiswa ip dalam bilangan real dan pendapatan orang tua pot dalam jutaan bilangan real
        -- menentukan beasiswa yang berhak didapatkan oleh mahasiswa dengan ketentuan:
        -- Mahasiswa dengan IP >= 3.5 berhak atas beasiswa kategori 4.
        -- Beasiswa kategori 1 diberikan kepada mereka yang pendapatan orang tuanya < 1 juta rupiah dan IP-nya < 3.5.
        -- Jika orang tua mahasiswa memiliki pendapatan >= 1 juta rupiah, tetapi masih < 5 juta rupiah dan IP mahasiwa < 3.5:
            -- Jika IP-nya >= 2.0, maka berhak atas beasiswa kategori 3.
            -- Jika IP-nya < 2.0, maka berhak atas beasiswa kategori  2.
        -- Yang tidak masuk kategori di atas, tidak berhak atas beasiswa kategori mana pun. Dalam hal ini, untuk yang bersangkutan diberikan kategori khusus yaitu 0
-- REALISASI
tesSyarat ip pot = if (ip >= 3.5) then 4
                   else if (pot < 1) then 1
                   else if (pot < 5) then
                       if (ip >= 2) then 3
                       else 2
                   else 0
-- CONTOH APLIKASI
-- tesSyarat 3.51 1.5
