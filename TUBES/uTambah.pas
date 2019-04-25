unit uTambah;

interface
    uses uType;
    procedure tambah_buku (logInfo : User; var dBuku : bukuArr);
    procedure tambah_jumlah_buku (logInfo : User; var dBuku : bukuArr);

implementation
    procedure tambah_buku (logInfo : User; var dBuku : bukuArr);
    var
        inID, inJudul, inPengarang, inKategori : string;
        inJumlah, inTahun, arrlen : integer;
    begin
        if logInfo.Role = 'admin' then
        begin
            write('Masukkan id buku: ');
            readln(inID);
            write('Masukkan judul buku: ');
            readln(inJudul);
            write('Masukkan pengarang buku: ');
            readln(inPengarang);
            write('Masukkan jumlah buku: ');
            readln(inJumlah);
            write('Masukkan tahun terbit buku: ');
            readln(inTahun);
            write('Masukkan kategori buku: ');
            readln(inKategori);
            arrlen := dBuku.Neff;
            extend(dBuku);
            dBuku.Tab[arrlen].ID_Buku := inID;
            dBuku.Tab[arrlen].Judul_Buku := inJudul;
            dBuku.Tab[arrlen].Author := inPengarang;
            dBuku.Tab[arrlen].Jumlah_Buku := inJumlah;
            dBuku.Tab[arrlen].Tahun_Penerbit := inTahun;
            dBuku.Tab[arrlen].Kategori := inKategori;
            writeln();
            writeln('Buku berhasil ditambahkan ke dalam sistem!');
        end else
        begin
            writeln(errorMsg);
        end;
    end;

    procedure tambah_jumlah_buku (logInfo : User; var dBuku : bukuArr);
    var
        found : boolean;
        inID : string;
        arrlen, i, inTambah : integer;
    begin
        arrlen := dBuku.Neff;
        if logInfo.Role = 'admin' then
        begin
            write('Masukkan ID Buku: ');
            readln(inID);
            write('Masukkan jumlah buku yang ditambahkan: ');
            readln(inTambah);
            found := false; i := 0;
            while (i < arrlen) and (not(found)) do
            begin
                if dBuku.Tab[i].ID_Buku = inID then
                begin
                    found := true;
                end else
                begin
                    i := i + 1;
                end;
            end;
            dBuku.Tab[i].Jumlah_Buku := dBuku.Tab[i].Jumlah_Buku + inTambah;
            writeln();
            writeln('Pembaharuan jumlah buku berhasil dilakukan, total buku ', dBuku.Tab[i].Judul_Buku, ' di perpustakaan menjadi ', dBuku.Tab[i].Jumlah_Buku);
        end else
        begin
            writeln(errorMsg);
        end;
    end;
end.
