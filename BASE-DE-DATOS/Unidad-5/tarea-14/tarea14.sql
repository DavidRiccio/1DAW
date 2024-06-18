--Consultas 

    --Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
        select apellido1, apellido2, nombre from persona where tipo='alumno'order by apellido1;
        /*
        ┌───────────┬───────────┬──────────┐
        │ apellido1 │ apellido2 │  nombre  │
        ├───────────┼───────────┼──────────┤
        │ Domínguez │ Guerrero  │ Antonio  │
        │ Gea       │ Ruiz      │ Sonia    │
        │ Gutiérrez │ López     │ Juan     │
        │ Heller    │ Pagac     │ Pedro    │
        │ Herman    │ Pacocha   │ Daniel   │
        │ Hernández │ Martínez  │ Irene    │
        │ Herzog    │ Tremblay  │ Ramón    │
        │ Koss      │ Bayer     │ José     │
        │ Lakin     │ Yundt     │ Inma     │
        │ Saez      │ Vega      │ Juan     │
        │ Strosin   │ Turcotte  │ Ismael   │
        │ Sánchez   │ Pérez     │ Salvador │
        └───────────┴───────────┴──────────┘

        */
            --Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
        select nombre, apellido1, apellido2 from persona where tipo='alumno' and telefono not null;
        /*
        ┌──────────┬───────────┬───────────┐
        │  nombre  │ apellido1 │ apellido2 │
        ├──────────┼───────────┼───────────┤
        │ Salvador │ Sánchez   │ Pérez     │
        │ Juan     │ Saez      │ Vega      │
        │ José     │ Koss      │ Bayer     │
        │ Ramón    │ Herzog    │ Tremblay  │
        │ Daniel   │ Herman    │ Pacocha   │
        │ Inma     │ Lakin     │ Yundt     │
        │ Juan     │ Gutiérrez │ López     │
        │ Antonio  │ Domínguez │ Guerrero  │
        │ Irene    │ Hernández │ Martínez  │
        │ Sonia    │ Gea       │ Ruiz      │
        └──────────┴───────────┴───────────┘

        */
            --Devuelve el listado de los alumnos que nacieron en 1999.
        select * from persona where fecha_nacimiento REGEXP '1999';/*
        ┌────┬───────────┬─────────┬───────────┬───────────┬─────────┬─────────────────┬───────────┬──────────────────┬──────┬────────┐
        │ id │    nif    │ nombre  │ apellido1 │ apellido2 │ ciudad  │    direccion    │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
        ├────┼───────────┼─────────┼───────────┼───────────┼─────────┼─────────────────┼───────────┼──────────────────┼──────┼────────┤
        │ 7  │ 97258166K │ Ismael  │ Strosin   │ Turcotte  │ Almería │ C/ Neptuno      │           │ 1999/05/24       │ H    │ alumno │
        │ 22 │ 41491230N │ Antonio │ Domínguez │ Guerrero  │ Almería │ C/ Cabo de Gata │ 626652498 │ 1999/02/11       │ H    │ alumno │
        └────┴───────────┴─────────┴───────────┴───────────┴─────────┴─────────────────┴───────────┴──────────────────┴──────┴────────┘
        */
            --Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
        select * from persona where tipo='profesor'and telefono not null and nif REGEXP 'k$';
            --Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
        sselect * from asignatura where id_grado=7 and cuatrimestre=1 and curso=3;/*
        ┌────┬───────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
        │ id │                  nombre                   │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
        ├────┼───────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
        │ 72 │ Bases moleculares del desarrollo vegetal  │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
        │ 73 │ Fisiología animal                         │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
        │ 74 │ Metabolismo y biosíntesis de biomoléculas │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
        │ 75 │ Operaciones de separación                 │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
        │ 76 │ Patología molecular de plantas            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
        │ 77 │ Técnicas instrumentales básicas           │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
        └────┴───────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘

        */
--Consultas multitabla (Join)

    --Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

SELECT DISTINCT p.nombre from persona p 
JOIN alumno_se_matricula_asignatura matr on p.id=matr.id_alumno 
JOIN asignatura asig on asig.id=matr.id_asignatura
JOIN grado g on asig.id_grado=g.id WHERE g.nombre='Grado en Ingeniería Informática (Plan 2015
)' and p.tipo = 'alumno' and p.sexo = 'M';
/*
┌────────┐
│ nombre │
├────────┤
│ Sonia  │
│ Irene  │
│ Inma   │
└────────┘
*/
    --Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
    select a.* from asignatura as a join grado as g on a.id_grado=g.id where g.nombre REGEXP 'Informática';/*
    ┌────┬────────────────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
    │ id │                                 nombre                                 │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
    ├────┼────────────────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
    │ 1  │ Álgegra lineal y matemática discreta                                   │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
    │ 2  │ Cálculo                                                                │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │
    │ 3  │ Física para informática                                                │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
    │ 4  │ Introducción a la programación                                         │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │
    │ 5  │ Organización y gestión de empresas                                     │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
    │ 6  │ Estadística                                                            │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
    │ 7  │ Estructura y tecnología de computadores                                │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │
    │ 8  │ Fundamentos de electrónica                                             │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
    │ 9  │ Lógica y algorítmica                                                   │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │
    │ 10 │ Metodología de la programación                                         │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
    │ 11 │ Arquitectura de Computadores                                           │ 6.0      │ básica      │ 2     │ 1            │ 3           │ 4        │
    │ 12 │ Estructura de Datos y Algoritmos I                                     │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │
    │ 13 │ Ingeniería del Software                                                │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │
    │ 14 │ Sistemas Inteligentes                                                  │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │
    │ 15 │ Sistemas Operativos                                                    │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │
    │ 16 │ Bases de Datos                                                         │ 6.0      │ básica      │ 2     │ 2            │ 14          │ 4        │
    │ 17 │ Estructura de Datos y Algoritmos II                                    │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │
    │ 18 │ Fundamentos de Redes de Computadores                                   │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │
    │ 19 │ Planificación y Gestión de Proyectos Informáticos                      │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │
    │ 20 │ Programación de Servicios Software                                     │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │
    │ 21 │ Desarrollo de interfaces de usuario                                    │ 6.0      │ obligatoria │ 3     │ 1            │ 14          │ 4        │
    │ 22 │ Ingeniería de Requisitos                                               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 23 │ Integración de las Tecnologías de la Información en las Organizaciones │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 24 │ Modelado y Diseño del Software 1                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 25 │ Multiprocesadores                                                      │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 26 │ Seguridad y cumplimiento normativo                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 27 │ Sistema de Información para las Organizaciones                         │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 28 │ Tecnologías web                                                        │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 29 │ Teoría de códigos y criptografía                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
    │ 30 │ Administración de bases de datos                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 31 │ Herramientas y Métodos de Ingeniería del Software                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 32 │ Informática industrial y robótica                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 33 │ Ingeniería de Sistemas de Información                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 34 │ Modelado y Diseño del Software 2                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 35 │ Negocio Electrónico                                                    │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 36 │ Periféricos e interfaces                                               │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 37 │ Sistemas de tiempo real                                                │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 38 │ Tecnologías de acceso a red                                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 39 │ Tratamiento digital de imágenes                                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
    │ 40 │ Administración de redes y sistemas operativos                          │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
    │ 41 │ Almacenes de Datos                                                     │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
    │ 42 │ Fiabilidad y Gestión de Riesgos                                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
    │ 43 │ Líneas de Productos Software                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
    │ 44 │ Procesos de Ingeniería del Software 1                                  │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
    │ 45 │ Tecnologías multimedia                                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
    │ 46 │ Análisis y planificación de las TI                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
    │ 47 │ Desarrollo Rápido de Aplicaciones                                      │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
    │ 48 │ Gestión de la Calidad y de la Innovación Tecnológica                   │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
    │ 49 │ Inteligencia del Negocio                                               │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
    │ 50 │ Procesos de Ingeniería del Software 2                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
    │ 51 │ Seguridad Informática                                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
    └────┴────────────────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
    */
        --Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
    select p.apellido1, p.apellido2, p.nombre, d.nombre from persona as p, departamento as d join profesor as pr on p.id=pr.id_profesor and d.id=pr.id_departamento order by apellido1;
    /*
    ┌────────────┬────────────┬───────────┬────────────────────┐
    │ apellido1  │ apellido2  │  nombre   │       nombre       │
    ├────────────┼────────────┼───────────┼────────────────────┤
    │ Fahey      │ Considine  │ Antonio   │ Economía y Empresa │
    │ Hamill     │ Kozey      │ Manolo    │ Informática        │
    │ Kohler     │ Schoen     │ Alejandro │ Matemáticas        │
    │ Lemke      │ Rutherford │ Cristina  │ Economía y Empresa │
    │ Monahan    │ Murray     │ Micaela   │ Agronomía          │
    │ Ramirez    │ Gea        │ Zoe       │ Informática        │
    │ Ruecker    │ Upton      │ Guillermo │ Educación          │
    │ Schmidt    │ Fisher     │ David     │ Matemáticas        │
    │ Schowalter │ Muller     │ Francesca │ Química y Física   │
    │ Spencer    │ Lakin      │ Esther    │ Educación          │
    │ Stiedemann │ Morissette │ Alfredo   │ Química y Física   │
    │ Streich    │ Hirthe     │ Carmen    │ Educación          │
    └────────────┴────────────┴───────────┴────────────────────┘
    */
        --Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
    select a.nombre, an.anyo_inicio, an.anyo_fin from asignatura as a 
    ...> JOIN alumno_se_matricula_asignatura as al on a.id=al.id_asignatura
    ...> join persona as p on p.id=al.id_alumno
    ...> JOIN curso_escolar as an on al.id_curso_escolar=an.id
    ...> where p.nif='26902806M';
    /*
    ┌──────────────────────────────────────┬─────────────┬──────────┐
    │                nombre                │ anyo_inicio │ anyo_fin │
    ├──────────────────────────────────────┼─────────────┼──────────┤
    │ Álgegra lineal y matemática discreta │ 2014        │ 2015     │
    │ Cálculo                              │ 2014        │ 2015     │
    │ Física para informática              │ 2014        │ 2015     │
    └──────────────────────────────────────┴─────────────┴──────────┘
    */
        --Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

SELECT DISTINCT dep.nombre from departamento dep 
   ...> JOIN profesor prof on dep.id=prof.id_departamento
   ...> JOIN asignatura asig on prof.id_profesor=asig.id_profesor
   ...> JOIN grado g on asig.id_grado=g.id
   ...> WHERE g.nombre='Grado en Ingeniería Informática (Plan 2015)';
   /*
┌─────────────┐
│   nombre    │
├─────────────┤
│ Informática │
└─────────────┘
*/
        --Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
                        SELECT DISTINCT p.nombre from persona p
JOIN alumno_se_matricula_asignatura matri on matri.id_alumno=p.id
JOIN curso_escolar curso on matri.id_curso_escolar=curso.id
WHERE p.tipo='alumno' and curso.anyo_inicio=2018 and curso.anyo_fin=2019;
/*
┌────────┐
│ nombre │
├────────┤
│ Sonia  │
│ Irene  │
│ Inma   │
└────────┘
*/
    --Consultas multitabla (Where)

        --Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
        SELECT dep.nombre, p.apellido1, p.apellido2, p.nombre FROM departamento dep, profesor prof, persona p
WHERE prof.id_departamento=dep.id and p.id=prof.id_profesor
GROUP BY dep.nombre, p.apellido1, p.apellido2, p.nombre;/*
┌────────────────────┬────────────┬────────────┬───────────┐
│       nombre       │ apellido1  │ apellido2  │  nombre   │
├────────────────────┼────────────┼────────────┼───────────┤
│ Agronomía          │ Monahan    │ Murray     │ Micaela   │
│ Economía y Empresa │ Fahey      │ Considine  │ Antonio   │
│ Economía y Empresa │ Lemke      │ Rutherford │ Cristina  │
│ Educación          │ Ruecker    │ Upton      │ Guillermo │
│ Educación          │ Spencer    │ Lakin      │ Esther    │
│ Educación          │ Streich    │ Hirthe     │ Carmen    │
│ Informática        │ Hamill     │ Kozey      │ Manolo    │
│ Informática        │ Ramirez    │ Gea        │ Zoe       │
│ Matemáticas        │ Kohler     │ Schoen     │ Alejandro │
│ Matemáticas        │ Schmidt    │ Fisher     │ David     │
│ Química y Física   │ Schowalter │ Muller     │ Francesca │
│ Química y Física   │ Stiedemann │ Morissette │ Alfredo   │
└────────────────────┴────────────┴────────────┴───────────┘
*/
        --Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT d.* from departamento as d
WHERE d.id not in(
   SELECT DISTINCT(id_departamento)
   FROM profesor
);
/*
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
*/
        --Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT p.* from profesro as p
WHERE p.id_profesor not in(
   SELECT DISTINCT(id_departamento)
   FROM departamento
);
/*
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
*/
        --Devuelve un listado con los profesores que no imparten ninguna asignatura.

        --Devuelve un listado con las asignaturas que no tienen un profesor asignado.

        --Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

--Consultas resúmen (Funciones)

    --Devuelve el número total de alumnas que hay.
    select count(id) from persona where tipo='alumno' and sexo ='M';/*

    ┌───────────┐
    │ count(id) │
    ├───────────┤
    │ 3         │
    └───────────┘
    */
    --Calcula cuántos alumnos nacieron en 1999.
            
            select count(id) from persona where tipo='alumno' and fecha_nacimiento REGEXP '1999';
            /*
        ┌───────────┐
        │ count(id) │
        ├───────────┤
        │ 2         │
        └───────────┘
*/
    --Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
            SELECT d.nombre, count(p.id_profesor) from profesor as p join departamento as d on p.id_departamento=d.id
            ...> join persona as pe on pe.id=p.id_profesor group by d.nombre;
            /*
            ┌────────────────────┬──────────────────────┐
            │       nombre       │ count(p.id_profesor) │
            ├────────────────────┼──────────────────────┤
            │ Agronomía          │ 1                    │
            │ Economía y Empresa │ 2                    │
            │ Educación          │ 3                    │
            │ Informática        │ 2                    │
            │ Matemáticas        │ 2                    │
            │ Química y Física   │ 2                    │
            └────────────────────┴──────────────────────┘
            */
    --Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.


SELECT dep.nombre,  count(prof.id_profesor) as total_profesores FROM profesor as prof
   ...> JOIN departamento dep on prof.id_departamento=dep.id
   ...> GROUP BY dep.nombre;
   /*
┌────────────────────┬──────────────────┐
│       nombre       │ total_profesores │
├────────────────────┼──────────────────┤
│ Agronomía          │ 1                │
│ Economía y Empresa │ 2                │
│ Educación          │ 3                │
│ Informática        │ 2                │
│ Matemáticas        │ 2                │
│ Química y Física   │ 2                │
└────────────────────┴──────────────────┘
*/

    --Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
        SELECT g.nombre, IFNULL((SELECT count(*) from asignatura asig where asig.id_grado=g.id), 0) as total_asignaturas FROM grado g ORDER BY total_asignaturas DESC;
        /*
┌────────────────────────────────────────────────────────┬───────────────────┐
│                         nombre                         │ total_asignaturas │
├────────────────────────────────────────────────────────┼───────────────────┤
│ Grado en Ingeniería Informática (Plan 2015)            │ 51                │
│ Grado en Biotecnología (Plan 2015)                     │ 32                │
│ Grado en Ingeniería Agrícola (Plan 2015)               │ 0                 │
│ Grado en Ingeniería Eléctrica (Plan 2014)              │ 0                 │
│ Grado en Ingeniería Electrónica Industrial (Plan 2010) │ 0                 │
│ Grado en Ingeniería Mecánica (Plan 2010)               │ 0                 │
│ Grado en Ingeniería Química Industrial (Plan 2010)     │ 0                 │
│ Grado en Ciencias Ambientales (Plan 2009)              │ 0                 │
│ Grado en Matemáticas (Plan 2010)                       │ 0                 │
│ Grado en Química (Plan 2009)                           │ 0                 │
└────────────────────────────────────────────────────────┴───────────────────┘
*/

    --Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

SELECT g.nombre, IFNULL((SELECT count(*) from asignatura asig where asig.id_grado=g.id), 0) as total_asignaturas FROM grado g WHERE total_asignaturas > 40 ORDER BY total_asignaturas DESC
   ...> ;
   /*
┌─────────────────────────────────────────────┬───────────────────┐
│                   nombre                    │ total_asignaturas │
├─────────────────────────────────────────────┼───────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 51                │
└─────────────────────────────────────────────┴───────────────────┘
*/
    --Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
SELECT g.nombre, a.tipo, SUM(a.creditos) as total_creditos FROM asignatura as a
   ...> JOIN grado g on a.id_grado=g.id
   ...> GROUP BY g.nombre, a.tipo
   ...> ORDER BY total_creditos DESC;
   /*
┌─────────────────────────────────────────────┬─────────────┬────────────────┐
│                   nombre                    │    tipo     │ total_creditos │
├─────────────────────────────────────────────┼─────────────┼────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ optativa    │ 180.0          │
│ Grado en Biotecnología (Plan 2015)          │ obligatoria │ 120.0          │
│ Grado en Ingeniería Informática (Plan 2015) │ básica      │ 72.0           │
│ Grado en Biotecnología (Plan 2015)          │ básica      │ 60.0           │
│ Grado en Ingeniería Informática (Plan 2015) │ obligatoria │ 54.0           │
└─────────────────────────────────────────────┴─────────────┴────────────────┘
*/
    --Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

SELECT ce.anyo_inicio, COUNT(DISTINCT matri.id_alumno) as numero_de_alumnos  
   ...> FROM curso_escolar ce
   ...> LEFT JOIN alumno_se_matricula_asignatura matri on ce.id=matri.id_curso_escolar
   ...> GROUP BY ce.anyo_inicio 
   ...> ORDER BY ce.anyo_inicio;
   /*
┌─────────────┬───────────────────┐
│ anyo_inicio │ numero_de_alumnos │
├─────────────┼───────────────────┤
│ 2014        │ 3                 │
│ 2015        │ 0                 │
│ 2016        │ 0                 │
│ 2017        │ 0                 │
│ 2018        │ 3                 │
└─────────────┴───────────────────┘
*/

    --Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

--Subconsultas

    --Devuelve todos los datos del alumno más joven.
        
        
        select * from persona where tipo='alumno' order by fecha_nacimiento DESC limit 1;
        /*
        ┌────┬───────────┬────────┬───────────┬───────────┬─────────┬───────────────────┬──────────┬──────────────────┬──────┬────────┐
        │ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion     │ telefono │ fecha_nacimiento │ sexo │  tipo  │
        ├────┼───────────┼────────┼───────────┼───────────┼─────────┼───────────────────┼──────────┼──────────────────┼──────┼────────┤
        │ 4  │ 17105885A │ Pedro  │ Heller    │ Pagac     │ Almería │ C/ Estrella fugaz │          │ 2000/10/05       │ H    │ alumno │
        └────┴───────────┴────────┴───────────┴───────────┴─────────┴───────────────────┴──────────┴──────────────────┴──────┴────────┘
        */

    --Devuelve un listado con los profesores que no están asociados a un departamento.
        select p.*, d.nombre from profesor as p join departamento as d on d.id=p.id_departamento where p.id_departamento is null;

    --Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT * from departamento d WHERE NOT EXISTS (SELECT * from profesor p where p.id_departamento = d.id);
/*
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
*/
    --Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

SELECT p.nombre from persona as p
JOIN profesor as pr on p.id=pr.id_profesor
where pr.id_profesor not in (
   SELECT distinct (id_profesor) from asignatura a WHERE a.id_profesor=pr.id_profesor
);
/*
┌───────────┐
│  nombre   │
├───────────┤
│ David     │
│ Cristina  │
│ Esther    │
│ Carmen    │
│ Alfredo   │
│ Alejandro │
│ Antonio   │
│ Guillermo │
│ Micaela   │
│ Francesca │
└───────────┘
*/
    --Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT a.nombre from asignatura a WHERE id  IN (SELECT a.id from asignatura where id_profesor is NULL);
/*
────────────────────────────────────────────────────────────────────────┐
│                                 nombre                                 │
├────────────────────────────────────────────────────────────────────────┤
│ Álgegra lineal y matemática discreta                                   │
│ Cálculo                                                                │
│ Física para informática                                                │
│ Introducción a la programación                                         │
│ Organización y gestión de empresas                                     │
│ Estadística                                                            │
│ Estructura y tecnología de computadores                                │
│ Fundamentos de electrónica                                             │
│ Lógica y algorítmica                                                   │
│ Metodología de la programación                                         │
│ Arquitectura de Computadores                                           │
│ Estructura de Datos y Algoritmos I                                     │
│ Ingeniería del Software                                                │
│ Sistemas Inteligentes                                                  │
│ Sistemas Operativos                                                    │
│ Bases de Datos                                                         │
│ Estructura de Datos y Algoritmos II                                    │
│ Fundamentos de Redes de Computadores                                   │
│ Planificación y Gestión de Proyectos Informáticos                      │
│ Programación de Servicios Software                                     │
│ Desarrollo de interfaces de usuario                                    │
│ Ingeniería de Requisitos                                               │
│ Integración de las Tecnologías de la Información en las Organizaciones │
│ Modelado y Diseño del Software 1                                       │
│ Multiprocesadores                                                      │
│ Seguridad y cumplimiento normativo                                     │
│ Sistema de Información para las Organizaciones                         │
│ Tecnologías web                                                        │
│ Teoría de códigos y criptografía                                       │
│ Administración de bases de datos                                       │
│ Herramientas y Métodos de Ingeniería del Software                      │
│ Informática industrial y robótica                                      │
│ Ingeniería de Sistemas de Información                                  │
│ Modelado y Diseño del Software 2                                       │
│ Negocio Electrónico                                                    │
│ Periféricos e interfaces                                               │
│ Sistemas de tiempo real                                                │
│ Tecnologías de acceso a red                                            │
│ Tratamiento digital de imágenes                                        │
│ Administración de redes y sistemas operativos                          │
│ Almacenes de Datos                                                     │
│ Fiabilidad y Gestión de Riesgos                                        │
│ Líneas de Productos Software                                           │
│ Procesos de Ingeniería del Software 1                                  │
│ Tecnologías multimedia                                                 │
│ Análisis y planificación de las TI                                     │
│ Desarrollo Rápido de Aplicaciones                                      │
│ Gestión de la Calidad y de la Innovación Tecnológica                   │
│ Inteligencia del Negocio                                               │
│ Procesos de Ingeniería del Software 2                                  │
│ Seguridad Informática                                                  │
│ Biologia celular                                                       │
│ Física                                                                 │
│ Matemáticas I                                                          │
│ Química general                                                        │
│ Química orgánica                                                       │
│ Biología vegetal y animal                                              │
│ Bioquímica                                                             │
│ Genética                                                               │
│ Matemáticas II                                                         │
│ Microbiología                                                          │
│ Botánica agrícola                                                      │
│ Fisiología vegetal                                                     │
│ Genética molecular                                                     │
│ Ingeniería bioquímica                                                  │
│ Termodinámica y cinética química aplicada                              │
│ Biorreactores                                                          │
│ Biotecnología microbiana                                               │
│ Ingeniería genética                                                    │
│ Inmunología                                                            │
│ Virología                                                              │
│ Bases moleculares del desarrollo vegetal                               │
│ Fisiología animal                                                      │
│ Metabolismo y biosíntesis de biomoléculas                              │
│ Operaciones de separación                                              │
│ Patología molecular de plantas                                         │
│ Técnicas instrumentales básicas                                        │
│ Bioinformática                                                         │
│ Biotecnología de los productos hortofrutículas                         │
│ Biotecnología vegetal                                                  │
│ Genómica y proteómica                                                  │
│ Procesos biotecnológicos                                               │
│ Técnicas instrumentales avanzadas                                      │
└────────────────────────────────────────────────────────────────────────┘ç
*/
    --Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

SELECT d.* from departamento as d where d.id not in (
SELECT d.id from departamento as d
JOIN profesor as p on d.id=p.id_departamento
JOIN asignatura a on p.id_profesor=a.id_profesor);
/*
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 2  │ Matemáticas         │
│ 3  │ Economía y Empresa  │
│ 4  │ Educación           │
│ 5  │ Agronomía           │
│ 6  │ Química y Física    │
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
*/