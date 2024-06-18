delimiter //
create procedure salario_anual
begin 
declare emp_id int;
declare emp_nombre varchar(100);
declare emp_salario decimal(10,2)

open cur;
read_loop: LOOP 
    fetch cur into emp_id,emp_nombre,emp_salario;
    if 