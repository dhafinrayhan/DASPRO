unit uBuku;

interface
    uses uType;
    procedure cari (logStatus : boolean; dBuku : bukuArr);
    procedure caritahunterbit (logStatus : boolean; dBuku : bukuArr);

implementation
    procedure lexsort(var d : bukuArr);
    var
        i, j : integer;
        tmp : Buku;
    begin
        for i := d.Neff-2 downto 0 do
        begin
            for j := 0 to i do
            begin
                if (d.Tab[j].Judul_Buku > d.Tab[j+1].Judul_Buku) then
                begin
                    tmp := d.Tab[j];
                    d.Tab[j] := d.Tab[j+1];
                    d.Tab[j+1] := tmp;
                end;
            end;
        end;
    end;
    
    function bandingTahun (t1 : integer; kat : string; t2 : integer) : boolean;
    begin
        case kat of
            '=' : begin
                bandingTahun := (t1 = t2);
            end;
            '<' : begin
                bandingTahun := (t1 < t2);
            end;
            '>' : begin
                bandingTahun := (t1 > t2);
            end;
            '>=' : begin
                bandingTahun := (t1 >= t2);
            end;
            '<=' : begin
                bandingTahun := (t1 <= t2);
            end;
        end;
    end;

    procedure cari (logStatus : boolean; dBuku : bukuArr);
    var
        inKat : string;
        arrlen, i : integer;
        valid, available : boolean;
    begin
        lexsort(dBuku);
        if logStatus = true then
        begin
            arrlen := dBuku.Neff;
            write('Masukkan kategori: ');
            valid := false;
            repeat
                readln(inKat);
                if ((inKat = 'sastra') or (inKat = 'sains') or (inKat = 'manga') or (inKat = 'sejarah') or (inKat = 'programming')) then
                begin
                    valid := true;
                end else
                begin
                    writeln('Kategori ', inKat, ' tidak valid.');
                    write('Masukkan kategori: ');
                end;
            until valid;
            writeln();
            writeln('Hasil pencarian:');
            available := false;
            for i := 0 to arrlen-1 do
            begin
                if dBuku.Tab[i].Kategori = inKat then
                begin
                    available := true;
                    writeln(dBuku.Tab[i].ID_Buku, ' | ', dBuku.Tab[i].Judul_Buku, ' | ', dBuku.Tab[i].Author);
                end;
            end;
            if not(available) then
            begin
                writeln('Tidak ada buku dalam kategori ini.');
            end;
        end else
        begin
            writeln(errorMsg);
        end;
    end;

    procedure caritahunterbit (logStatus : boolean; dBuku : bukuArr);
    var
        inKat : string;
        inTahun, arrlen, i : integer;
        available : boolean;
    begin
        if logStatus = true then
        begin
            arrlen := dBuku.Neff;
            write('Masukkan tahun: ');
            readln(inTahun);
            write('Masukkan kategori: ');
            readln(inKat);
            writeln();
            writeln('Buku yang terbit ', inKat, ' ', inTahun, ':');
            available := false;
            for i := 0 to arrlen-1 do
            begin
                if bandingTahun(dBuku.Tab[i].Tahun_Penerbit, inKat, inTahun) then
                begin
                    available := true;
                    writeln(dBuku.Tab[i].ID_Buku, ' | ', dBuku.Tab[i].Judul_Buku, ' | ', dBuku.Tab[i].Author);
                end;
            end;
            if not(available) then
            begin
                writeln('Tidak ada buku dalam kategori ini.');
            end;
        end else
        begin
            writeln(errorMsg);
        end;
    end;
end.
