unit uAkun;

interface
    uses uType, uHash;
    procedure genTab;
    procedure register (logInfo : User; var dUser : userArr);
    procedure login (var logInfo : User; var logStatus : boolean; dUser : userArr);

implementation
	{ KAMUS }
	var
		gTA, gTB : groupTab; { tabel grup untuk keperluan hashing }

	{ PROSEDUR }
	procedure genTab;
	{ I.S. : tabel gTA dan gTB belum terinisialisasi }
	{ F.S. : tabel gTA dan gTB sudah terisi dengan tabel-tabel hashing }
	begin
		generate(gTA, gTB);
	end;

    procedure register (logInfo : User; var dUser : userArr);
    var
        inNama, inAlamat, inUsername, inPassword : string;
        arrlen : integer;
    begin
        if logInfo.Role = 'admin' then
        begin
            write('Masukkan nama pengunjung: ');
            readln(inNama);
            write('Masukkan alamat pengunjung: ');
            readln(inAlamat);
            write('Masukkan username pengunjung: ');
            readln(inUsername);
            write('Masukkan password pengunjung: ');
            readln(inPassword);
            arrlen := dUser.Neff;
            extend(dUser);
            dUser.Tab[arrlen].Nama := inNama;
            dUser.Tab[arrlen].Alamat := inAlamat;
            dUser.Tab[arrlen].Username := inUsername;
            dUser.Tab[arrlen].Password := secure(inPassword, gTA, gTB);
            dUser.Tab[arrlen].Role := 'pengunjung';
            writeln();
            writeln('Pengunjung ', inNama, ' berhasil terdaftar sebagai user.');
        end else
        begin
            writeln(errorMsg);
        end;
    end;

    procedure login (var logInfo : User; var logStatus : boolean; dUser : userArr);
    var
        inUser, inPass : string;
        found : boolean;
        arrlen, i : integer;
    begin
        arrlen := dUser.Neff;
        if logStatus = false then
        begin
            write('Masukkan username: ');
            readln(inUser);
            write('Masukkan password: ');
            readln(inPass);
            found := false; i := 0;
            while (i < arrlen) and (not(found)) do
            begin
                if dUser.Tab[i].Username = inUser then
                begin
                    found := true;
                end else
                begin
                    i := i + 1;
                end;
            end;
            writeln();
            if found and (dUser.Tab[i].Password = secure(inPass, gTA, gTB)) then
            begin
                writeln('Selamat datang ', dUser.Tab[i].Nama, '!');
                logInfo.Nama := dUser.Tab[i].Nama;
                logInfo.Alamat := dUser.Tab[i].Alamat;
                logInfo.Username := dUser.Tab[i].Username;
                logInfo.Password := dUser.Tab[i].Password;
                logInfo.Role := dUser.Tab[i].Role;
                logStatus := true;
            end else
            begin
                writeln('Username / password salah! Silakan coba lagi.');
            end;
        end else
        begin
            writeln('Anda sudah login!');
        end;
    end;
end.
