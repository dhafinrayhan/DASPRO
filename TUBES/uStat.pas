unit uStat;

interface
    uses uType;
    procedure statistik (logInfo : User; dUser : userArr; dBuku : bukuArr);
    procedure cari_anggota (logInfo : User; dUser : userArr);

implementation
    procedure statistik (logInfo : User; dUser : userArr; dBuku : bukuArr);
    var
        nAdmin, nPengunjung, nSastra, nSains, nManga, nSejarah, nProgramming, arrlenU, arrlenB, i : integer;
    begin
        if logInfo.Role = 'admin' then
        begin
            arrlenU := dUser.Neff; arrlenB := dBuku.Neff;
            nAdmin := 0; nPengunjung := 0; nSastra := 0; nSains := 0; nManga := 0; nSejarah := 0; nProgramming := 0;
            for i := 0 to arrlenU-1 do
            begin
                if dUser.Tab[i].Role = 'admin' then
                begin
                    nAdmin := nAdmin + 1;
                end else { dUser[i].Role := 'pengunjung' }
                begin
                    nPengunjung := nPengunjung + 1;
                end;
            end;
            for i := 0 to arrlenB-1 do
            begin
                if dBuku.Tab[i].Kategori = 'sastra' then
                begin
                    nSastra := nSastra + 1;
                end else if dBuku.Tab[i].Kategori = 'sains' then
                begin
                    nSains := nSains + 1;
                end else if dBuku.Tab[i].Kategori = 'manga' then
                begin
                    nManga := nManga + 1;
                end else if dBuku.Tab[i].Kategori = 'sejarah' then
                begin
                    nSejarah := nSejarah + 1;
                end else { dBuku[i].Kategori = 'programming' }
                begin
                    nProgramming := nProgramming + 1;
                end;
            end;
            writeln('Pengguna:');
            writeln('Admin | ', nAdmin);
            writeln('Pengunjung | ', nPengunjung);
            writeln('Total | ', nAdmin + nPengunjung);
            writeln('Buku:');
            writeln('sastra | ', nSastra);
            writeln('sains | ', nSains);
            writeln('manga | ', nManga);
            writeln('sejarah | ', nSejarah);
            writeln('programming | ', nProgramming);
            writeln('Total | ', (nSastra + nSains + nManga + nSejarah + nProgramming));
        end else
        begin
            writeln(errorMsg);
        end;
    end;

    procedure cari_anggota (logInfo : User; dUser : userArr);
    var
        inUsername : string;
        arrlen, i : integer;
        found : boolean;
    begin
        if logInfo.Role = 'admin' then
        begin
            write('Masukkan username: ');
            readln(inUsername);
            arrlen := dUser.Neff;
            found := false; i := 0;
            while (i < arrlen) and (not(found)) do
            begin
                if dUser.Tab[i].Username = inUsername then
                begin
                    found := true;
                end else
                begin
                    i := i + 1;
                end;
            end;
            if found then
            begin
                writeln('Nama anggota: ', dUser.Tab[i].Nama);
                writeln('Alamat anggota: ', dUser.Tab[i].Alamat);
            end else
            begin
                writeln('Anggota tidak ditemukan.');
            end;
        end else
        begin
            writeln(errorMsg);
        end;
    end;

end.
