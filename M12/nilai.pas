{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 4 April 2019 }

Program nilai;
{ Membaca masukan sejumlah nilai mahasiswa (integer),
  sampai pengguna mengetikkan -9999 (-9999 tidak termasuk).
  Selanjutnya program menuliskan banyak mahasiswa keseluruhan,
  banyak yang lulus dan tidak lulus, dan rata-rata nilai }

{ KAMUS }
var
    mhs, lulus : integer;
    score, sum_score, rata_score : real;

{ ALGORITMA }
begin
    readln(score);                                      { First element }
    if score = -9999 then                               { EOP: score = -9999 }
    begin
        writeln('Data nilai kosong');                   { Proses kasus kosong }
    end else { score <> -9999 }
    begin
        sum_score := 0; mhs := 0; lulus := 0;           { Inisialisasi }
        repeat
            if (score >= 0) and (score <= 100) then     { Validasi }
            begin
                mhs := mhs + 1;                         { Proses current element }
                sum_score := sum_score + score;
                if score >= 40 then                     { Periksa kelulusan }
                begin
                    lulus := lulus + 1;
                end;
            end;
            readln(score);                              { Next element }
        until score = -9999;                            { EOP: score = -9999 }
        if mhs = 0 then
        begin
            writeln(0);
        end else
        begin
            writeln(mhs);                   { banyak mahasiswa }
            writeln(lulus);                 { banyak mahasiswa lulus }
            writeln(mhs-lulus);             { banyak mahasiswa tidak lulus }
            rata_score := sum_score/mhs;    { rata-rata ip mahasiswa }
            writeln(rata_score:0:2);
        end;
    end;
end.
