unit uType;
{ Unit khusus menyimpan tipe bentukan dan
  fungsi-fungsi yang berkaitan dengan tipe }


interface
    { KAMUS }
    const
        NMax = 100; { ukuran maksimum array }
        errorMsg = 'Perintah tidak ada / tidak tersedia untuk akun Anda.';
    type
        tanggal = record
            d, m, y : integer;
        end;
        Buku = record
            ID_Buku, Judul_Buku, Author, Kategori : string;
            Jumlah_Buku, Tahun_Penerbit : integer;
        end;
        User = record
            Nama, Alamat, Username, Password, Role : string;
        end;
        Peminjaman = record
            ID_Buku, Username : string;
            Tanggal_Peminjaman, Tanggal_Batas_Pengembalian : tanggal;
            Status_Pengembalian : boolean;
        end;
        Pengembalian = record
            ID_Buku, Username : string;
            Tanggal_Pengembalian : tanggal;
        end;
        Kehilangan = record
            ID_Buku_Hilang, Username : string;
            Tanggal_Laporan : tanggal;
        end;
        bukuArr = record
            Tab : array[0..(NMax-1)] of Buku;
            Neff : integer;
        end;
        userArr = record
            Tab : array[0..(NMax-1)] of User;
            Neff : integer;
        end;
        peminjamanArr = record
            Tab : array[0..(NMax-1)] of Peminjaman;
            Neff : integer;
        end;
        pengembalianArr = record
            Tab : array[0..(NMax-1)] of Pengembalian;
            Neff : integer;
        end;
        kehilanganArr = record
            Tab : array[0..(NMax-1)] of Kehilangan;
            Neff : integer;
        end;
        strArr = record
            Tab : array[0..(NMax-1)] of string;
            Neff : integer;
        end;

    { FUNGSI DAN PROSEDUR }
    function zPad (x, len : integer) : string;
    function tglToStr (tgl : tanggal) : string;
    function strToTgl (s : string) : tanggal;
    function intToStr (i : integer) : string;
    function strToInt (s : string) : integer;
    function boolToStr (b : boolean) : string;
    function strToBool (s : string) : boolean;
    procedure extend (var arr : bukuArr);
    procedure extend (var arr : userArr);
    procedure extend (var arr : peminjamanArr);
    procedure extend (var arr : pengembalianArr);
    procedure extend (var arr : kehilanganArr);


implementation
    function p10 (p : integer) : integer;
    { Mengembalikan nilai 10^p }
    { KAMUS LOKAL }
    var
        res, i : integer;
    { ALGORITMA LOKAL }
    begin
        res := 1; i := 0; { inisialisasi }
        while i < p do
        begin
            res := res * 10;
            i := i + 1;
        end;
        p10 := res;
    end;

    function strToIntSingle (s : string) : integer;
    { Mengubah string satu digit ke dalam bentuk integer }
    { ALGORITMA LOKAL }
    begin
        case s of
            '0' : begin
                strToIntSingle := 0;
            end;
            '1' : begin
                strToIntSingle := 1;
            end;
            '2' : begin
                strToIntSingle := 2;
            end;
            '3' : begin
                strToIntSingle := 3;
            end;
            '4' : begin
                strToIntSingle := 4;
            end;
            '5' : begin
                strToIntSingle := 5;
            end;
            '6' : begin
                strToIntSingle := 6;
            end;
            '7' : begin
                strToIntSingle := 7;
            end;
            '8' : begin
                strToIntSingle := 8;
            end;
            '9' : begin
                strToIntSingle := 9;
            end;
        end;
    end;

    function zPad (x, len : integer) : string;
    { Mengembalikan bentuk string dari x dengan leading zero(s) }
    { KAMUS LOKAL }
    var
        padded : string;
        need, i : integer;
    { ALGORITMA }
    begin
        padded := intToStr(x);
        need := len-length(padded); { 0 yang dibutuhkan }
        if need > 0 then
        begin
            for i := 1 to need do
            begin
                padded := '0' + padded;
            end;
        end;
        zPad := padded;
    end;

    function tglToStr (tgl : tanggal) : string;
    { Mengubah type tanggal menjadi type string sesuai yang diinginkan }
    { ALGORITMA LOKAL }
    begin
        tglToStr := zPad(tgl.d, 2) + '/' + zPad(tgl.m, 2) + '/' + zPad(tgl.y, 4);
    end;

    function strToTgl (s : string) : tanggal;
    { Mengubah type string menjadi type tanggal }
    { ALGORITMA LOKAL }
    begin
        strToTgl.d := strToInt(s[1] + s[2]);
        strToTgl.m := strToInt(s[4] + s[5]);
        strToTgl.y := strToInt(s[7] + s[8] + s[9] + s[10]);
    end;

    function intToStr (i : integer) : string;
    { Mengubah type integer menjadi type string }
    { ASUMSI: Program di-compile dengan FPC (int 16-bit) }
    { KAMUS LOKAL }
    var
        s : string;
        ref : array[0..9] of string;
    { ALGORITMA LOKAL }
    begin
        { Mengisi array referensi }
        ref[0] := '0'; ref[1] := '1'; ref[2] := '2'; ref[3] := '3'; ref[4] := '4';
        ref[5] := '5'; ref[6] := '6'; ref[7] := '7'; ref[8] := '8'; ref[9] := '9';
        { inisialisasi dengan kondisi }
        if i < 0 then
        begin
            s := '-';
            i := -i;
        end else
        begin
            s := '';
        end;
        { Mengonversi tiap digit menjadi string dengan bantuan array referensi }
        if i >= 10000 then
        begin
            s := s + ref[i div 10000];
        end;
        if i >= 1000 then
        begin
            s := s + ref[(i mod 10000) div 1000];
        end;
        if i >= 100 then
        begin
            s := s + ref[(i mod 1000) div 100];
        end;
        if i >= 10 then
        begin
            s := s + ref[(i mod 100) div 10];
        end;
        s := s + ref[i mod 10];
        intToStr := s;
    end;

    function strToInt (s : string) : integer;
    { Mengubah type string menjadi type integer }
    { ASUMSI: Program di-compile dengan FPC (int 16-bit) }
    { KAMUS LOKAL }
    var
        i, j, mode, len : integer; { mode: 0 untuk bil. nol atau bil. positif,
                                   1 untuk bil. negatif }
    begin
        i := 0; { inisialisasi }
        if s[1] = '-' then
        begin
            mode := 1;
        end else
        begin
            mode := 0;
        end;
        len := length(s)-mode;
        for j := 1 to len do
        begin
            i := i + strToIntSingle(s[j+mode]) * p10(len-j);
        end;
        strToInt := i * (1-2*mode); { mengalikan return dengan 1 atau -1 }
    end;

    function boolToStr (b : boolean) : string;
    { Mengubah type boolean menjadi type string }
    { ALGORITMA LOKAL }
    begin
        if b then
        begin
            boolToStr := 'true';
        end else { not b }
        begin
            boolToStr := 'false';
        end;
    end;

    function strToBool (s : string) : boolean;
    { Mengubah type string menjadi type boolean }
    { ALGORITMA LOKAL }
    begin
        if s = 'true' then
        begin
            strToBool := true;
        end else { s = 'false' }
        begin
            strToBool := false;
        end;
    end;

    procedure extend (var arr : bukuArr);
    { I.S. : sebuah array of Buku }
    { F.S. : Neff dari array of Buku bertambah 1 }
    { ALGORITMA LOKAL }
    begin
        arr.Neff := arr.Neff + 1;
    end;

    procedure extend (var arr : userArr);
    { I.S. : sebuah array of User }
    { F.S. : Neff dari array of User bertambah 1 }
    { ALGORITMA LOKAL }
    begin
        arr.Neff := arr.Neff + 1;
    end;

    procedure extend (var arr : peminjamanArr);
    { I.S. : sebuah array of Peminjaman }
    { F.S. : Neff dari array of Peminjaman bertambah 1 }
    { ALGORITMA LOKAL }
    begin
        arr.Neff := arr.Neff + 1;
    end;

    procedure extend (var arr : pengembalianArr);
    { I.S. : sebuah array of Pengembalian }
    { F.S. : Neff dari array of Pengembalian bertambah 1 }
    { ALGORITMA LOKAL }
    begin
        arr.Neff := arr.Neff + 1;
    end;

    procedure extend (var arr : kehilanganArr);
    { I.S. : sebuah array of Kehilangan }
    { F.S. : Neff dari array of Kehilangan bertambah 1 }
    { ALGORITMA LOKAL }
    begin
        arr.Neff := arr.Neff + 1;
    end;

end.
