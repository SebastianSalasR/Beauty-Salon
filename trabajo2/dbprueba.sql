<select * from universidad u ;
select * from carrera c ;

insert into universidad (nombre) values('uach');

insert into carrera (nombre, id_univ) values ('informática',1);
insert into carrera (nombre, id_univ) values ('Naval',1);
insert into carrera (nombre, id_univ) values ('industrial',1);
insert into carrera (nombre, id_univ) values ('medicina',1);

select * from carrera c;

INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1111, 'juanito', '2000-01-01' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1112, 'pepito', '2000-01-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1113, 'mauri', '2000-02-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1114, 'laura', '2001-01-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1115, 'juanito1', '2000-01-01' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1116, 'pepito1', '2000-01-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1117, 'mauri1', '2000-02-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1118, 'laura1', '2001-01-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1119, 'juanito2', '2000-01-01' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1110, 'pepito2', '2000-01-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1100, 'mauri2', '2000-02-02' );
INSERT INTO public.persona (rut,nombre, fecha_nacimiento) VALUES(1101, 'laura2', '2001-01-02' );



INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1111, 2022,1);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1112, 2024,2);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1113, 2022,2);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1114, 2024,1);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1115, 2022,1);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1116, 2022,3);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1117, 2022,3);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1118, 2024,3);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1119, 2022,1);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1110, 2022,1);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1100, 2024,4);
INSERT INTO public.alumno (rut_persona, anno_ingreso, id_carrera)  VALUES(1101, 2022,1);

INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 1', 1);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 2', 1);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 3', 1);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 1', 2);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 2', 2);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 3', 2);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 1', 3);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 2', 3);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('calculo 3', 3);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('cuidado abuelos 11', 4);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('cuidado abuelos 12', 4);
INSERT INTO public.asignatura (nombre, id_carrera) VALUES('cuidado abuelos 13', 4);

select * from asignatura a;

INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2023, 1);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2023, 1);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2023, 2);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2023, 2);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2023, 3);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2023, 3);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2023, 4);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2023, 4);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2023, 5);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2023, 5);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2023, 6);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2023, 6);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2024, 1);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2024, 1);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2024, 2);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2024, 2);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2024, 3);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2024, 3);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2024, 4);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2024, 4);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2024, 5);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2024, 5);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-1', 1, 2024, 6);
INSERT INTO public.grupo_asinatura (grupo, semestre, anno_actual, id_asig) VALUES('A-2', 1, 2024, 6);

INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(1,1);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(2,1);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(3,1);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(4,1);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(5,2);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(6,2);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(7,2);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(8,2);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(9,2);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(10,2);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(11,2);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(12,1);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(1,3);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(2,3);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(3,3);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(4,4);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(5,4);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(6,4);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(7,4);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(8,4);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(9,4);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(10,5);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(11,5);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(12,5);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(1,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(2,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(3,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(4,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(5,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(6,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(7,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(8,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(9,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(10,6);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(11,7);
INSERT INTO public.alu_grupo_asig (id_alu, id_grupo_asig) VALUES(12,7);



select * from universidad u, carrera c
where u.id = c.id_univ; 
 
select * from universidad u inner join carrera c
on u.id = c.id_univ; 

select * from universidad u, carrera c
where u.id =c.id_univ and c.nombre='naval'; 

select * from universidad u inner join carrera c
on u.id =c.id_univ; 

select * from universidad u, carrera c
where u.id =c.id_univ and c.nombre='Naval'; 
 
select * from universidad u 
inner join carrera c on u.id =c.id_univ 
where c.nombre='Naval'; 


select * from universidad u inner join carrera c
on u.id =c.id_univ 
where c.nombre like '%info%'; 

select * from carrera c 
inner join asignatura a on c.id = a.id_carrera 
where a.nombre like '%abuelos%';


update asignatura  set nombre = 'cuidado abuelos 13' 
where nombre = 'cuidado abuelos 20'; 


select * from universidad u 
inner join carrera c on u.id = c.id_univ
inner join asignatura a on c.id = a.id_carrera 
where a.nombre like '%abuelos%';



select * from carrera c 
inner join asignatura a on c.id = a.id_carrera 
inner join grupo_asinatura ga on a.id = ga.id_asig  
where a.nombre like '%3%' and ga.grupo='A-1';


select * from carrera c 
inner join asignatura a on c.id = a.id_carrera 
inner join grupo_asinatura ga on a.id = ga.id_asig
inner join alu_grupo_asig aga on ga.id = aga.id_grupo_asig 
where aga.id_alu =1;

select * from carrera c 
inner join asignatura a on c.id = a.id_carrera 
inner join grupo_asinatura ga on a.id = ga.id_asig
inner join alu_grupo_asig aga on ga.id = aga.id_grupo_asig 
where aga.id_grupo_asig  = 1;

select u.id, u.nombre, count(u.id) cantidad_carreras, sum(c.id) ventas from universidad u, carrera c where u.id = c.id_univ group by u.id, u.nombre;

--Peticion para saber cuantas asignaturas tiene cada carrera
select c.id, c.nombre, count(c.id) cantidad_carreraas from carrera c, asignatura a where c.id = a.id group by c.id, c.nombre order by c.id;