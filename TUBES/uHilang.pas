unit uHilang;

interface
    uses uType;
    procedure lapor_hilang (logInfo : User; var dKehilangan : kehilanganArr);
    procedure lihat_laporan (logInfo : User; dKehilangan : kehilanganArr; dBuku : bukuArr);

implementation
    procedure lapor_hilang (logInfo : User; var dKehilangan : kehilanganArr);
    var
        inID, inJudul, inTanggal : string;
        arrlen : integer;
    begin
        if logInfo.Role = 'pengunjung' then
        begin
            write('Masukkan id buku: ');
            readln(inID);
            write('Masukkan judul buku: ');
            readln(inJudul);
            write('Masukkan tanggal pelaporan: ');
            readln(inTanggal);
            arrlen := dKehilangan.Neff;
            extend(dKehilangan);
            dKehilangan.Tab[arrlen].Username := logInfo.Username;
            dKehilangan.Tab[arrlen].ID_Buku_Hilang := inID;
            dKehilangan.Tab[arrlen].Tanggal_Laporan := strToTgl(inTanggal);
            writeln();
            writeln('Laporan berhasil diterima.');
        end else
        begin
            writeln(errorMsg);
        end;
    end;

    procedure lihat_laporan (logInfo : User; dKehilangan : kehilanganArr; dBuku : bukuArr);
    var
        arrlenK, arrlenB, i, j : integer;
        found : boolean;
    begin
        if logInfo.Role = 'admin' then
        begin
            arrlenK := dKehilangan.Neff; arrlenB := dBuku.Neff;
            writeln('Buku yang hilang :');
            for i := 0 to arrlenK-1 do
            begin
                found := false; j := 0;
                while (j < arrlenB) and (not(found)) do
                begin
                    if dBuku.Tab[j].ID_Buku = dKehilangan.Tab[i].ID_Buku_Hilang then
                    begin
                        found := true;
                    end else
                    begin
                        j := j + 1;
                    end;
                end;
                writeln(dKehilangan.Tab[i].ID_Buku_Hilang, ' | ', dBuku.Tab[j].Judul_Buku, ' | ', tglToStr(dKehilangan.Tab[i].Tanggal_Laporan));
            end;
        end else
        begin
            writeln(errorMsg);
        end;
    end;
end.
