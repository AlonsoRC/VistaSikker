create database Sikker;
use Sikker;
create table Usuario(
id_usu int(3) primary key auto_increment,
nombre varchar(30),
contra varchar(18));
insert into Usuario (nombre,contra) values("RubenHH","Ocarina");
insert into Usuario (nombre,contra) values("KatiaJA","Gatos");

delimiter $$
create procedure sp_log(
in nom varchar(20),
in psd varchar(18))
begin
    declare existe int;
    declare comcontra int;
    declare xMsj varchar(50);
    
    set existe=(select count(*) from Usuario where nombre=nom);
    if(existe=0) then
		set xMsj='!=existe'; 
    else
		set comcontra=(select count(*) from Usuario where nombre=nom and contra=psd);
        if(comcontra=0) then
			set xMsj='!=contra';
        else
			set xMsj='true';
        end if;
    end if;

    select xMsj;

end; $$

delimiter ;  

call sp_log("RubenHH","Ocarina");