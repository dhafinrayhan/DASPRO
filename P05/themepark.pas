Program themepark;
{ Membaca input 3 buah integer, misalnya t, b, dan k
  dengan t mewakili tinggi badan seseorang (dalam cm, bernilai > 0),
  b mewakili berat badan seseorang (dalam kg, bernilai > 0), dan
  k mewakili suatu kategori kendaraan atraksi (bernilai 0..4) }
{ KAMUS }
var
    t, b, k : integer;
{ ALGORITMA }
begin
    { Input t, b, k }
    readln(t, b, k);
    { Validasi boleh/tidak orang dengan t & b menaiki k }
    if (k = 0) then
    begin
        if (t > 200) and (b > 150) then
        begin
            writeln('TRUE');
        end else
        begin
            writeln('FALSE');
        end;
    end else if (k = 1) then
    begin
        if (t <= 100) and (b <= 150) then
        begin
            writeln('TRUE');
        end else
        begin
            writeln('FALSE');
        end;
    end else if (k = 2) then
    begin
        if ((t <= 100) and (b > 30) and (b <= 150)) or ((b > 150) and (b <= 200)) then
        begin
            writeln('TRUE');
        end else
        begin
            writeln('FALSE');
        end;
    end else if (k = 3) then
    begin
        if (b > 150) and (t > 100) and (t <= 200) then
        begin
            writeln('TRUE');
        end else
        begin
            writeln('FALSE');
        end;
    end else { k = 4 }
    begin
        if (t > 100) and (b <= 150) then
        begin
            writeln('TRUE');
        end else
        begin
            writeln('FALSE');
        end;
    end;
end.
