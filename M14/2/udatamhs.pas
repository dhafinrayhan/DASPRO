{ NIM       : 16518332
  Nama      : Dhafin Rayhan Ahmad
  Tanggal   : 28/04/2019
  Topik     : Sekuensial File
  Deskripsi : Unit data mahasiswa yang mengelola file of dataMhs }
unit udatamhs;
{ Memuat, mengurutkan, menghitung rata-rata, dan menyimpan suatu data mahasiswa }


{ DEKLARASI TYPE FUNGSI DAN PROSEDUR }

interface

    const
        NMax = 100;

    type
        dataMhs  = record
            NIM, KdKul : string;
            Nilai : integer;
        end;
        tabNilaiMhs = record
            TMhs : array[1..NMax] of dataMhs;
            Neff : integer;
        end;


    { DEKLARASI FUNGSI DAN PROSEDUR }

    function EOP (rek : dataMhs) : boolean;
    { MengNilaikan true jika rek = mark }

    procedure LoadDataNilai (filename : string; var T : tabNilaiMhs);
    { I.S. : filename terdefinisi, T sembarang }
    { F.S. : Tabel T terisi nilai mahasiswa dengan data yang dibaca
             dari file dengan nama = filename.
             T.Neff = 0 jika tidak ada file atau kosong;
             T diisi dengan seluruh isi file atau sampai T penuh. }


    procedure UrutNIMAsc (var T : tabNilaiMhs);
    { I.S. : T terdefinisi; T mungkin kosong }
    { F.S. : Isi tabel T terurut membesar menurut NIM.
             T tetap jika T kosong. }

    procedure HitungRataRata (T : tabNilaiMhs);
    { I.S. : T terdefinisi; T mungkin kosong. T terurut berdasarkan NIM. }
    { F.S. : Menampilkan NIM dan nilai rata-rata setiap mahasiswa yang ada
             dalam tabel dengan format: <NIM>=<rata-rata> }

    procedure SaveDataNilai (filename : string; T : tabNilaiMhs);
    { I.S. : T dan filename terdefinisi; T mungkin kosong }
    { F.S. : Isi tabel T dituliskan pada file dg nama = filename }


{ IMPLEMENTASI FUNGSI DAN PROSEDUR }

implementation

    function EOP (rek : dataMhs) : boolean;
    begin
        if (rek.NIM = '99999999') and (rek.KdKul = 'XX9999') and (rek.Nilai = -999) then
        begin
            EOP := true;
        end else
        begin
            EOP := false;
        end;
    end;

    procedure LoadDataNilai (filename : string; var T : tabNilaiMhs);
    var
        f : file of dataMhs;
        item : dataMhs;
    begin
        T.Neff := 0; { Inisialisasi }
        { Skema Dasar Pembacaan File Tanpa EOF - While-do }
        assign(f, filename);
        reset(f);
        read(f, item); { First-Elmt }
        while not(EOP(item)) and (T.Neff < NMax) do
        begin
            T.Neff := T.Neff + 1;
            T.TMhs[T.Neff] := item;
            read(f, item);
        end;
        close(f);
    end;

    procedure UrutNIMAsc (var T : tabNilaiMhs);
    { Menggunakan Selection Sort }
    var
        tmp : dataMhs;
        imin, i, j : integer;
    begin
        for i := 1 to T.Neff-1 do
        begin
            { Mencari index minimum }
            imin := i;
            for j := i+1 to T.Neff do
            begin
                if T.TMhs[j].NIM < T.TMhs[imin].NIM then
                begin
                    imin := j;
                end;
            end;
            { Tukar }
            tmp := T.TMhs[imin];
            T.TMhs[imin] := T.TMhs[i];
            T.TMhs[i] := tmp;
        end;
    end;

    procedure HitungRataRata (T : tabNilaiMhs);
    { Menggunakan Skema Konsolidasi Tanpa Separator }
    var
        i, jumlah, totalNilai : integer;
        CurNIM : string;
    begin
        if T.Neff = 0 then
        begin
            writeln('Data kosong');
        end else
        begin
            i := 1;
            while i <= T.Neff do
            begin
                CurNIM := T.TMhs[i].NIM;
                totalNilai := 0;
                jumlah := 0;
                repeat
                    totalNilai := totalNilai + T.TMhs[i].Nilai;
                    jumlah := jumlah + 1;
                    i := i + 1;
                until (T.TMhs[i].NIM <> CurNIM);
                writeln(CurNIM, '=', round(totalNilai/jumlah));
            end;
        end;
    end;

    procedure SavedataNilai (filename : string; T : tabNilaiMhs);
    var
        i : integer;
        f : file of dataMhs;
        item : dataMhs;
    begin
        assign(f, filename);
        rewrite(f);
        i := 1;
        while i <= T.Neff do
        begin
            item := T.TMhs[i];
            write(f, item);
            i := i + 1;
        end;
        { Menulis mark }
        item.NIM := '99999999';
        item.KdKul := 'XX9999';
        item.Nilai := -999;
        write(f, item);
        close(f);
    end;

end.
