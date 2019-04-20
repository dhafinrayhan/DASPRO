{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 4 April 2019 }

Program ipmahasiswa;
{ Membaca masukan sejumlah nilai IP mahasiswa (bilangan rill) sebuah angkatan,
  sampai pengguna mengetikkan -999 (-999 tidak termasuk).
  Selanjutnya program menuliskan berapa banyak mahasiswa,
  berapa banyak yang lulus dan berapa yang tidak lulus (batas lulus adalah IP >= 2.75),
  dan rata-rata IP di kelas tersebut (data IP salah diabaikan). }

{ FUNGSI DAN PROSEDUR }
function IsWithinRange (X : real; min, max : real) : boolean;
{ Menghasilkan true jika min <= X <= max, menghasilkan false jika tidak }
begin
    if (X >= min) and (X <= max) then
    begin
        IsWithinRange := true;
    end else { (X < min ) or (X > max) }
    begin
        IsWithinRange := false;
    end;
end;

{ KAMUS }
var
    mhs, lulus : integer;
    ip, sum_ip, rata_ip : real;

{ ALGORITMA }
begin
    sum_ip := 0; mhs := 0;                      { Inisialisasi }
    lulus := 0;
    readln(ip);                                 { First Element }
    while (ip <> -999) do                       { EOP: ip = -999 }
    begin
        if IsWithinRange(ip, 0, 4) then         { Validasi }
        begin
            sum_ip := sum_ip + ip;              { Proses current element }
            mhs := mhs + 1;
            if IsWithinRange(ip, 2.75, 4) then  { Periksa kelulusan }
            begin
                lulus := lulus + 1;
            end;
        end;
        readln(ip);                             { Next element }
    end;

    if mhs > 0 then
    begin
        writeln(mhs);               { banyak mahasiswa }
        writeln(lulus);             { banyak mahasiswa lulus }
        writeln(mhs-lulus);         { banyak mahasiswa tidak lulus }
        rata_ip := sum_ip/mhs;      { rata-rata ip mahasiswa }
        writeln(rata_ip:0:2);
    end else { mhs = 0 }
    begin
        writeln('Tidak ada data');
    end;
end.
