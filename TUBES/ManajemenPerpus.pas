{ ===========================================================================
  Program utama dari Tugas Besar mata kuliah 'Dasar Pemrograman' (IF1210)
  Sekolah Teknik Elektro dan Informatika tahun 2019, versi dikerjakan sendiri
  =========================================================================== }
program ManajemenPerpus;

uses
    uType, uAkun, uBuku, uPinjam, uHilang, uTambah, uStat, uFile;
    { TESTING } uDEBUG;
var
    { Database dalam bentuk array }
    data_buku : bukuArr;
    data_user : userArr;
    data_peminjaman : peminjamanArr;
    data_pengembalian : pengembalianArr;
    data_kehilangan : kehilanganArr;

    login_status : boolean; { status pengguna (sudah login atau belum) }
    login_info : User; { informasi pengguna yang sedang login }
    perintah : string; { perintah (command) yang dimasukkan pengguna }
    menuloop : boolean; { kondisi mengulang input command sebelum exit }

begin
    { INISIALISASI }
    login_info.Nama := ''; login_info.Alamat := ''; login_info.Username := ''; login_info.Password := ''; login_info.Role := '';
    data_buku.Neff := 0; data_user.Neff := 0; data_peminjaman.Neff := 0; data_pengembalian.Neff := 0; data_kehilangan.Neff := 0;
    login_status := false;
    menuloop := true;
    { GENERATE TABEL HASHING STATIS }
    genTab;
    { MENU LOOP }
    while menuloop do
    begin
        writeln();
        write('$ ');
        readln(perintah);
        case perintah of
            { F01 } 'register' : begin
                register(login_info, data_user);
            end;
            { F02 } 'login' : begin
                login(login_info, login_status, data_user);
            end;
            { F03 } 'cari' : begin
                cari(login_status, data_buku);
            end;
            { F04 } 'caritahunterbit' : begin
                caritahunterbit(login_status, data_buku);
            end;
            { F05 } 'pinjam_buku' : begin
                pinjam_buku(login_info, data_peminjaman, data_buku);
            end;
            { F06 } 'kembalikan_buku' : begin
                kembalikan_buku(login_info, data_pengembalian, data_peminjaman, data_buku);
            end;
            { F07 } 'lapor_hilang' : begin
                lapor_hilang(login_info, data_kehilangan);
            end;
            { F08 } 'lihat_laporan' : begin
                lihat_laporan(login_info, data_kehilangan, data_buku);
            end;
            { F09 } 'tambah_buku' : begin
                tambah_buku(login_info, data_buku);
            end;
            { F10 } 'tambah_jumlah_buku' : begin
                tambah_jumlah_buku(login_info, data_buku);
            end;
            { F11 } 'riwayat' : begin
                riwayat(login_info, data_peminjaman, data_buku);
            end;
            { F12 } 'statistik' : begin
                statistik(login_info, data_user, data_buku);
            end;
            { F13 } 'load' : begin
                load(data_buku, data_user, data_peminjaman, data_pengembalian, data_kehilangan);
            end;
            { F14 } 'save' : begin
                save(data_buku, data_user, data_peminjaman, data_pengembalian, data_kehilangan);
            end;
            { F15 } 'cari_anggota' : begin
                cari_anggota(login_info, data_user);
            end;
            { F16 } 'exit' : begin
                exit(menuloop, data_buku, data_user, data_peminjaman, data_pengembalian, data_kehilangan);
            end;
            { !!!! TESTING BLOCK : START }
            { TESTING ONLY } 'ld' : begin
                ld(data_buku, data_user, data_peminjaman, data_pengembalian, data_kehilangan);
            end;
            { TESTING ONLY } 'sv' : begin
                sv(data_buku, data_user, data_peminjaman, data_pengembalian, data_kehilangan);
            end;
            { !!!! TESTING BLOCK : END }
            else begin
                writeln(errorMsg);
            end;
        end;
    end;
end.
