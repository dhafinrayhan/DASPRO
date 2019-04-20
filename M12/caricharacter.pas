{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 7 April 2019 }

Program nilaiekstrim;
{ Membaca masukan N (integer), menampilkan info-info berkaitan dengan
  huruf besar, huruf kecil, atau non-huruf }

{ KAMUS }
var
    arr : array[1..100] of char;
    X : char;
    N, i : integer;
    valid, found : boolean;

{ ALGORITMA }
begin
    { Input dan validasi N }
    valid := false;                             { inisialisasi }
    while not(valid) do
    begin
        readln(N);
        if (N > 0) and (N <= 100) then          { validasi }
        begin
            valid := true;
        end else { (N <= 0) or (N > 100) }
        begin
            writeln('Masukan salah. Ulangi!');  { pesan kesalahan }
        end;
    end;
    { Input elemen-elemen array }
    for i := 1 to N do
    begin
        readln(arr[i]);
    end;
    { Pemeriksaan dengan X }
    found := false; i := 1; { inisialisasi }
    readln(X);
    if (X = 'S') or (X = 's') then
    begin
        while (i <= N) and not(found) do
        begin
            if (ord(arr[i]) >= 97) and (ord(arr[i]) <= 122) then
            begin
                writeln(i, ' ', arr[i]);
                found := true;
            end else
            begin
                i := i + 1;
            end;
        end;
        if not(found) then
        begin
            writeln('Tidak ada huruf kecil');
        end;
    end else if (X = 'L') or (X = 'l') then
    begin
        while (i <= N) and not(found) do
        begin
            if (ord(arr[i]) >= 65) and (ord(arr[i]) <= 90) then
            begin
                writeln(i, ' ', arr[i]);
                found := true;
            end else
            begin
                i := i + 1;
            end;
        end;
        if not(found) then
        begin
            writeln('Tidak ada huruf besar');
        end;
    end else if (X = 'X') or (X = 'x') then
    begin
        while (i <= N) and not(found) do
        begin
            if (ord(arr[i]) < 65) or ((ord(arr[i]) > 90) and (ord(arr[i]) < 97)) or ((ord(arr[i]) > 122)) then
            begin
                writeln(i, ' ', arr[i]);
                found := true;
            end else
            begin
                i := i + 1;
            end;
        end;
        if not(found) then
        begin
            writeln('Semua huruf');
        end;
    end else
    begin
        writeln('Tidak diproses');
    end;
end.
