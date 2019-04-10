{ NIM/Nama	: 16518332/Dhafin Rayhan Ahmad }
{ Tanggal	: 10 April 2019 }

Program tinggi;
{ Membaca beberapa masukan tinggi mahasiswa sampai mark, lalu menuliskan 
  jumlah mahasiswa keseluruhan, dengan tinggi <=150, dengan tinggi >=170, 
  dan rata-rata tingginya }

{ KAMUS }
var
	total, mhs_total, mhs_pendek, mhs_tinggi, inTinggi : integer;

{ ALGORITMA }
begin
	{ Skema pemrosesan sekuensial dengan MARK }
	total := 0; mhs_total := 0; mhs_pendek := 0; mhs_tinggi := 0; { inisiasi }
	readln(inTinggi); { first element }
	while (inTinggi <> -999) do { EOP: inTinggi = -999 }
	begin
		if (inTinggi >= 100) and (inTinggi <= 300) then { validasi }
		begin
			mhs_total := mhs_total + 1; { proses current element }
			total := total + inTinggi;
			if (inTinggi <= 150) then
			begin
				mhs_pendek := mhs_pendek + 1;
			end else if (inTinggi >= 170) then
			begin
				mhs_tinggi := mhs_tinggi + 1;
			end;
		end;
		readln(inTinggi); { next element }
	end;
	{ terminasi }
	if mhs_total = 0 then
	begin
		writeln('Data kosong');
	end else { mhs_total > 0 }
	begin
		writeln(mhs_total);
		writeln(mhs_pendek);
		writeln(mhs_tinggi);
		writeln(round((total/mhs_total)));
	end;
end.
