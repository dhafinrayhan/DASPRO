{ NIM/Nama : 16518332/Dhafin Rayhan Ahmad }
{ Tanggal  : 22 Maret 2019 }
     
unit upecahan;
 
interface
     { Type pecahan }
     type pecahan = record
                         n : integer;
                         d : integer;
                    end;
 
     { Deklarasi Fungsi/Prosedur }
     function IsPecahanValid (var n, d : integer) : boolean;
     procedure TulisPecahan (var P : pecahan);
     function isLebihKecil (var P1, P2 : pecahan) : boolean;
     function Selisih (var P1, P2 : pecahan) : pecahan;
     
implementation
     function IsPecahanValid (var n, d : integer) : boolean;
     { Menghasilkan true jika n dan d dapat membentuk pecahan yang valid dengan n 
       sebagai pembilang dan d sebagai penyebut, yaitu jika n >= 0 dan d > 0 }
     begin
          if (n >= 0) and (d > 0) then
          begin
               IsPecahanValid := true;
          end else { (n < 0) or (d <= 0) }
          begin
               IsPecahanValid := false;
          end;
     end;
     
     procedure TulisPecahan (var P : pecahan);
     { Menuliskan pecahan P ke layar dalam bentuk "P.n/P.d" }
     { I.S.: P terdefinisi }
     { F.S.: P tercetak di layar dalam bentuk "P.n/P.d" }
     begin
          write(P.n, '/', P.d);
     end;
     
     function isLebihKecil (var P1, P2 : pecahan) : boolean;
     { Menghasilkan true jika P1 lebih kecil dari P2 }
     begin
          isLebihKecil := ((P1.n*P2.d) < (P2.n*P1.d));
     end;
     
     function Selisih (var P1, P2 : pecahan) : pecahan;
     { Menghasilkan pecahan selisih antara P1 dengan P2 atau P1 - P2 }
     begin
          Selisih.n := P1.n*P2.d - P2.n*P1.d;
          Selisih.d := P1.d*P2.d;
     end;
end.