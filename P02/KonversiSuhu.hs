module KonversiSuhu where
-- KonversiSuhu - konversiSuhu(t,k)
-- DEFINISI DAN SPESIFIKASI
konversiSuhu :: Float -> Char -> Float
        -- konversiSuhu(t,k) menerima bilangan real suhu dalam satuan Celcius
        -- dan karakter satuan suhu konversi bernilai ’R’ (Reamur), ’F’ (Fahrenheit), atau ’K’ (Kelvin)
-- REALISASI
konversiSuhu t k | (k == 'R') = 4/5 * t
                 | (k == 'F') = (9/5 * t) + 32
                 | (k == 'K') = t + 273.15
-- CONTOH APLIKASI
-- konversiSuhu 25 ‘R’
