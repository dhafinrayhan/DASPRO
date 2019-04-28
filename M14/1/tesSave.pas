program tesSave;
uses udatajual;
{ Buat tabel dataJual sendiri }

var
    i, n : integer;
    t : tabPenjualan;
    fn : string;
    item : dataJual;
begin
    write('Banyak item: ');
    readln(n);
    t.Neff := n;
    writeln();
    for i := 1 to n do
    begin
        writeln('Item ke-', i);
        write('KdKategori: ');
        readln(item.KdKategori);
        write('KdProduk: ');
        readln(item.KdProduk);
        write('Hasil: ');
        readln(item.Hasil);
        t.TJual[i] := item;
        writeln();
    end;
    write('Masukkan nama file: ');
    readln(fn);
    SaveDataJual(fn, t);
    writeln('Selesai.');
end.
