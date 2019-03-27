Program hargaMakanan;
{ Membaca N (sebuah integer) berikut N buah kode
  lalu menghitung harga makanan sesuai ketentuan }
{ KAMUS }
var
    N, i, harga, kode: integer;
{ ALGORITMA }
begin
    { Input N dan set nilai harga }
    readln(N);
    harga := 0;
    { Input kode }
    for i:=1 to N do
    begin
        readln(kode);
        if ((i mod 2) = 1) then
        begin
            harga := harga + 100*kode;
        end else { (i mod 2) = 0 }
        begin
            harga := harga + 200*kode;
        end;
    end;
    writeln(harga, ' rupiah');
end.
