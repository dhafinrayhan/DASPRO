program tesLoadUrutHitung;
uses udatajual;

var
    t : tabPenjualan;
    fn : string;
begin
    write('Masukkan nama file: ');
    readln(fn);
    LoadDataJual(fn, t);
    UrutKategoriAsc(t);
    HitungRataRata(t);
end.
