{ NIM/Nama  : Dhafin Rayhan Ahmad }
{ Tanggal   : 5 April 2019 }

Program nilaiekstrim;
{ Membaca masukan N (integer), kemudian N buah integer ke dalam array,
  lalu X (integer), kemudian menentukan apakah X minimum/maksimum/N#A/tidak ada. }

{ FUNGSI DAN PROSEDUR }
function findMax (arr : array of integer; Neff : integer) : integer;
{ menentukan elemen maksimum pada array }
{ KAMUS LOKAL }
var
    eMax, i : integer;
{ ALGORITMA FUNGSI findMax }
begin
    eMax := arr[0];
    for i := 1 to Neff-1 do
    begin
        if eMax < arr[i] then
        begin
            eMax := arr[i];
        end;
    end;
    findMax := eMax;
end;
function findMin (arr : array of integer; Neff : integer) : integer;
{ menentukan elemen minimum pada array }
{ KAMUS LOKAL }
var
    eMin, i : integer;
{ ALGORITMA FUNGSI findMin }
begin
    eMin := arr[0];
    for i := 1 to Neff-1 do
    begin
        if eMin > arr[i] then
        begin
            eMin := arr[i];
        end;
    end;
    findMin := eMin;
end;
function isOnArray (arr : array of integer; Neff : integer; X : integer) : boolean;
{ menentukan apakan suatu elemen ada pada array }
{ KAMUS LOKAL }
var
    found : boolean;
    i : integer;
{ ALGORITMA FUNGSI isOnArray }
begin
    found := false; i := 0;                 { INISIALISASI }
    while (not(found)) and (i < Neff) do     { Skema pengulangan berdasarkan kondisi mengulang }
    begin
        if X = arr[i] then
        begin
            found := true;
        end;
        i := i + 1;
    end;
    isOnArray := found;
end;

{ KAMUS }
var
    arr : array[1..100] of integer;
    N, X, i : integer;

{ ALGORITMA }
begin
    readln(N);              { N efektif array 'arr' }
    for i := 1 to N do      { Skema pengulangan berdasarkan pencacah }
    begin
        readln(arr[i]);
    end;
    readln(X);
    if X = findMax(arr, N) then
    begin
        writeln('maksimum');
        if X = findMin(arr, N) then
        begin
            writeln('minimum');
        end;
    end else if X = findMin(arr, N) then
    begin
        writeln('minimum');
    end else if isOnArray(arr, N, X) then
    begin
        writeln('N#A');
    end else
    begin
        writeln(X, ' tidak ada');
    end;
end.
