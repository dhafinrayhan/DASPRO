{ FOR TESTING ONLY (Bukan bagian dari spesifikasi tugas) }
unit uDEBUG;

interface
    uses uType;
    { PROSEDUR }
    procedure ld (
                    var dBuku : bukuArr;
                    var dUser : userArr;
                    var dPeminjaman : peminjamanArr;
                    var dPengembalian : pengembalianArr;
                    var dKehilangan : kehilanganArr
                   );
    procedure sv (
                    dBuku : bukuArr;
                    dUser : userArr;
                    dPeminjaman : peminjamanArr;
                    dPengembalian : pengembalianArr;
                    dKehilangan : kehilanganArr
                   );

implementation
    uses CSVtools;
    { PROSEDUR }
    procedure ld ( { Menggunakan array-array data sebagai parameter,
                       pass by reference }
                    var dBuku : bukuArr;
                    var dUser : userArr;
                    var dPeminjaman : peminjamanArr;
                    var dPengembalian : pengembalianArr;
                    var dKehilangan : kehilanganArr
                   );
    var
        { Filename masing-masing data }
        fBuku, fUser, fPeminjaman, fPengembalian, fKehilangan : string;
    begin
        { Meminta input dari pengguna }
        fBuku := 'buku.csv';
        fUser := 'user.csv';
        fPeminjaman := 'peminjaman.csv';
        fPengembalian := 'pengembalian.csv';
        fKehilangan := 'kehilangan.csv';
        { Memasukkan data ke file CSV masing-masing }
        ctRead(dBuku, fBuku);
        ctRead(dUser, fUser);
        ctRead(dPeminjaman, fPeminjaman);
        ctRead(dPengembalian, fPengembalian);
        ctRead(dKehilangan, fKehilangan);
        writeln();
        writeln('[TESTING MODE]');
        writeln('File perpustakaan berhasil dimuat!');
    end;

    procedure sv ( { Menggunakan array-array data sebagai parameter,
                       pass by value }
                    dBuku : bukuArr;
                    dUser : userArr;
                    dPeminjaman : peminjamanArr;
                    dPengembalian : pengembalianArr;
                    dKehilangan : kehilanganArr
                   );
    var
        { Filename masing-masing data }
        fBuku, fUser, fPeminjaman, fPengembalian, fKehilangan : string;
    begin
        { Meminta input dari pengguna }
        fBuku := 'buku.csv';
        fUser := 'user.csv';
        fPeminjaman := 'peminjaman.csv';
        fPengembalian := 'pengembalian.csv';
        fKehilangan := 'kehilangan.csv';
        { Memasukkan data ke file CSV masing-masing }
        ctWrite(dBuku, fBuku);
        ctWrite(dUser, fUser);
        ctWrite(dPeminjaman, fPeminjaman);
        ctWrite(dPengembalian, fPengembalian);
        ctWrite(dKehilangan, fKehilangan);
        writeln();
        writeln('[TESTING MODE]');
        writeln('Data berhasil disimpan!');
    end;

end.
