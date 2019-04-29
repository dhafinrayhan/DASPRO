{ NIM       : 16518332
  Nama      : Dhafin Rayhan Ahmad
  Tanggal   : 28/04/2019
  Topik     : Sekuensial File
  Deskripsi : Unit data jual yang mengelola file dan menghitung rata-rata }
unit udatajual;
{ Memuat, mengurutkan, menghitung rata-rata, dan menyimpan suatu data penjualan }


{ DEKLARASI TYPE FUNGSI DAN PROSEDUR }

interface

    const
        NMax = 100;

    type
        dataJual  = record
            KdKategori, KDProduk : string;
            Hasil : integer;
        end;
        tabPenjualan = record
            TJual : array[1..NMax] of dataJual;
            Neff : integer;
        end;


    { DEKLARASI FUNGSI DAN PROSEDUR }

    function EOP (rek : dataJual) : boolean;
    { Menghasilkan true jika rek = mark }

    procedure LoadDataJual (filename : string; var T : tabPenjualan);
    { I.S. : filename terdefinisi, T sembarang }
    { F.S. : Tabel T terisi data hasil penjualan dengan data yang dibaca
             dari file dg nama = filename
             T.Neff = 0 jika tidak ada file kosong;
             T diisi dengan seluruh isi file atau sampai T penuh. }


    procedure UrutKategoriAsc (var T : tabPenjualan);
    { I.S. : T terdefinisi; T mungkin kosong }
    { F.S. : Isi tabel T terurut membesar menurut KdKategori. T tetap jika T kosong. }

    procedure HitungRataRata (T : tabPenjualan);
    { I.S. : T terdefinisi; T mungkin kosong }
    { F.S. : Menampilkan KdKategori dan hasil penjualan rata-rata per KdKategori
             yang ada dalam tabel dengan format: <KdKategori>=<rata-rata> }

    procedure SaveDataJual (filename : string; T : tabPenjualan);
    { I.S. : T dan filename terdefinisi; T mungkin kosong }
    { F.S. : Isi tabel T dituliskan pada file dg nama = filename }


{ IMPLEMENTASI FUNGSI DAN PROSEDUR }

implementation

    function EOP (rek : dataJual) : boolean;
    begin
        if (rek.KdKategori = '99999999') and (rek.KDProduk = 'XX9999') and (rek.Hasil = -999) then
        begin
            EOP := true;
        end else
        begin
            EOP := false;
        end;
    end;

    procedure LoadDataJual (filename : string; var T : tabPenjualan);
    var
        f : file of dataJual;
        item : dataJual;
    begin
        T.Neff := 0; { Inisialisasi }
        { Skema Dasar Pembacaan File Tanpa EOF - While-do }
        assign(f, filename);
        reset(f);
        read(f, item); { First-Elmt }
        while not(EOP(item)) and (T.Neff < NMax) do
        begin
            T.Neff := T.Neff + 1;
            T.TJual[T.Neff] := item;
            read(f, item);
        end;
        close(f);
    end;

    procedure UrutKategoriAsc (var T : tabPenjualan);
    { Menggunakan Selection Sort }
    var
        tmp : dataJual;
        imin, i, j : integer;
    begin
        for i := 1 to T.Neff-1 do
        begin
            { Mencari index minimum }
            imin := i;
            for j := i+1 to T.Neff do
            begin
                if T.TJual[j].KdKategori < T.TJual[imin].KdKategori then
                begin
                    imin := j;
                end;
            end;
            { Tukar }
            tmp := T.TJual[imin];
            T.TJual[imin] := T.TJual[i];
            T.TJual[i] := tmp;
        end;
    end;

    procedure HitungRataRata (T : tabPenjualan);
    { Menggunakan Skema Konsolidasi Tanpa Separator }
    var
        i, jumlah, totalHasil : integer;
        CurKdKat : string;
    begin
        if T.Neff = 0 then
        begin
            writeln('Data kosong');
        end else
        begin
            i := 1;
            while i <= T.Neff do
            begin
                CurKdKat := T.TJual[i].KdKategori;
                totalHasil := 0;
                jumlah := 0;
                repeat
                    totalHasil := totalHasil + T.TJual[i].Hasil;
                    jumlah := jumlah + 1;
                    i := i + 1;
                until (T.TJual[i].KdKategori <> CurKdKat);
                writeln(CurKdKat, '=', round(totalHasil/jumlah));
            end;
        end;
    end;

    procedure SaveDataJual (filename : string; T : tabPenjualan);
    var
        i : integer;
        f : file of dataJual;
        item : dataJual;
    begin
        assign(f, filename);
        rewrite(f);
        i := 1;
        while i <= T.Neff do
        begin
            item := T.TJual[i];
            write(f, item);
            i := i + 1;
        end;
        { Menulis mark }
        item.KdKategori := '99999999';
        item.KDProduk := 'XX9999';
        item.Hasil := -999;
        write(f, item);
        close(f);
    end;

end.
