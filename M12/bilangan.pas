{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 7 April 2019 }

Program nilaiekstrim;
{ Membaca masukan N (integer), menampilkan info-info berkaitan dengan
  negatif, positif, atau nol }

{ KAMUS }
var
    arr : array[1..100] of integer;
    N, X, i : integer;
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
    if X = 0 then
    begin
        while (i <= N) and not(found) do
        begin
            if arr[i] = 0 then
            begin
                writeln(i);
                found := true;
            end else
            begin
                i := i + 1;
            end;
        end;
        if not(found) then
        begin
            writeln('Tidak ada 0');
        end;
    end else if X = -1 then
    begin
        while (i <= N) and not(found) do
        begin
            if arr[i] < 0 then
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
            writeln('Tidak ada negatif');
        end;
    end else if X = 1 then
    begin
        while (i <= N) and not(found) do
        begin
            if arr[i] > 0 then
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
            writeln('Tidak ada positif');
        end;
    end else
    begin
        writeln('Tidak diproses');
    end;
end.
