module LuasTrapesium where
-- LuasTrapesium - luasTrapesium(t,s1,s2)
-- DEFINISI DAN SPESIFIKASI
luasTrapesium :: Float -> Float -> Float -> Float
        -- luasTrapesium(t,s1,s2) menghitung luas trapesium
        -- dari tinggi t, sisi sejajar 1 s1, dan sisi sejajar 2 s2,
        -- masing-masing bilangan real
-- REALISASI
luasTrapesium t s1 s2 = 0.5 * t * (s1 + s2)
-- CONTOH APLIKASI
-- luasTrapesium 2 4 3
