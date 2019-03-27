Program array1;
{ Membaca N (sebuah integer) berikut N buah integer
  lalu menentukan banyaknya integer yang memenuhi kondisi 
  lalu menampilkannya ke layar sesuai ketentuan }
{ KAMUS }
type
    myArr = array of integer;
var
    N, i, masuk, kond, banyak: integer;
    arr : myArr;
{ ALGORITMA }
begin
    readln(N);
    if (N > 0) then
    begin
        SetLength(arr, N);
        for i:= 0 to (N-1) do
        begin
            readln(masuk);
            arr[i] := masuk;
        end;
        
        readln(kond);
        banyak := 0;
        if (kond = -1) then
        begin
            for i:=0 to (N-1) do
            begin
                if (arr[i] < 0) then
                begin
                    banyak := banyak + 1;
                end;
            end;
            writeln(banyak);
            for i:=0 to (N-1) do
            begin
                if (arr[i] < 0) then
                begin
                    writeln(arr[i]);
                end;
            end;
        end else if (kond = 0) then
        begin
            for i:=0 to (N-1) do
            begin
                if (arr[i] = 0) then
                begin
                    banyak := banyak + 1;
                end;
            end;
            writeln(banyak);
        end else { kond < 0 }
        begin
            for i:=0 to (N-1) do
            begin
                if (arr[i] > 0) then
                begin
                    banyak := banyak + 1;
                end;
            end;
            writeln(banyak);
            for i:=0 to (N-1) do
            begin
                if (arr[i] > 0) then
                begin
                    writeln(arr[i]);
                end;
            end;
        end;
    end else { N = 0 }
    begin
        writeln('Tidak ada bilangan');
    end;
end.
