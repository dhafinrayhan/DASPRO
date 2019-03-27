Program jumlahderet;
{ Membaca input sebuah integer N, menghitung jumlah deret 1+3+...+N }
{ ASUMSI: N > 0, N ganjil }
{ KAMUS }
var
    N, i, jumlah : integer;
{ ALGORITMA }
begin
    { Input N }
    readln(N);
    { Menghitung jumlah deret }
    i := 1;
    jumlah := 0;
    while ( i <= N ) do
    begin
        jumlah := jumlah + i;
        i := i + 2;
    end;
    { Menampilkan jumlah deret }
    writeln(jumlah);
end.
