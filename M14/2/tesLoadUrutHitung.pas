program tesLoadUrutHitung;
uses udatamhs;

var
    t : tabDataMhs;
    fn : string;
begin
    write('Masukkan nama file: ');
    readln(fn);
    LoadDataNilai(fn, t);
    UrutKategoriAsc(t);
    HitungRataRata(t);
end.
