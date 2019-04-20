{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 4 April 2019 }

Program lingkaran;
{ Membaca jari-jari (integer) lalu menampilkan luas lingkaran }

{ KAMUS }
var
    r : integer;
    luas : real;

{ ALGORITMA }
begin
    readln(r);
    if r <= 0 then
    begin
        writeln('Jari-jari harus > 0');
    end else { r > 0 }
    begin
        luas := 3.1415 * r * r;
        writeln(luas:0:2);
    end;
end.
