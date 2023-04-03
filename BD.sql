drop database if exists Usus;
create database Usus;
use Usus;


create table Usuario(
idUsuario int not null primary key,
nombre nvarchar(120) not null,
usuario nvarchar(120) not null,
correo nvarchar(120) not null,
contra nvarchar(120) not null,
alta int not null default 0,
gen nvarchar(100) not null,
edad int(3)not null
);
##select alta as contador from Usuario where idUsuario=1;
select * from uEmpresa;

#select * from uEmpresa;
#select * from Usuario;
#select * from DPersonales;
#call guardaUsuario(0,'Angel','Nearsy','a@a.com','hola','masculino',20);
##call guardaUsuario(1,'Near','Angel','a@|a.com','contra','masculino',21);
##insert into DPersonales values(1,1,1482000,'soltero','5510203040','1020301020');
#select * from DPersonales;
#select * from DPersonales;
create table DPersonales(
idDPer int not null primary key,
idUsuario int(5) not null,
Ncomple nvarchar(100) not null,
fechaN nvarchar(20) not null,
eCivil nvarchar(10) not null,
tCasa nvarchar(10) null,
tCelular nvarchar(10) null,
nacionalidad nvarchar(20) not null,
twit nvarchar(200) null default 'No cuento con Twitter',
face nvarchar(200) null default 'No cuento con Facebook',
descripcion nvarchar (200) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario)
);
create table DireccionUsuarios(
idDirU int not null primary key,
idUsuario int(5) not null,
calle nvarchar (60) not null,
colonia nvarchar(60) not null,
delegacion nvarchar(60) not null,
numero int(5) not null,
codigoPostal int(8) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario)
);
#select * from ExperienciaLaboral;
create table ExperienciaLaboral(
idELaboral int not null primary key,
idUsuario int(5) not null,
fecha nvarchar(20) not null,
descripcion nvarchar(200) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario)
);

create table ExperienciaAcademica(
idEAcademica int not null primary key,
idUsuario int(5) not null,
fecha nvarchar(20) not null,
descripcion nvarchar(200) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario)
);

create table Software(
idSof int not null primary key,
idUsuario int(5) not null,
nivel nvarchar(20) not null,
descripcion nvarchar(200) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario)
);

create table idioma(
idIdioma int not null primary key,
idUsuario int(5) not null,
nivel nvarchar(20) not null,
descripcion nvarchar(200) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario)
);

create table uEmpresa(
idEmpresa int not null primary key,
nombreE nvarchar(120) not null,
usuarioE nvarchar(120) not null,
correoE nvarchar(120) not null,
contra nvarchar(120) not null,
alta int not null default 0
);

create table infoEm(
idInfo int not null primary key,
idEmpresa int(5) not null,
TEmpleo nvarchar (50) not null,
Del nvarchar(50) not null,
horario nvarchar(100) not null,
comentarios nvarchar(300) not null,
link nvarchar(500) not null,
constraint foreign key(idEmpresa) references uEmpresa(idEmpresa)
);

create table enCurri(
idEnCu int not null primary key,
idEmpresa int(5) not null,
idUsuario int(5) not null,
idInfo int(5) not null,
usr nvarchar(120) not null,
constraint foreign key(idEmpresa) references uEmpresa(idEmpresa),
constraint foreign key(idUsuario) references Usuario(idUsuario),
constraint foreign key(idInfo) references infoEm(idInfo)
);

create table llavesEmpresa(
idEmpresa int (5) not null,
contador int(5) not null default 0,
llavePublica nvarchar(600) not null,
llavePrivada nvarchar(600) not null,
cPub nvarchar(20) not null,
cPriv nvarchar(20) not null,
constraint foreign key(idEmpresa) references uEmpresa(idEmpresa)
);

create table llavesUsuario(
idUsuario int (5) not null,
contador int(5) not null default 0,
llavePublica nvarchar(600) not null,
llavePrivada nvarchar(600) not null,
cPub nvarchar(20) not null,
cPriv nvarchar(20) not null,
 constraint foreign key(idUsuario) references Usuario(idUsuario)
);
create table msjUsr(
idUsuario int(5) not null,
idEmpresa int(5) not null,
idInfo int(5) not null,
msj nvarchar(200) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario),
constraint foreign key(idEmpresa) references uEmpresa(idEmpresa),
constraint foreign key(idInfo) references infoEm(idInfo)
);
create table msjUse(
idUsuario int(5) not null,
idEmpresa int(5) not null,
idInfo int(5) not null,
msj nvarchar(5) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario),
constraint foreign key(idEmpresa) references uEmpresa(idEmpresa),
constraint foreign key(idInfo) references infoEm(idInfo)
);
create table msjEm(
idEmpresa int(5) not null,
idUsuario int(5) not null,
idInfo int(5) not null,
msj nvarchar(200) not null,
clave nvarchar(20) not null,
constraint foreign key(idUsuario) references Usuario(idUsuario),
constraint foreign key(idEmpresa) references uEmpresa(idEmpresa),
constraint foreign key(idInfo) references infoEm(idInfo)
);
drop procedure if exists guardaUsuario;

delimiter **
create procedure guardaUsuario(in idE int, in nom nvarchar(120), in usu nvarchar(120), in corr nvarchar(120), in cont nvarchar(120), in gnd nvarchar(100),in ed int(3)##,in nac nvarchar(20),in des nvarchar(200)
)
begin 
declare aidi int;
declare existe int;
declare msj nvarchar(200);
declare existeCorreo int;
declare existeE int;
declare existeCE int;
set aidi = 0;

if idE = 0 then
	
    set existe = (select count(*) from Usuario where usuario = usu);
    set existeCorreo = (select count(*) from Usuario where correo = corr);
    set existeE = (select count(*) from uEmpresa where usuarioE=usu);
    set existeCE =(select count(*) from uEmpresa where correoE=corr);
    if (existe = 0 and existeCorreo = 0 and existeE=0 and existeCE=0)  then

		set aidi = (select ifnull(max(idUsuario), 0) + 1 from Usuario);
        
		insert into Usuario (idUsuario, nombre, usuario, correo, contra, gen, alta,edad##,nacionalidad,descripcion
        )
					values(aidi, nom, usu, corr, md5(cont), gnd, 0, ed##,nac,des
                    );
		
        
                    
		set msj =  'Cliente guardado con exito';
    
    else
		if(existe = 1 or existeE=1) then
			set msj = 'Ya existe un usuario con ese nombre';
            
		else
			set msj = 'Ya existe un usuario con ese correo';
            
		end if;
    end if;
    
else
set aidi = idE;

	if((select count(*) from Usuario where idUsuario = aidi = 1)) then
		set msj =  'actualizo';
        
        update Usuario set nombre = nom , usuario = usu where idUsuario = aidi;
        update Usuario set correo=corr, contra=md5(cont), gen=gnd,edad=ed where idUsuario=aidi;
        
    else
		set msj =  'nel';
        
    end if;
end if;
if(msj='Cliente guardado con exito') then
	select msj as Resultado, idUsuario as usuarioId,concat(nombre) NombreC from Usuario where nombre = nom and usuario = usu and correo = corr; 
else
	select msj as Resultado, 0 as usuarioId, 'null' as NombreC;
end if;
##select idUsuario as usuarioId, concat(nombre) NombreC, msj from Usuario where nombre = nom and usuario = usu and correo = corr and gen = gnd and edad=ed;

end; **

delimiter ;

##call guardaEmpresa(0,'Empresa','empe','as@as.com','1234');
##select * from uEmpresa;

drop procedure if exists guardaEmpresa;
delimiter **
create procedure guardaEmpresa(in id int, in nome nvarchar(120),in usue nvarchar(120), in corre nvarchar(120), in cont nvarchar(120))
begin
declare ide int;
declare existe int;
declare msj nvarchar(200);
declare existeCorreo int;
declare existeU int;

set ide=0;

if id=0 then
	set existe=(select count(*) from uEmpresa where usuarioE=usue);
    set existeCorreo=(select count(*) from uEmpresa where correoE=corre);
    set existeU=(select count(*) from Usuario where usuario=usue);
    if(existe=0 and existeCorreo=0 and existeU=0)then
        set ide = (select ifnull(max(idEmpresa), 0) + 1 from uEmpresa);
        insert into uEmpresa(idEmpresa,nombreE,usuarioE,correoE,contra,alta)
        values(ide,nome,usue,corre,md5(cont),0);
        set msj='Cliente guardado con exito';
	else
		if(existe=1 or existeU=1) then
			set msj='Ya existe un usuario con ese nombre';
		else
			set msj='Ya existe un usuario con ese correo';
        end if;
        
    end if;
else
	set ide=id;
		if((select count(*) from uEmpresa where idEmpresa = ide = 1)) then
		set msj =  'actualizo';
        
        update uEmpresa set nombreE = nome , usuarioE = usue where idEmpresa = ide;
        update uEmpresa set correoE=corre,contra=md5(cont) where idEmpresa =ide;
        
        
    else
		set msj =  'nel';
        
    end if;
end if;
if(msj='Cliente guardado con exito' or msj='actualizo') then
	select msj, idEmpresa as usuarioId, concat(nombreE) NombreC from uEmpresa where nombreE = nome and usuarioE = usue and correoE = corre;
else
	select msj;
end if;
end; **

delimiter ;

drop procedure if exists spDatosUsuario;
delimiter $$
create procedure spDatosUsuario(in idper int)
begin

	select *, concat(nombre) as NombreC from Usuario where idUsuario = idper;
		

end; $$
delimiter ;

drop procedure if exists spDatosUsuarioE;
delimiter $$
create procedure spDatosUsuarioE(in iduse int)
begin

	select *, concat(nombreE) as NombreC from uEmpresa where idEmpresa=iduse;
    
end; $$
delimiter ;

drop procedure if exists guardaAlta;
delimiter **
create procedure guardaAlta(in idE int, in alt int)
begin
declare aidi int;
declare msj nvarchar(120);

set aidi = idE;
	if((select count(*) from Usuario where idUsuario = aidi = 1)) then
		set msj =  'actualizo';
        
        
        update Usuario set alta = alt where idUsuario = aidi;
        
    else
		set msj =  'No hay nadie con esa aidi';
    end if;
    
    select msj, concat(idUsuario) as idUser, concat(alta) as Alta from Usuario where idUsuario = aidi;

end; **

delimiter ;

drop procedure if exists guardaAltaE;
delimiter **
create procedure guardaAltaE(in ide int,in alt int)
begin
declare aidi int;
declare msj nvarchar(120);

set aidi = ide;
	if((select count(*) from uEmpresa where idEmpresa = aidi = 1)) then
		set msj =  'actualizo';
        
        
        update uEmpresa set alta = alt where idEmpresa = aidi;
        
    else
		set msj =  'No hay nadie con esa aidi';
    end if;
    
    select msj, concat(idEmpresa) as idUser, concat(alta) as Alta from uEmpresa where idEmpresa = aidi;
end;**
delimiter ;

	##call spValidaUsuario('Near','1234');

drop procedure if exists spValidaUsuario;
delimiter **
create procedure spValidaUsuario(in usr nvarchar(200), in psw  nvarchar(60))
begin
declare existe int;
declare msj nvarchar(200);
declare idPer int;


set existe = (select count(*) from Usuario where usuario = usr and contra = md5(psw));

if (existe = 1) then

	set msj = 'Es un usuario';
	select idUsuario as idPer, concat(nombre) NombreC, msj from Usuario where usuario = usr and contra = md5(psw);

else
	set existe =(select count(*) from uEmpresa where usuarioE=usr and contra =md5(psw));
    if(existe=1) then
		set msj='Es una empresa';
        select idEmpresa as idPer,concat(nombreE) NombreC, msj from uEmpresa where usuarioE=usr and contra=md5(psw);
    else
		set msj = 'no existe el papu :v';
		select 0 as idPer, msj;
	end if;

end if;

end; **
delimiter ;

#call guardaDPersonalesU(1,1,'GAngel Fuentes','09121997','Indefinido','5512131614','5578794112','mexicano cx','twit',
#'face','Soy Dios');
select * from DPersonales;
drop procedure if exists guardaDPersonalesU;
delimiter **
create procedure guardaDPersonalesU(in idDP int(5), in idu int(5),in nc nvarchar(100), in fn nvarchar(20),
 in eciv nvarchar(10),in tca nvarchar(10),in tcel nvarchar(10),in nac nvarchar(20),in tw nvarchar(200), 
 in fb nvarchar(200), in des nvarchar(200))
 begin
 declare existe int;
 declare msj nvarchar(200);
 declare idsr int;
declare existe2 int;
declare existex int;

 
 set existe = (select count(*) from Usuario where idUsuario = idu);
 
 if(existe=1) then	
	
	set existe2= (select count(*) from DPersonales where idDPer=idDP and idUsuario=idu);
    if(existe2=0) then
    
		set idsr=(select ifnull(max(idDPer), 0) + 1 from DPersonales);
        if(tw='' and fb='') then
        
        insert into DPersonales(idDPer,idUsuario,Ncomple, fechaN,eCivil,tCasa,tCelular,nacionalidad,descripcion)
				values(idsr, idu,nc,fn,eciv,tca,tcel,nac,des);
                
                set msj='Datos Personales guardados exitosamente';
		else
			if(tw!='' and fb!='') then
				insert into DPersonales(idDPer,idUsuario,Ncomple, fechaN,eCivil,tCasa,tCelular,nacionalidad,twit,face,descripcion)
						values(idsr, idu,nc,fn,eciv,tca,tcel,nac,tw,fb,des);
                
						set msj='Datos Personales guardados exitosamente';
            
            else
				if(tw='')then
					insert into DPersonales(idDPer,idUsuario,Ncomple, fechaN,eCivil,tCasa,tCelular,nacionalidad,face,descripcion)
						values(idsr, idu,nc,fn,eciv,tca,tcel,nac,fb,des);
                
						set msj='Datos Personales guardados exitosamente';
				end if;
				if(fb='') then
            
					insert into DPersonales(idDPer,idUsuario,Ncomple, fechaN,eCivil,tCasa,tCelular,nacionalidad,twit,descripcion)
						values(idsr, idu,nc,fn,eciv,tca,tcel,nac,tw,des);
                
						set msj='Datos Personales guardados exitosamente';
            
				end if;
			end if;
		end if;
        
    else
		update DPersonales set fechaN=fn, eCivil=eciv,tCasa=tca,tCelular=tcel where idDPer=idDP;
		set msj='actualizo';
    
    end if;
 else
		set msj='No existe Usuario';
 end if;
 
 select msj as Resultado;
 
 end; **

delimiter ;

drop procedure if exists obtenDPersonalesU;
delimiter **

create procedure obtenDPersonalesU(in iduse int(5))
begin
declare existe int;
declare msj nvarchar(150);

set existe=(select count(*) from Usuario where idUsuario=iduse);

if (existe=1) then
	set existe=0;
    set existe=(select count(*) from DPersonales where idUsuario=iduse);
    if(existe=1) then
		set msj='Bien';
    
    else
		set msj='El usuario no ha registrado sus datos personales';
    end if;

else
	set msj='Este usuario no existe';
end if;

select msj as Resultado,Ncomple as Nombre,fechaN as FechaDeNacimiento, eCivil as EstadoCivil, tCasa as TelefonoCasa, tCelular as TelefonoCelular, nacionalidad as Nacionalidad, 
twit as Twiter, face as Facebook, descripcion as Descripcion from DPersonales where idUsuario=iduse;

end; **

delimiter ;


##call guardaDirecU(0,1,'calle','colonia','neza',56,5794);

drop procedure if exists guardaDirecU;
delimiter **

create procedure guardaDirecU(in idDi int(5),in idus int(5),in cal nvarchar(60), in col nvarchar(60),
in del nvarchar(60), in num int(5),in cp int(8))
begin
declare existe int;
declare msj nvarchar(200);
declare idDU int;

set existe =(select count(*) from Usuario where idUsuario=idus);

if(existe=1) then
	
    set existe=(select count(*) from DireccionUsuarios where idDirU=idDi);
    
    if(existe=0) then
    
		set idDU=(select ifnull(max(idDirU), 0) + 1 from DireccionUsuarios);
    
		insert into DireccionUsuarios(idDirU,idUsuario,calle,colonia,delegacion,numero,codigoPostal)
			values(idDU,idus,cal,col,del,num,cp);
        set msj='Registro guardado';
    
    else
		set msj='actualizo';
        update DireccionUsuarios set calle=cal,colonia=col,delegacion=del,numero=num,codigoPostal=cp where idDirU=idDi;
	end if;

else
	set msj='El usuario no existe';
end if;

select msj as Resultado;

end; **
delimiter ;

##call obtenDirecU(1);

drop procedure if exists obtenDirecU;
delimiter **

create procedure obtenDirecU(in iduse int(5))
begin
declare existe int;
declare msj nvarchar(100);

set existe=(select count(*) from DireccionUsuarios where idUsuario=iduse);

if(existe=1) then
	set msj='Bien';
    
else
	set msj='El registro no se ha hecho';
end if;

select msj as Resultado, calle as Calle,colonia as Colonia,delegacion as Delegacion,numero as Num,codigoPostal as CP from DireccionUsuarios where idUsuario=iduse;

end;**
delimiter ;

#call guardaExLabU(0,1,'0105200','dar clases cx');


drop procedure if exists guardaExLabU;
delimiter **

create procedure guardaExLabU(in idex int(5), in iduse int(5),in fec nvarchar(20),in des nvarchar(200))
begin
declare existe int;
declare msj nvarchar(100);
declare id int;

set existe=(select count(*) from ExperienciaLaboral where idELaboral=idex);

if(existe=0) then
		set id=(select ifnull(max(idELaboral), 0) + 1 from ExperienciaLaboral);
        insert into ExperienciaLaboral(idELaboral, idUsuario, fecha, descripcion)
			values(id,iduse,fec,des);
		set msj='Datos guardados';

else

	set msj='actualiza';
    update ExperienciaLaboral set fecha=fec,descripcion=des where idELaboral=idex;

end if;

select msj as Resultado;
end;**
delimiter ;

##call obtenExLabU(1);

drop procedure if exists obtenExLabU;
delimiter **

create procedure obtenExLabU(in iduse int(5))
begin
declare existe int;
declare msj nvarchar(100);

set existe = (select count(*) from ExperienciaLaboral where idUsuario=iduse);

if (existe>0) then
	set msj='bien';
else
	set msj='Registro aun no hecho';

end if;
select msj as Resultado, fecha as Fecha, descripcion as Descripcion from ExperienciaLaboral where idUsuario=iduse;
end;**
delimiter ;

#call guardaExAcU(0,1,'0501200','una escuela más');


drop procedure if exists guardaExAcU;
delimiter **

create procedure guardaExAcU(in idex int(5), in iduse int(5),in fec nvarchar(20),in des nvarchar(200))
begin
declare existe int;
declare msj nvarchar(100);
declare id int;

set existe=(select count(*) from ExperienciaAcademica where idEAcademica=idex);

if(existe=0) then
		set id=(select ifnull(max(idEAcademica), 0) + 1 from ExperienciaAcademica);
        insert into ExperienciaAcademica(idEAcademica, idUsuario, fecha, descripcion)
			values(id,iduse,fec,des);
		set msj='Datos guardados';

else

	set msj='actualiza';
    update ExperienciaAcademica set fecha=fec,descripcion=des where idEAcademica=idex;

end if;

select msj as Resultado;
end;**
delimiter ;

#call obtenExAcU(1);

drop procedure if exists obtenExAcU;
delimiter **

create procedure obtenExAcU(in iduse int(5))
begin
declare existe int;
declare msj nvarchar(100);

set existe = (select count(*) from ExperienciaAcademica where idUsuario=iduse);

if (existe>0) then
	set msj='bien';
else
	set msj='Registro aun no hecho';

end if;
select msj as Resultado, fecha as Fecha, descripcion as Descripcion from ExperienciaAcademica where idUsuario=iduse;
end;**
delimiter ;

#call guardaExSofU(0,1,'avanzado','Java cx');

drop procedure if exists guardaExSofU;
delimiter **

create procedure guardaExSofU(in idex int(5), in iduse int(5),in fec nvarchar(20),in des nvarchar(200))
begin
declare existe int;
declare msj nvarchar(100);
declare id int;

set existe=(select count(*) from Software where idSof=idex);

if(existe=0) then
		set id=(select ifnull(max(idSof), 0) + 1 from Software);
        insert into Software(idSof, idUsuario, nivel, descripcion)
			values(id,iduse,fec,des);
		set msj='Datos guardados';

else

	set msj='actualiza';
    update Software set nivel=fec,descripcion=des where idSof=idex;

end if;

select msj as Resultado;
end;**
delimiter ;

##call obtenExSofU(1);

drop procedure if exists obtenExSofU;
delimiter **

create procedure obtenExSofU(in iduse int(5))
begin
declare existe int;
declare msj nvarchar(100);

set existe = (select count(*) from Software where idUsuario=iduse);

if (existe>0) then
	set msj='bien';
else
	set msj='Registro aun no hecho';

end if;
select msj as Resultado, nivel as Nivel, descripcion as Descripcion from Software where idUsuario=iduse;
end;**
delimiter ;

#call guardaExIdU(1,1,'Muy chido','Inglés');

drop procedure if exists guardaExIdU;
delimiter **

create procedure guardaExIdU(in idex int(5), in iduse int(5),in fec nvarchar(20),in des nvarchar(200))
begin
declare existe int;
declare msj nvarchar(100);
declare id int;

set existe=(select count(*) from Idioma where idIdioma=idex);

if(existe=0) then
		set id=(select ifnull(max(idIdioma), 0) + 1 from Idioma);
        insert into Idioma(idIdioma, idUsuario, nivel, descripcion)
			values(id,iduse,fec,des);
		set msj='Datos guardados';

else

	set msj='actualiza';
    update Idioma set nivel=fec,descripcion=des where idIdioma=idex;

end if;

select msj as Resultado;
end;**
delimiter ;

#call obtenExIdU(1);

drop procedure if exists obtenExIdU;
delimiter **

create procedure obtenExIdU(in iduse int(5))
begin
declare existe int;
declare msj nvarchar(100);

set existe = (select count(*) from Idioma where idUsuario=iduse);

if (existe>0) then
	set msj='bien';
else
	set msj='Registro aun no hecho';

end if;
select msj as Resultado, nivel as Nivel, descripcion as Descripcion from Idioma where idUsuario=iduse;
end;**
delimiter ;

#call guardaInfoEm(0,1,'h','h','32','ganas chido','jklj');


drop procedure if exists guardaInfoEm;
delimiter **

create procedure guardaInfoEm(in idex int(5), in iduse int(5),in tem nvarchar(50),in del nvarchar(50),
in hor nvarchar(100),in comen nvarchar(300),in lin nvarchar(500))
begin
declare existe int;
declare msj nvarchar(100);
declare id int;

set existe=(select count(*) from infoEm where idInfo=idex);

if(existe=0) then
		set id=(select ifnull(max(idInfo), 0) + 1 from infoEm);
        insert into infoEm(idInfo, idEmpresa, TEmpleo, Del,horario,comentarios,link)
			values(id,iduse,tem,del,hor,comen,lin);
		set msj='Datos guardados';

else

	set msj='actualiza';
    update infoEm set TEmpleo=tem,Del=del, horario=hor,comentarios=comen,link=lin where idInfo=idex;

end if;

select msj as Resultado;
end;**
delimiter ;

##select idInfo as id,TEmpleo as TipoEmpleo, comentarios as Comentarios,link as img from infoEm;
#call obteninfoEm(1)
#select * from infoEm;
#call obteninfoEm(1);

drop procedure if exists obteninfoEm;
delimiter **

create procedure obtenInfoEm(in iduse int(5))
begin
declare existe int;

set existe = (select count(*) from infoEm where idEmpresa=iduse);

if (existe>0) then
	
	select existe as num, idInfo as ID, TEmpleo as TipoEmpleo, Del as Delegacion, horario as Horario, 
		comentarios as Comentario,link as img from infoEm where idEmpresa=iduse;
else
	select 0 as num, 0 as ID,'' as TipoEmpleo, '' as Delegacion, '' as Horario, '' as Comentario, '' as img;
end if;
end;**
delimiter ;

#call enviaCurri(1,'empre');
#select idEmpresa from infoEm where idInfo =1;

drop procedure if exists enviaCurri;
delimiter **

create procedure enviaCurri(in idusr int(5),in idem int(5))
begin
declare existe int;
declare msj nvarchar(100);
declare id int;
declare idin int(5);
declare usr nvarchar(120);

set idin =(select idInfo from infoEm where idEmpresa = idem);

set usr =(select usuario from Usuario where idUsuario=idusr);

set existe =(select count(*) from enCurri where idUsuario = idusr and idInfo = idin);
if(existe=0) then
	set id=(select ifnull(max(idEnCu), 0) + 1 from enCurri);
    insert into enCurri (idEnCu,idEmpresa,idUsuario,idInfo,usr) values
    (id,idem,idusr,idin,usr);
    set msj = 'Tu curriculum fue enviado';
else
	set msj='Ya enviaste curriculum a estè empleo';
end if;
	select msj as Resultado;
end;**
delimiter ;

#select i.TEmpleo as TipoEmpleo, i.idInfo as IdInfo,e.usr as Usuario from infoEm i, enCurri e where  i.idInfo=e.idInfo and e.idUsuario=1;

#select i.TEmpleo as TipoEmpleo,e.usr as Usuario from infoEm i, enCurri e where i.idEmpresa = e.idEmpresa ;
#call verCurriEn(1);
drop procedure if exists verCurriEn;

delimiter **
create procedure verCurriEn(in idusr int(5))
begin
declare contador int;

set contador = (select count(*) from enCurri where idEmpresa = idusr);
if(contador>0) then
	select contador as num,i.TEmpleo as TipoEmpleo,e.usr as Usuario from infoEm i, enCurri e where i.idEmpresa = e.idEmpresa ;
else
	select 0 as num, '' as TipoEmpleo, '' as Usuario;
end if; 


end;**
delimiter ;

##select idInfo as id,TEmpleo as TipoEmpleo, comentarios as Comentarios,link as img from infoEm;


drop procedure if exists obtenEm;
delimiter **

create procedure obtenEm()
begin
declare existe int;

set existe = (select count(*) as Registros from infoEm);

if (existe>0) then
	
	select existe as num, idInfo as id,TEmpleo as TipoEmpleo,
		comentarios as Comentario,link as img from infoEm;
else
	select 0 as num, '' as TipoEmpleo, '' as Delegacion, '' as Horario, '' as Comentario, '' as img;
end if;
end;**
delimiter ;

drop procedure if exists guardaLlavesE;

delimiter **
create procedure guardaLlavesE(in idUs int(5),in kpu nvarchar(600),in kpr nvarchar(600),in cp nvarchar(20),
in cpr nvarchar(20))
begin
declare msj nvarchar(100);
declare existe int;
set existe=(select count(*) from llavesEmpresa where idEmpresa=idUs);
if(existe=0) then

insert into llavesEmpresa(idEmpresa,llavePublica,llavePrivada,cPub,cPriv) values
						(idUs,kpu,kpr,cp,cpr);
set msj='datos guardados';
select msj as Resultado;
else
	set msj='ya tienes tus llaves cx';
    select msj as Resultado;
end if;

end;**

delimiter ;


drop procedure if exists guardaLlavesU;

delimiter **
create procedure guardaLlavesU(in idUs int(5),in kpu nvarchar(600),in kpr nvarchar(600),in cp nvarchar(20),
in cpr nvarchar(20))
begin
declare msj nvarchar(100);
declare existe int;
set existe=(select count(*) from llavesUsuario where idUsuario=idUs);
if(existe=0) then

insert into llavesUsuario(idUsuario,llavePublica,llavePrivada,cPub,cPriv) values
						(idUs,kpu,kpr,cp,cpr);
set msj='datos guardados';
select msj as Resultado;
else
	set msj='ya tienes tus llaves cx';
    select msj as Resultado;
end if;
end;**

delimiter ;



drop procedure if exists guardaMsjU;

delimiter **
create procedure guardaMsjU(in id int(5),in idin int(5),in idem int(5),in mj nvarchar(200))
begin
declare existe int;
set existe=(select count(*) from msjUsr where idUsuario=id and idInfo=idin);

insert into msjUsr(idUsuario,idInfo,idEmpresa,msj) values(id,idin,idem,mj);

end;**

delimiter ;

drop procedure if exists guardaMsjUs;

delimiter **
create procedure guardaMsjUs(in id int(5),in idin int(5),in idem int(5),in mj nvarchar(200))
begin
declare existe int;
set existe=(select count(*) from msjUse where idUsuario=id and idInfo=idin);

insert into msjUse(idUsuario,idInfo,idEmpresa,msj) values(id,idin,idem,mj);

end;**

delimiter ;

drop procedure if exists guardaMsjE;

delimiter **
create procedure guardaMsjE(in idE int(5),in ms nvarchar(200),in cla nvarchar(20))
begin
declare existe int;

insert into msjEm (idEmpresa,msj,clave) values (idE,ms,cla);
end; **
delimiter ;

select * from llavesEmpresa;
#select * from msjUsr;
#delete from msjUsr where idUsuario=1;
##call guardaLlavesU(1,'','','','');
#call obtenEm();
#select * from Usuario;
#delete from msjUsr where idUsuario=1;
#select * from llavesUsuario; 	
#delete from llavesEmpresa where idEmpresa = 1;
#delete from llavesUsuario where idUsuario=1;
#select count(*) as contador from llavesUsuario where idUsuario=1;
#select * from llavesUsuario where idUsuario=1;