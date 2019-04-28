program tesSave;
uses udatamhs;
{ Buat tabel dataJual sendiri }

var
    i, n : integer;
    t : tabDataMhs;
    fn : string;
    item : dataMhs;
begin
    write('Banyak item: ');
    readln(n);
    t.Neff := n;
    writeln();
    for i := 1 to n do
    begin
        writeln('Item ke-', i);
        write('NIM: ');
        readln(item.NIM);
        write('KdKul: ');
        readln(item.KdKul);
        write('Nilai: ');
        readln(item.Nilai);
        t.TMhs[i] := item;
        writeln();
    end;
    write('Masukkan nama file: ');
    readln(fn);
    SaveDataNilai(fn, t);
    writeln('Selesai.');
end.
