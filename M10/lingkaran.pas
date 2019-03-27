{ NIM/Nama : 16518332/Dhafin Rayhan Ahmad }
{ Tanggal  : 22 Maret 2019 }

Program ProsesLingkaran;
{ Input: 2 buah Lingkaran }
{ Output: luas, keliling, dan hubungan lingkaran A dan B }
 
{ KAMUS }
const
        PI : real = 3.1415;
type
        { Definisi Type Koordinat }
        Koordinat = record
                      x : real;
                      y : real;
        end;
        { Definisi Type Lingkaran }
        Lingkaran = record
                      c : Koordinat; { titik pusat lingkaran }
                      r : real;      { jari-jari, > 0 }
        end;
var
        A, B : Lingkaran; { variabel untuk lingkaran A dan B }
 
{ FUNGSI DAN PROSEDUR }
function IsRValid (var r : real) : boolean;
{ Menghasilkan validasi r > 0 }
{ ALGORITMA FUNGSI IsRValid }
begin
        if (r > 0) then
        begin
                IsRValid := true;
        end else { rx <= 0 }
        begin
                IsRValid := false;
        end;
end;

procedure InputLingkaran (var A : Lingkaran);
{ I.S.: A sembarang }
{ F.S.: A terdefinisi sesuai dengan masukan pengguna. Pemasukan jari-jari diulangi 
        sampai didapatkan jari-jari yang benar yaitu r > 0. Pemeriksaan apakah jari-
        jari valid menggunakan fungsi IsRValid.
        Jika jari-jari tidak valid, dikeluarkan pesan kesalahan “Jari-jari harus > 0”. }
{ KAMUS LOKAL }
var
        r : real;
{ ALGORITMA PROSEDUR InputLingkaran }
begin
        readln(A.c.x, A.c.y);
        readln(r);
        while (IsRValid(r) = false) do
        begin
                writeln('Jari-jari harus > 0');
                readln(r);
        end;
        A.r := r;
end;
 
function KelilingLingkaran (var A : Lingkaran) : real;
{ Menghasilkan keliling lingkaran A = 2 * PI * A.r }
{ ALGORITMA FUNGSI KelilingLingkaran }
begin
        KelilingLingkaran := 2 * PI * A.r;
end;
 
function LuasLingkaran (var A : Lingkaran) : real;
{ Menghasilkan luas lingkaran A = PI * A.r * A.r }
{ ALGORITMA FUNGSI LuasLingkaran }
begin
        LuasLingkaran := PI * A.r * A.r;
end;
 
function Jarak (var P1, P2 : Koordinat) : real;
{ Menghasilkan jarak antara P1 dan P2 }
{ ALGORITMA FUNGSI Jarak }
begin
        Jarak := sqrt((P2.x-P1.x)*(P2.x-P1.x)+(P2.y-P1.y)*(P2.y-P1.y));
end;

function HubunganLingkaran (var A, B : Lingkaran) : integer;
{ Menghasilkan integer yang menyatakan hubungan lingkaran A dan B, yaitu:
  1 = A dan B sama;
  2 = A dan B berimpit; 
  3 = A dan B beririsan;
  4 = A dan B bersentuhan;
  5 = A dan B saling lepas }
{ ALGORITMA FUNGSI HubunganLingkaran }
begin
        if (Jarak(A.c, B.c) = 0) and (A.r = B.r) then
        begin
                HubunganLingkaran := 1;
        end else if (Jarak(A.c, B.c) = 0) and (A.r <> B.r) then
        begin
                HubunganLingkaran := 2;
        end else if (Jarak(A.c, B.c) <> 0) and (Jarak(A.c, B.c) < (A.r + B.r)) then
        begin
                HubunganLingkaran := 3;
        end else if (Jarak(A.c, B.c) = (A.r + B.r)) then
        begin
                HubunganLingkaran := 4;
        end else { Jarak(A.c, B.c) > (A.r + B.r) }
        begin
                HubunganLingkaran := 5;
        end;
end;
 
{ ALGORITMA PROGRAM UTAMA }
begin
        writeln('Masukkan lingkaran A:');
        InputLingkaran(A);
        writeln('Masukkan lingkaran B:');
        InputLingkaran(B);
        writeln('Keliling lingkaran A = ', KelilingLingkaran(A):0:2);
        writeln('Luas lingkaran A = ', LuasLingkaran(A):0:2);
        writeln('Keliling lingkaran B = ', KelilingLingkaran(B):0:2);
        writeln('Luas lingkaran B = ', LuasLingkaran(B):0:2);
        write('A dan B adalah ');
        case HubunganLingkaran(A, B) of
                1 : begin
                        writeln('sama');
                    end;
                2 : begin
                        writeln('berimpit');
                    end;
                3 : begin
                        writeln('beririsan');
                    end;
                4 : begin
                        writeln('bersentuhan');
                    end;
                else { 5 }
                    begin
                        writeln('saling lepas');
                    end;
        end;
end. 