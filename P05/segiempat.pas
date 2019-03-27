Program segiempat;
{ Membaca N (sebuah integer) berikut C1 dan C2 (dua buah karakter),
  dan kemudian menuliskan bentuk tertentu dengan syarat N>0 dan C1 tidak sama dengan C2 }
{ KAMUS }
var
    N, i, j : integer;
    C1, C2: string;
{ ALGORITMA }
begin
    { Input N, C1, C2 }
    readln(N);
    readln(C1);
    readln(C2);
    { Validasi N }
    if (N > 0) and (C1 <> C2) then
    begin
        if (N = 1) then
        begin
            writeln(C1);
        end else
        begin
            for i:=1 to N do
            begin
                write(C1);
            end;
            writeln();
            for i:=1 to (N-2) do
            begin
                write(C1);
                for j:=1 to (N-2) do
                begin
                write(C2);
                end;
                writeln(C1);
            end;
            for i:=1 to N do
            begin
                write(C1);
            end;
            writeln();
        end;
    end else { (N <= 0) or (C1 = C2) }
    begin
        writeln('Masukan tidak valid');
    end;
end.
