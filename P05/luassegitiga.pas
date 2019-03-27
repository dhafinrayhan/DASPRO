Program luassegitiga;
{ Menerima masukan 2 buah bilangan real a dan t dengan a = alas segitiga dan t = tinggi segitiga
  dan menghasilkan luas segitiga berdasarkan rumus: luas = 1/2 * a * t }
{ Asumsi: a > 0, t > 0 }
{ KAMUS }
var
    a, t, luas : real;
{ ALGORITMA }
begin
    { Input a, t }
    readln(a, t);
    { Menghitung luas segitia dan ditampilkan ke layar }
    luas := 0.5 * a * t;
    writeln(luas:0:3);
end.
