{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 4 April 2019 }

Program barang;
{ Membaca masukan N (integer) lalu N buah harga (integer)
  kemudian menampilkan total harga }

{ KAMUS }
var
    N, harga, total, i : integer;

{ ALGORITMA }
begin
    total := 0;         { Inisialisasi }
    readln(N);
    for i := 1 to N do  { Skema pengulangan berdasarkan jumlah pengulangan }
    begin
        readln(harga);
        total := total + harga;
    end;
    writeln(total);
end.
