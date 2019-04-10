{ NIM/Nama	: 16518332/Dhafin Rayhan Ahmad }
{ Tanggal	: 10 April 2019 }

Program resistor;
{ Menerima masukkan 3 buah nilai resistor lalu menghitung 
  resistansi total berdasarkan jenis rangkaian yang dipakai }

{ KAMUS }
var
	R1, R2, R3, RT : real;
	pilihan : char;
	stop : boolean;

{ ALGORITMA }
begin
	stop := false; { inisiasi }
	{ Skema pengulangan berdasarkan kondisi berhenti }
	repeat
		readln(R1, R2, R3);
		readln(pilihan);
		if (R1 > 0) and (R2 > 0) and (R3 > 0) and ((pilihan = 's') or (pilihan = 'S') or (pilihan = 'p') or (pilihan = 'P')) then { validasi masukan }
		begin
			stop := true;
		end else
		begin
			writeln('Masukan salah'); { pesan kesalahan }
		end;
	until stop; { kondisi berhenti dicapai }
	{ Menghitung nilai resistansi total }
	if (pilihan = 's') or (pilihan = 'S') then { rangkaian seri }
	begin
		RT := R1 + R2 + R3;
	end else { (pilihan = 'p') or (pilihan = 'P') } { rangkaian paralel }
	begin
		RT := 1 / (1/R1 + 1/R2 + 1/R3);
	end;
	{ Menampilkan hasil }
	writeln(RT:0:2);
end.
