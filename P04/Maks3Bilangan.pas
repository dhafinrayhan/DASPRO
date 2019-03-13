Program Maks3Bilangan;
{ Menerima masukan 3 bilangan dan menuliskan bilangan terbesar ke layar }
{ Asumsi: A, B, C bilangan yang berbeda }
{ KAMUS }
var
    A, B, C : integer;
{ ALGORITMA }
begin
    { Input A, B, C }
    readln(A, B, C);
    { Penentaun dan pencetakan bilangan terbesar }
    if (A > B) and (A > C) then
    begin
        writeln(A);
    end else if (B > A) and (B > C) then
    begin
        writeln(B);
    end else { C > A and C > B }
    begin
        writeln(C);
    end;
end.
