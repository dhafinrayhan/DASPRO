Program air;
{ Membaca sebuah nilai T, suatu bilangan integer yang menyatakan temperatur air dalam derajat celcius
  untuk kondisi tekanan 1 atm. }
{ Asumsi: A, B, C bilangan yang berbeda }
{ KAMUS }
var
    T : integer;
{ ALGORITMA }
begin
    { Input T }
    readln(T);
    { Penentuan kondisi air }
    if (T < 0) then
    begin
        writeln('PADAT');
    end else if (T > 0) and (T < 100) then
    begin
        writeln('CAIR');
    end else if (T > 100) then
    begin
        writeln('GAS');
    end else if (T = 0) then
    begin
        writeln('ANTARA PADAT-CAIR');
    end else { T = 100 }
    begin
        writeln('ANTARA CAIR-GAS');
    end;
end.
