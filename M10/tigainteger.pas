(* NIM/Nama : 16518332/Dhafin Rayhan Ahmad *)
(* Tanggal  : 22 Maret 2019 *)
Program TigaInteger;
(* Input: 3 integer: A, B, C *)
(* Output: Sifat integer dari A, B, C (positif/negatif/nol dan ganjil/genap) 
           Nilai maksimum, minimum, dan nilai tengah *)
 
(* KAMUS *)
var
       A, B, C : integer;
       nilaitengah : integer;
 
(* PROCEDURE DAN FUNCTION *)
procedure CekInteger (x : integer);
(* I.S.: x terdefinisi *)
(* F.S.: Jika x positif dan genap, maka tertulis di layar: POSITIF-GENAP
         Jika x positif dan ganjil, maka tertulis di layar: POSITIF-GANJIL
         Jika x negatif, maka tertulis di layar: NEGATIF
         Jika x nol, maka tertulis di layar: NOL *)
(* Tuliskan realisasi prosedur CekInteger di bawah ini *)
begin
       if (x > 0) then
       begin
              if ((x mod 2) = 0) then
              begin
                     writeln('POSITIF-GENAP');
              end else (* (x mod 2) = 1 *)
              begin
                     writeln('POSITIF-GANJIL');
              end;
       end else if (x < 0) then
       begin
              writeln('NEGATIF');
       end else (* x = 0 *)
       begin
              writeln('NOL');
       end;
end;

function Max (a, b, c : integer) : integer;
(* menghasilkan nilai terbesar di antara a, b, c *)
(* Tuliskan realisasi fungsi Max di bawah ini *)
begin
       if (a > b) then
       begin
              if (a > c) then
              begin
                     Max := a;
              end else (* a <= c *)
              begin
                     Max := c;
              end;
       end else if (b > c) then
       begin
              Max := b;
       end else (* b <= c *)
       begin
              Max := c;
       end;
 end;
 
function Min (a, b, c : integer): integer;
(* menghasilkan nilai terkecil di antara a, b, c *)
(* Tuliskan realisasi fungsi Min di bawah ini *)
begin
       if (a < b) then
       begin
              if (a < c) then
              begin
                     Min := a;
              end else (* a >= c *)
              begin
                     Min := c;
              end;
       end else if (b < c) then
       begin
              Min := b;
       end else (* b >= c *)
       begin
              Min := c;
       end;
 end;
        
(* PROGRAM UTAMA *)
begin
       (* Input *)
       readln(A);
       readln(B);
       readln(C);
       
       (* Menuliskan sifat integer *)
       CekInteger(A);
       CekInteger(B);
       CekInteger(C);
       
       (* Penulisan maksimum, minimum, dan nilai tengah *)
       writeln(Max(A,B,C));
       writeln(Min(A,B,C));
       nilaitengah := A + B + C - Max(A,B,C) - Min(A,B,C); 
       writeln(nilaitengah);
end.
