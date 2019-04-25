unit CSVtools;


interface
    uses uType;
    { FUNGSI DAN PROSEDUR }
    procedure ctWrite (arrBuku : bukuArr; filename : string);
    procedure ctWrite (arrUser : userArr; filename : string);
    procedure ctWrite (arrPeminjaman : peminjamanArr; filename : string);
    procedure ctWrite (arrPengembalian : pengembalianArr; filename : string);
    procedure ctWrite (arrKehilangan : kehilanganArr; filename : string);
    procedure ctRead (var arrBuku : bukuArr; filename : string);
    procedure ctRead (var arrUser : userArr; filename : string);
    procedure ctRead (var arrPeminjaman : peminjamanArr; filename : string);
    procedure ctRead (var arrPengembalian : pengembalianArr; filename : string);
    procedure ctRead (var arrKehilangan : kehilanganArr; filename : string);



implementation
    { KAMUS }
    const
        dlmt : string = ',';

    { FUNGSI DAN PROSEDUR }
    function ctLen (filename : string) : integer;
    { Mengembalikan sebuah integer berupa banyaknya baris pada file CSV }
    { KAMUS LOKAL }
    var
        tf : TextFile;
        i : integer;
    { ALGORITMA LOKAL }
    begin
        i := 0; { inisialisasi }
        Assign(tf, filename); { asosiasi variabel 'tf' dengan file CSV }
        reset(tf); { membuka file untuk dibaca }
        { Menghitung banyaknya baris pada file CSV }
        while not eof(tf) do
        begin
            readln(tf);
            i := i + 1;
        end;
        Close(tf); { menutup file CSV }
        ctLen := i;
    end;

    procedure ctJoin (var joined : string; arr : strArr; len : integer);
    { Menerima parameter sebuah array of string
      lalu menggabungkan elemen-elemennya menjadi satu string
      dipisah dengan delimiter }
    { KAMUS LOKAL }
    var
        i : integer;
    { ALGORITMA LOKAL }
    begin
        joined := arr.Tab[0];
        for i := 1 to len-1 do
        begin
            joined := joined + dlmt + arr.Tab[i];
        end;
    end;

    procedure ctSplit (var arr : strArr; joined : string; arrlen : integer);
    { Menerima parameter sebuah string
      lalu memisahkannya menjadi elemen-elemen sebuah array of string
      berdasarkan delimiter }
    { KAMUS LOKAL }
    var
        inp : string;
        len, i, j : integer;
    { ALGORITMA LOKAL }
    begin
        len := length(joined);
        arr.Neff := arrlen;
        j := 0;
        inp := '';
        for i := 1 to len do
        begin
            if joined[i] = dlmt then
            begin
                arr.Tab[j] := inp;
                j := j + 1;
                inp := '';
            end else
            begin
                inp := inp + joined[i];
            end;
        end;
        arr.Tab[j] := inp;
    end;

    procedure ctWriter (arr : strArr; len : integer; filename : string);
    { I.S. : arr        : sebuah array yang berisi data yang akan ditulis ke file CSV
             len        : panjang array 'arr'
             filename   : nama file CSV yang akan dituliskan data ke dalamnya }
    { F.S. : file CSV 'filename' sudah berisi data pada array 'arr' }
    { KAMUS LOKAL }
    var
        tf : TextFile;
        i : integer;
    { ALGORITMA LOKAL }
    begin
        Assign(tf, filename);
        rewrite(tf); { menyiapkan file untuk ditulis secara keseluruhan }
        { Memasukkan satu-persatu elemen 'arr' untuk tiap baris pada file }
        for i := 0 to len-1 do
        begin
            writeln(tf, arr.Tab[i]);
        end;
        Close(tf);
    end;

    procedure ctReader (var arr : strArr; filename : string);
    { I.S. : arr        : sebuah array yang akan diisi data dari file CSV
             len        : panjang array 'arr'
             filename   : nama file CSV yang akan ditulis isinya ke array 'arr' }
    { F.S. : array 'arr' sudah berisi data dari file CSV 'filename' }
    { KAMUS LOKAL }
    var
        tf : TextFile;
        i, len : integer;
    { ALGORITMA LOKAL }
    begin
        len := ctLen(filename);
        arr.Neff := len;
        Assign(tf, filename);
        reset(tf); { membuka file untuk dibaca }
        { Membaca dan menuliskan data ke array sampai baris terakhir file CSV }
        for i := 0 to len-1 do
        begin
            readln(tf, arr.Tab[i]);
        end;
        Close(tf);
    end;

    procedure ctWrite (arrBuku : bukuArr; filename : string);
    { Mengonversi bukuArr menjadi array of string dengan ctJoin
      lalu menuliskannya ke file CSV dengan ctWriter }
    var
        arr, buffer : strArr;
        len, i : integer;
    begin
        len := arrBuku.Neff; { banyaknya data pada array }
        { Mengonversi satu per satu elemen pada arrBuku ke arr }
        arr.Neff := len+1;
        arr.Tab[0] := 'ID_Buku,Judul_Buku,Author,Jumlah_Buku,Tahun_Penerbit,Kategori';
        buffer.Neff := 6;
        for i := 0 to len-1 do
        begin
            buffer.Tab[0] := arrBuku.Tab[i].ID_Buku;
            buffer.Tab[1] := arrBuku.Tab[i].Judul_Buku;
            buffer.Tab[2] := arrBuku.Tab[i].Author;
            buffer.Tab[3] := intToStr(arrBuku.Tab[i].Jumlah_Buku);
            buffer.Tab[4] := intToStr(arrBuku.Tab[i].Tahun_Penerbit);
            buffer.Tab[5] := arrBuku.Tab[i].Kategori;
            ctJoin(arr.Tab[i+1], buffer, 6);
        end;
        { Menggunakan ctWriter untuk menulis data ke file CSV }
        ctWriter(arr, len+1, filename);
    end;

    procedure ctWrite (arrUser : userArr; filename : string);
    { Mengonversi userArr menjadi array of string dengan ctJoin
      lalu menuliskannya ke file CSV dengan ctWriter }
    var
        arr, buffer : strArr;
        len, i : integer;
    begin
        len := arrUser.Neff; { banyaknya data pada array }
        { Mengonversi satu per satu elemen pada arrUser ke arr }
        arr.Neff := len+1;
        arr.Tab[0] := 'Nama,Alamat,Username,Password,Role';
        buffer.Neff := 5;
        for i := 0 to len-1 do
        begin
            buffer.Tab[0] := arrUser.Tab[i].Nama;
            buffer.Tab[1] := arrUser.Tab[i].Alamat;
            buffer.Tab[2] := arrUser.Tab[i].Username;
            buffer.Tab[3] := arrUser.Tab[i].Password;
            buffer.Tab[4] := arrUser.Tab[i].Role;
            ctJoin(arr.Tab[i+1], buffer, 5);
        end;
        { Menggunakan ctWriter untuk menulis data ke file CSV }
        ctWriter(arr, len+1, filename);
    end;

    procedure ctWrite (arrPeminjaman : peminjamanArr; filename : string);
    { Mengonversi peminjamanArr menjadi array of string dengan ctJoin
      lalu menuliskannya ke file CSV dengan ctWriter }
    var
        arr, buffer : strArr;
        len, i : integer;
    begin
        len := arrPeminjaman.Neff; { banyaknya data pada array }
        { Mengonversi satu per satu elemen pada arrPeminjaman ke arr }
        arr.Neff := len+1;
        arr.Tab[0] := 'Username,ID_Buku,Tanggal_Peminjaman,Tanggal_Batas_Pengembalian,Status_Pengembalian';
        buffer.Neff := 5;
        for i := 0 to len-1 do
        begin
            buffer.Tab[0] := arrPeminjaman.Tab[i].Username;
            buffer.Tab[1] := arrPeminjaman.Tab[i].ID_Buku;
            buffer.Tab[2] := tglToStr(arrPeminjaman.Tab[i].Tanggal_Peminjaman);
            buffer.Tab[3] := tglToStr(arrPeminjaman.Tab[i].Tanggal_Batas_Pengembalian);
            buffer.Tab[4] := boolToStr(arrPeminjaman.Tab[i].Status_Pengembalian);
            ctJoin(arr.Tab[i+1], buffer, 5);
        end;
        { Menggunakan ctWriter untuk menulis data ke file CSV }
        ctWriter(arr, len+1, filename);
    end;

    procedure ctWrite (arrPengembalian : pengembalianArr; filename : string);
    { Mengonversi pengembalianArr menjadi array of string dengan ctJoin
      lalu menuliskannya ke file CSV dengan ctWriter }
    var
        arr, buffer : strArr;
        len, i : integer;
    begin
        len := arrPengembalian.Neff; { banyaknya data pada array }
        { Mengonversi satu per satu elemen pada arrPengembalian ke arr }
        arr.Neff := len+1;
        arr.Tab[0] := 'Username,ID_Buku,Tanggal_Pengembalian';
        buffer.Neff := 3;
        for i := 0 to len-1 do
        begin
            buffer.Tab[0] := arrPengembalian.Tab[i].Username;
            buffer.Tab[1] := arrPengembalian.Tab[i].ID_Buku;
            buffer.Tab[2] := tglToStr(arrPengembalian.Tab[i].Tanggal_Pengembalian);
            ctJoin(arr.Tab[i+1], buffer, 3);
        end;
        { Menggunakan ctWriter untuk menulis data ke file CSV }
        ctWriter(arr, len+1, filename);
    end;

    procedure ctWrite (arrKehilangan : kehilanganArr; filename : string);
    { Mengonversi kehilanganArr menjadi array of string dengan ctJoin
      lalu menuliskannya ke file CSV dengan ctWriter }
    var
        arr, buffer : strArr;
        len, i : integer;
    begin
        len := arrKehilangan.Neff; { banyaknya data pada array }
        { Mengonversi satu per satu elemen pada arrKehilangan ke arr }
        arr.Neff := len+1;
        arr.Tab[0] := 'Username,ID_Buku_Hilang,Tanggal_Laporan';
        buffer.Neff := 3;
        for i := 0 to len-1 do
        begin
            buffer.Tab[0] := arrKehilangan.Tab[i].Username;
            buffer.Tab[1] := arrKehilangan.Tab[i].ID_Buku_Hilang;
            buffer.Tab[2] := tglToStr(arrKehilangan.Tab[i].Tanggal_Laporan);
            ctJoin(arr.Tab[i+1], buffer, 3);
        end;
        { Menggunakan ctWriter untuk menulis data ke file CSV }
        ctWriter(arr, len+1, filename);
    end;

    procedure ctRead (var arrBuku : bukuArr; filename : string);
    { Mengonversi string pada file CSV menjadi array of string dengan ctSplit
      lalu memasukkannya ke sebuah bukuArr }
    const
        ctgr = 6;
    var
        arr, buffer: strArr;
        len, i : integer;
    { ALGORITMA LOKAL }
    begin
        { Menggunakan ctReader untuk membaca data dari file CSV }
        ctReader(arr, filename);
        len := arr.Neff-1; { banyaknya data pada file CSV }
        arrBuku.Neff := len;
        buffer.Neff := ctgr;
        for i := 0 to len-1 do
        begin
            ctSplit(buffer, arr.Tab[i+1], ctgr);
            arrBuku.Tab[i].ID_Buku := buffer.Tab[0];
            arrBuku.Tab[i].Judul_Buku := buffer.Tab[1];
            arrBuku.Tab[i].Author := buffer.Tab[2];
            arrBuku.Tab[i].Jumlah_Buku := strToInt(buffer.Tab[3]);
            arrBuku.Tab[i].Tahun_Penerbit := strToInt(buffer.Tab[4]);
            arrBuku.Tab[i].Kategori := buffer.Tab[5];
        end;
    end;

    procedure ctRead (var arrUser : userArr; filename : string);
    { Mengonversi string pada file CSV menjadi array of string dengan ctSplit
      lalu memasukkannya ke sebuah userArr }
    const
        ctgr = 5;
    var
        arr, buffer : strArr;
        len, i : integer;
    { ALGORITMA LOKAL }
    begin
        { Menggunakan ctReader untuk membaca data dari file CSV }
        ctReader(arr, filename);
        len := arr.Neff-1; { banyaknya data pada file CSV }
        arrUser.Neff := len;
        buffer.Neff := ctgr;
        for i := 0 to len-1 do
        begin
            ctSplit(buffer, arr.Tab[i+1], ctgr);
            arrUser.Tab[i].Nama := buffer.Tab[0];
            arrUser.Tab[i].Alamat := buffer.Tab[1];
            arrUser.Tab[i].Username := buffer.Tab[2];
            arrUser.Tab[i].Password := buffer.Tab[3];
            arrUser.Tab[i].Role := buffer.Tab[4];
        end;
    end;

    procedure ctRead (var arrPeminjaman : peminjamanArr; filename : string);
    { Mengonversi string pada file CSV menjadi array of string dengan ctSplit
      lalu memasukkannya ke sebuah peminjamanArr }
    const
        ctgr = 5;
    var
        arr, buffer: strArr;
        len, i : integer;
    { ALGORITMA LOKAL }
    begin
        { Menggunakan ctReader untuk membaca data dari file CSV }
        ctReader(arr, filename);
        len := arr.Neff-1; { banyaknya data pada file CSV }
        arrPeminjaman.Neff := len;
        buffer.Neff := ctgr;
        for i := 0 to len-1 do
        begin
            ctSplit(buffer, arr.Tab[i+1], ctgr);
            arrPeminjaman.Tab[i].Username := buffer.Tab[0];
            arrPeminjaman.Tab[i].ID_Buku := buffer.Tab[1];
            arrPeminjaman.Tab[i].Tanggal_Peminjaman := strToTgl(buffer.Tab[2]);
            arrPeminjaman.Tab[i].Tanggal_Batas_Pengembalian := strToTgl(buffer.Tab[3]);
            arrPeminjaman.Tab[i].Status_Pengembalian := strToBool(buffer.Tab[4]);
        end;
    end;

    procedure ctRead (var arrPengembalian : pengembalianArr; filename : string);
    { Mengonversi string pada file CSV menjadi array of string dengan ctSplit
      lalu memasukkannya ke sebuah pengembalianArr }
    const
        ctgr = 3;
    var
        arr, buffer : strArr;
        len, i : integer;
    { ALGORITMA LOKAL }
    begin
        { Menggunakan ctReader untuk membaca data dari file CSV }
        ctReader(arr, filename);
        len := arr.Neff-1; { banyaknya data pada file CSV }
        arrPengembalian.Neff := len;
        buffer.Neff := ctgr;
        for i := 0 to len-1 do
        begin
            ctSplit(buffer, arr.Tab[i+1], ctgr);
            arrPengembalian.Tab[i].Username := buffer.Tab[0];
            arrPengembalian.Tab[i].ID_Buku := buffer.Tab[1];
            arrPengembalian.Tab[i].Tanggal_Pengembalian := strToTgl(buffer.Tab[2]);
        end;
    end;

    procedure ctRead (var arrKehilangan : kehilanganArr; filename : string);
    { Mengonversi string pada file CSV menjadi array of string dengan ctSplit
      lalu memasukkannya ke sebuah kehilanganArr }
    const
        ctgr = 3;
    var
        arr, buffer : strArr;
        len, i : integer;
    { ALGORITMA LOKAL }
    begin
        { Menggunakan ctReader untuk membaca data dari file CSV }
        ctReader(arr, filename);
        len := arr.Neff-1; { banyaknya data pada file CSV }
        arrKehilangan.Neff := len;
        buffer.Neff := ctgr;
        for i := 0 to len-1 do
        begin
            ctSplit(buffer, arr.Tab[i+1], ctgr);
            arrKehilangan.Tab[i].Username := buffer.Tab[0];
            arrKehilangan.Tab[i].ID_Buku_Hilang := buffer.Tab[1];
            arrKehilangan.Tab[i].Tanggal_Laporan := strToTgl(buffer.Tab[2]);
        end;
    end;
end.
