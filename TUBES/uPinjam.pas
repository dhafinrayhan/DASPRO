unit uPinjam;

interface
    uses uType;
    procedure pinjam_buku (logInfo : User; var dPeminjaman : peminjamanArr; var dBuku : bukuArr);
    procedure kembalikan_buku (logInfo : User; var dPengembalian : pengembalianArr; var dPeminjaman : peminjamanArr; var dBuku : bukuArr);
    procedure riwayat (logInfo : User; dPeminjaman : peminjamanArr; dBuku : bukuArr);

implementation
    function isKabisat (y : integer) : boolean;
    begin
        isKabisat := (((y mod 4) = 0) and ((y mod 100) <> 0)) or ((y mod 400) = 0);
    end;

    function besok (tgl : tanggal) : tanggal;
    var
        res : tanggal;
    begin
        res.d := tgl.d + 1;
        res.m := tgl.m;
        res.y := tgl.y;
        if (tgl.d = 31) then
        begin
            res.d := 1;
            res.m := tgl.m + 1;
            if (tgl.m = 12) then
            begin
                res.m := 1;
                res.y := tgl.y + 1;
            end;
        end else if (tgl.d = 30) and ((tgl.m = 4) or (tgl.m = 6) or (tgl.m = 9) or (tgl.m = 11)) then
        begin
            res.d := 1;
            res.m := tgl.m + 1;
        end else if (tgl.d = 29) and (tgl.m = 2) then
        begin
            res.d := 1;
            res.m := tgl.m + 1;
        end else if (tgl.d = 28) and (tgl.m = 2) and (not(isKabisat(tgl.y))) then
        begin
            res.d := 1;
            res.m := tgl.m + 1;
        end;
        besok := res;
    end;

    function tambahHari (tgl : tanggal; hari : integer) : tanggal;
    var
        res : tanggal;
        i : integer;
    begin
        res := tgl;
        for i := 1 to hari do
        begin
            res := besok(res);
        end;
        tambahHari := res;
    end;

    function tglValue (t : tanggal) : integer;
    { Mengonversi sebuah tanggal menjadi numerik yang mempresentasikan banyaknya
      hari yang terlewat sejak 30/01/0000 (asumsi tidak ada modifikasi Julian-Gregorian) }
    { CATATAN: Fungsi ini sebenarnya dapat dilakukan dengan menjalankan looping dengan
               function 'besok', namun cara ini lebih matematis dan lebih cepat }
    var
        thn, kab4, kab100, kab400, bln, bln31, tgl : integer;
    begin
        { Menggunakan sistem bulan Maret = 1, April = 2, ...
          Januari = 11, Februari = 12 pada tahun sebelumnya. }
        if (t.m = 1) or (t.m = 2) then
        begin
            t.m := t.m + 10;
            t.y := t.y - 1;
        end else
        begin
            t.m := t.m - 2;
        end;
        { Perhitungan hari-hari yang terlewati sesuai Gregorian Calendar }
        thn := 365 * t.y;
        kab4 := t.y div 4;
        kab100 := t.y div 100;
        kab400 := t.y div 400;
        bln := 30 * t.m;
        bln31 := round(0.6 * (t.m - 1));
        tgl := t.d;
        tglValue := thn + kab4 - kab100 + kab400 + bln + bln31 + tgl;
    end;

    function selisihHari (tA, tB : tanggal) : integer;
    { Menerima masukan dua buah tanggal tA dan tB lalu mengembalikan
      integer yang menyatakan banyak hari yang terlewati dari tA ke tB }
    { CATATAN: Fungsi ini sebenarnya dapat dilakukan dengan menjalankan looping dengan
               function 'besok', namun cara ini lebih matematis dan lebih cepat }
    var
        subs : integer;
    begin
        { Menurunkan nilai tahun pada kedua tanggal dengan tahun yang serupa }
        subs := tA.y mod 400;
        tB.y := tB.y - (tA.y - subs);
        tA.y := subs;
        { Menggunakan fungsi 'tglValue' dan mencari selisihnya }
        selisihHari := tglValue(tB) - tglValue(tA);
    end;

    procedure pinjam_buku (logInfo : User; var dPeminjaman : peminjamanArr; var dBuku : bukuArr);
    var
        inID, inTanggal : string;
        arrlenP, arrlenB, i : integer;
        found : boolean;
    begin
        if logInfo.Role = 'pengunjung' then
        begin
            write('Masukkan id buku yang ingin dipinjam: ');
            readln(inID);
            write('Masukkan tanggal hari ini: ');
            readln(inTanggal);
            arrlenB := dBuku.Neff;
            i := 0; found := false;
            while (i < arrlenB) and (not(found)) do
            begin
                if dBuku.Tab[i].ID_Buku = inID then
                begin
                    found := true;
                end else
                begin
                    i := i + 1;
                end;
            end;
            if dBuku.Tab[i].Jumlah_Buku > 0 then
            begin
                dBuku.Tab[i].Jumlah_Buku := dBuku.Tab[i].Jumlah_Buku - 1;
                arrlenP := dPeminjaman.Neff;
                extend(dPeminjaman);
                dPeminjaman.Tab[arrlenP].Username := logInfo.Username;
                dPeminjaman.Tab[arrlenP].ID_Buku := inID;
                dPeminjaman.Tab[arrlenP].Tanggal_Peminjaman := strToTgl(inTanggal);
                dPeminjaman.Tab[arrlenP].Tanggal_Batas_Pengembalian := tambahHari(strToTgl(inTanggal), 7);
                dPeminjaman.Tab[arrlenP].Status_Pengembalian := false;
                writeln('Buku ', dBuku.Tab[i].Judul_Buku, ' berhasil dipinjam!');
                writeln('Tersisa ', dBuku.Tab[i].Jumlah_Buku, ' buku ', dBuku.Tab[i].Judul_Buku, '.');
                writeln('Terima kasih sudah meminjam.');
            end else
            begin
                writeln('Buku ', dBuku.Tab[i].Judul_Buku, ' sedang habis!');
                writeln('Coba lain kali.');
            end;
        end else
        begin
            writeln(errorMsg);
        end;
    end;

    procedure kembalikan_buku (logInfo : User; var dPengembalian : pengembalianArr; var dPeminjaman : peminjamanArr; var dBuku : bukuArr);
    var
        inID, inTanggal : string;
        iP, iB, arrlen, difTgl : integer;
        found : boolean;
    begin
        if logInfo.Role = 'pengunjung' then
        begin
            write('Masukkan id buku yang dikembalikan: ');
            readln(inID);
            found := false; iB := 0;
            while (iB < dBuku.Neff) and (not(found)) do
            begin
                if dBuku.Tab[iB].ID_Buku = inID then
                begin
                    found := true;
                end else
                begin
                    iB := iB + 1;
                end;
            end;
            found := false; iP := 0;
            while (iP < dPeminjaman.Neff) and (not(found)) do
            begin
                if (dPeminjaman.Tab[iP].ID_Buku = inID) and (dPeminjaman.Tab[iP].Username = logInfo.Username) then
                begin
                    found := true;
                end else
                begin
                    iP := iP + 1;
                end;
            end;
            writeln('Data peminjaman:');
            writeln('Username: ', logInfo.Username);
            writeln('Judul buku: ', dBuku.Tab[iB].Judul_Buku);
            writeln('Tanggal peminjaman: ', tglToStr(dPeminjaman.Tab[iP].Tanggal_Peminjaman));
            writeln('Tanggal batas pengembalian: ', tglToStr(dPeminjaman.Tab[iP].Tanggal_Batas_Pengembalian));
            writeln();
            write('Masukkan tanggal hari ini: ');
            readln(inTanggal);
            arrlen := dPengembalian.Neff;
            extend(dPengembalian);
            dPengembalian.Tab[arrlen].Username := logInfo.Username;
            dPengembalian.Tab[arrlen].ID_Buku := inID;
            dPengembalian.Tab[arrlen].Tanggal_Pengembalian := strToTgl(inTanggal);
            dPeminjaman.Tab[iP].Status_Pengembalian := true;
            dBuku.Tab[iB].Jumlah_Buku := dBuku.Tab[iB].Jumlah_Buku + 1;
            difTgl := selisihHari(dPeminjaman.Tab[iP].Tanggal_Batas_Pengembalian, strToTgl(inTanggal));
            if difTgl <= 0 then
            begin
                writeln('Terima kasih sudah meminjam.');
            end else
            begin
                writeln('Anda terlambat mengembalikan buku.');
                writeln('Anda terkena denda ', (2000 * difTgl), '.');
            end;
        end else
        begin
            writeln(errorMsg);
        end;
    end;

    procedure riwayat (logInfo : User; dPeminjaman : peminjamanArr; dBuku : bukuArr);
    var
        inUser : string;
        arrlen, i, j : integer;
        found, available : boolean;
    begin
        if logInfo.Role = 'admin' then
        begin
            arrlen := dPeminjaman.Neff;
            write('Masukkan username pengunjung: ');
            readln(inUser);
            writeln();
            writeln('Riwayat:');
            available := false;
            for i := 0 to arrlen-1 do
            begin
                if dPeminjaman.Tab[i].Username = inUser then
                begin
                    available := true;
                    found := false; j := 0;
                    while (j < dBuku.Neff) and (not(found)) do
                    begin
                        if dBuku.Tab[j].ID_Buku = dPeminjaman.Tab[i].ID_Buku then
                        begin
                            found := true;
                        end else
                        begin
                            j := j + 1;
                        end;
                    end;
                    writeln(tglToStr(dPeminjaman.Tab[i].Tanggal_Peminjaman), ' | ', dPeminjaman.Tab[i].ID_Buku, ' | ', dBuku.Tab[j].Judul_Buku);
                end;
            end;
            if not(available) then
            begin
                writeln('<pesan salah>');
            end;
        end else
        begin
            writeln(errorMsg);
        end;
    end;
end.
