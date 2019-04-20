{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 4 April 2019 }

Program suhu;
{ Membaca data suhu udara (integer) setiap hari dalam 20 hari dalam derajat celcius.
  Program akan menuliskan semua nilai suhu, suhu tertinggi, dan suhu terendah. }

{ FUNGSI DAN PROSEDUR }
function findMax (arr : array of integer) : integer;
{ menentukan elemen maksimum pada array berukuran 20 }
{ KAMUS LOKAL }
var
    eMax, i : integer;
begin
    eMax := arr[0];
    for i := 1 to 19 do
    begin
        if eMax < arr[i] then
        begin
            eMax := arr[i];
        end;
    end;
    findMax := eMax;
end;
function findMin (arr : array of integer) : integer;
{ menentukan elemen minimum pada array berukuran 20 }
{ KAMUS LOKAL }
var
    eMin, i : integer;
begin
    eMin := arr[0];
    for i := 1 to 19 do
    begin
        if eMin > arr[i] then
        begin
            eMin := arr[i];
        end;
    end;
    findMin := eMin;
end;

{ KAMUS }
var
    data_suhu : array[1..20] of integer;
    i : integer;

{ ALGORITMA }
begin
    for i := 1 to 20 do     { Skema pengulangan berdasarkan pencacah }
    begin
        readln(data_suhu[i]);
    end;
    for i := 1 to 20 do     { Skema pengulangan berdasarkan pencacah }
    begin
        writeln('[H', i, ']', data_suhu[i]);
    end;
    writeln('Tertinggi = ', findMax(data_suhu));
    writeln('Terendah = ', findMin(data_suhu));
end.
