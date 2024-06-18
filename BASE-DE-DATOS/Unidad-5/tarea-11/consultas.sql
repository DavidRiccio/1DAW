--Nota: Realiza cada consulta que sea posible utilizando INNER JOIN && WHERE.

--Proporciona una consulta que muestre solo los clientes de Brasil.

SELECT * from customers WHERE country regexp 'Brazil';
/**
┌────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.

sqlite> SELECT c.FIRSTNAME || ' ' || c.LastNAME as nombre_completo, i.InvoiceId, i.InvoiceDate, i.BillingCountry  FROM INVOICES as i join customers as c on i.CustomerId=c.CustomerId and 
 c.Country regexp 'Brazil';

sqlite> SELECT c.FIRSTNAME || ' ' || c.LastNAME as nombre_completo, i.InvoiceId, i.InvoiceDate, i.BillingCountry  FROM INVOICES as i, customers as c WHERE i.CustomerId=c.CustomerId and 
 c.Country regexp 'Brazil';


/**
┌─────────────────┬───────────┬─────────────────────┬────────────────┐
│ nombre_completo │ InvoiceId │     InvoiceDate     │ BillingCountry │
├─────────────────┼───────────┼─────────────────────┼────────────────┤
│ Luís Gonçalves  │ 98        │ 2010-03-11 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 121       │ 2010-06-13 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 143       │ 2010-09-15 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 195       │ 2011-05-06 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 316       │ 2012-10-27 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 327       │ 2012-12-07 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 382       │ 2013-08-07 00:00:00 │ Brazil         │
│ Eduardo Martins │ 25        │ 2009-04-09 00:00:00 │ Brazil         │
│ Eduardo Martins │ 154       │ 2010-11-14 00:00:00 │ Brazil         │
│ Eduardo Martins │ 177       │ 2011-02-16 00:00:00 │ Brazil         │
│ Eduardo Martins │ 199       │ 2011-05-21 00:00:00 │ Brazil         │
│ Eduardo Martins │ 251       │ 2012-01-09 00:00:00 │ Brazil         │
│ Eduardo Martins │ 372       │ 2013-07-02 00:00:00 │ Brazil         │
│ Eduardo Martins │ 383       │ 2013-08-12 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 57        │ 2009-09-06 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 68        │ 2009-10-17 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 123       │ 2010-06-17 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 252       │ 2012-01-22 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 275       │ 2012-04-25 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 297       │ 2012-07-28 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 349       │ 2013-03-18 00:00:00 │ Brazil         │
│ Roberto Almeida │ 34        │ 2009-05-23 00:00:00 │ Brazil         │
│ Roberto Almeida │ 155       │ 2010-11-14 00:00:00 │ Brazil         │
│ Roberto Almeida │ 166       │ 2010-12-25 00:00:00 │ Brazil         │
│ Roberto Almeida │ 221       │ 2011-08-25 00:00:00 │ Brazil         │
│ Roberto Almeida │ 350       │ 2013-03-31 00:00:00 │ Brazil         │
│ Roberto Almeida │ 373       │ 2013-07-03 00:00:00 │ Brazil         │
│ Roberto Almeida │ 395       │ 2013-10-05 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 35        │ 2009-06-05 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 58        │ 2009-09-07 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 80        │ 2009-12-10 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 132       │ 2010-07-31 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 253       │ 2012-01-22 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 264       │ 2012-03-03 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 319       │ 2012-11-01 00:00:00 │ Brazil         │
└─────────────────┴───────────┴─────────────────────┴────────────────┘
**/


--Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.


SELECT * FROM employees WHERE title = "Sales Manager";
/**
┌────────────┬──────────┬───────────┬───────────────┬───────────┬─────────────────────┬─────────────────────┬──────────────┬─────────┬───────┬─────────┬────────────┬───────────────────┬───────────────────┬───────────────────────┐
│ EmployeeId │ LastName │ FirstName │     Title     │ ReportsTo │      BirthDate      │      HireDate       │   Address    │  City   │ State │ Country │ PostalCode │       Phone       │        Fax        │         Email         │
├────────────┼──────────┼───────────┼───────────────┼───────────┼─────────────────────┼─────────────────────┼──────────────┼─────────┼───────┼─────────┼────────────┼───────────────────┼───────────────────┼───────────────────────┤
│ 2          │ Edwards  │ Nancy     │ Sales Manager │ 1         │ 1958-12-08 00:00:00 │ 2002-05-01 00:00:00 │ 825 8 Ave SW │ Calgary │ AB    │ Canada  │ T2P 2T3    │ +1 (403) 262-3443 │ +1 (403) 262-3322 │ nancy@chinookcorp.com │
└────────────┴──────────┴───────────┴───────────────┴───────────┴─────────────────────┴─────────────────────┴──────────────┴─────────┴───────┴─────────┴────────────┴───────────────────┴───────────────────┴───────────────────────┘
**/

--Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.

SELECT DISTINCT BillingCountry FROM invoices;
/**
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Germany        │
│ Norway         │
│ Belgium        │
│ Canada         │
│ USA            │
│ France         │
│ Ireland        │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ India          │
│ Brazil         │
│ Portugal       │
│ Netherlands    │
│ Spain          │
│ Sweden         │
│ Czech Republic │
│ Finland        │
│ Denmark        │
│ Italy          │
│ Poland         │
│ Austria        │
│ Hungary        │
│ Argentina      │
└────────────────┘
**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil.

SELECT * FROM invoices i join customers c on i.CustomerID=c.CustomerID  
   ...> AND c.Country ='Brazil';

SELECT * FROM invoices i , customers c WHERE i.CustomerID=c.CustomerID  
   ...> AND c.Country ='Brazil';

/**
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┬────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┼────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┴────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

--Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.

SELECT e.firstname || ' ' || e.lastname as nombre_completo, i.* FROM INVOICES i, employees e  join customers c on c.SupportRepId=e.EmployeeID and c.CustomerID=i.CustomerID   
   ...> AND e.title='Sales Manager';

SELECT e.firstname || ' ' || e.lastname as nombre_completo, i.* FROM INVOICES i, employees e, customers c WHERE c.SupportRepId=e.EmployeeID and c.CustomerID=i.CustomerID   
   ...> AND e.title='Sales Manager';


--Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.


SELECT i.total, c.firstname || ' ' || c.Lastname as Nombre, c.country, e.firstname|| ' ' || e.lastname as nombre_agente   FROM INVOICES i, employees as e  join customers c on c.CustomerID=i.CustomerID and   
   ...> c.SupportRepId=e.EmployeeID ;

SELECT i.total, c.firstname || ' ' || c.Lastname as Nombre, c.country, e.firstname|| ' ' || e.lastname as nombre_agente   FROM INVOICES i, employees, customers c WHERE c.CustomerID=i.CustomerID and   
   ...> c.SupportRepId=e.EmployeeID ;

/**
┌───────┬───────────────────────┬────────────────┬───────────────┐
│ Total │        Nombre         │    Country     │ nombre_agente │
├───────┼───────────────────────┼────────────────┼───────────────┤
│ 3.98  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 3.96  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 5.94  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 0.99  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 1.98  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 13.86 │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 8.91  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 1.98  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 13.86 │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 8.91  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 1.98  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 3.96  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 5.94  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 0.99  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 3.98  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 13.86 │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 8.91  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 1.98  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 3.96  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 5.94  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 0.99  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 3.96  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 5.94  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 0.99  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 1.98  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 15.86 │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 8.91  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 1.98  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 1.98  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 3.96  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 5.94  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 0.99  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 1.98  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 16.86 │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 8.91  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 8.91  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 1.98  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 3.96  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 5.94  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 0.99  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 1.98  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 25.86 │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 1.98  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 18.86 │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 8.91  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 1.98  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 3.96  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 5.94  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 0.99  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 5.94  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 0.99  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 1.98  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 13.86 │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 8.91  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 1.98  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 3.96  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 1.98  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 3.96  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 5.94  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 0.99  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 1.98  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 13.86 │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 8.91  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 8.91  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 1.98  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 3.96  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 5.94  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 0.99  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 1.98  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 13.86 │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 1.98  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 13.86 │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 8.91  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 1.98  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 3.96  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 5.94  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 0.99  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 0.99  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 1.98  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 13.86 │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 8.91  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 1.98  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 3.96  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 5.94  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 1.98  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 3.96  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 5.94  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 0.99  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 1.98  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 13.86 │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 8.91  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 8.91  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 1.98  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 3.96  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 5.94  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 0.99  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 1.98  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 13.86 │ Mark Philips          │ Canada         │ Steve Johnson │
│ 1.98  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 13.86 │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 9.91  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 1.98  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 3.96  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 5.94  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 0.99  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 0.99  │ Frank Harris          │ USA            │ Margaret Park │
│ 1.98  │ Frank Harris          │ USA            │ Margaret Park │
│ 13.86 │ Frank Harris          │ USA            │ Margaret Park │
│ 8.91  │ Frank Harris          │ USA            │ Margaret Park │
│ 1.98  │ Frank Harris          │ USA            │ Margaret Park │
│ 3.96  │ Frank Harris          │ USA            │ Margaret Park │
│ 5.94  │ Frank Harris          │ USA            │ Margaret Park │
│ 1.98  │ Jack Smith            │ USA            │ Steve Johnson │
│ 3.96  │ Jack Smith            │ USA            │ Steve Johnson │
│ 5.94  │ Jack Smith            │ USA            │ Steve Johnson │
│ 0.99  │ Jack Smith            │ USA            │ Steve Johnson │
│ 1.98  │ Jack Smith            │ USA            │ Steve Johnson │
│ 13.86 │ Jack Smith            │ USA            │ Steve Johnson │
│ 10.91 │ Jack Smith            │ USA            │ Steve Johnson │
│ 1.98  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 3.96  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 5.94  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 0.99  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 1.98  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 13.86 │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 8.91  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 1.98  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 13.86 │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 8.91  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 1.98  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 3.96  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 5.94  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 1.99  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 1.98  │ Dan Miller            │ USA            │ Margaret Park │
│ 13.86 │ Dan Miller            │ USA            │ Margaret Park │
│ 8.91  │ Dan Miller            │ USA            │ Margaret Park │
│ 3.98  │ Dan Miller            │ USA            │ Margaret Park │
│ 3.96  │ Dan Miller            │ USA            │ Margaret Park │
│ 5.94  │ Dan Miller            │ USA            │ Margaret Park │
│ 0.99  │ Dan Miller            │ USA            │ Margaret Park │
│ 3.96  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 5.94  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 0.99  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 1.98  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 13.86 │ Kathy Chase           │ USA            │ Steve Johnson │
│ 8.91  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 1.98  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 1.98  │ Heather Leacock       │ USA            │ Margaret Park │
│ 3.96  │ Heather Leacock       │ USA            │ Margaret Park │
│ 5.94  │ Heather Leacock       │ USA            │ Margaret Park │
│ 0.99  │ Heather Leacock       │ USA            │ Margaret Park │
│ 3.98  │ Heather Leacock       │ USA            │ Margaret Park │
│ 13.86 │ Heather Leacock       │ USA            │ Margaret Park │
│ 8.91  │ Heather Leacock       │ USA            │ Margaret Park │
│ 13.86 │ John Gordon           │ USA            │ Margaret Park │
│ 8.91  │ John Gordon           │ USA            │ Margaret Park │
│ 1.98  │ John Gordon           │ USA            │ Margaret Park │
│ 3.96  │ John Gordon           │ USA            │ Margaret Park │
│ 5.94  │ John Gordon           │ USA            │ Margaret Park │
│ 0.99  │ John Gordon           │ USA            │ Margaret Park │
│ 1.98  │ John Gordon           │ USA            │ Margaret Park │
│ 1.98  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 15.86 │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 8.91  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 1.98  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 7.96  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 5.94  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 0.99  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 5.94  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 0.99  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 1.98  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 18.86 │ Victor Stevens        │ USA            │ Steve Johnson │
│ 8.91  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 1.98  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 3.96  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 1.98  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 3.96  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 5.94  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 0.99  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 1.98  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 23.86 │ Richard Cunningham    │ USA            │ Margaret Park │
│ 8.91  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 8.91  │ Patrick Gray          │ USA            │ Margaret Park │
│ 1.98  │ Patrick Gray          │ USA            │ Margaret Park │
│ 3.96  │ Patrick Gray          │ USA            │ Margaret Park │
│ 5.94  │ Patrick Gray          │ USA            │ Margaret Park │
│ 0.99  │ Patrick Gray          │ USA            │ Margaret Park │
│ 1.98  │ Patrick Gray          │ USA            │ Margaret Park │
│ 13.86 │ Patrick Gray          │ USA            │ Margaret Park │
│ 1.98  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 13.86 │ Julia Barnett         │ USA            │ Steve Johnson │
│ 8.91  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 1.98  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 3.96  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 11.94 │ Julia Barnett         │ USA            │ Steve Johnson │
│ 0.99  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 0.99  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 1.98  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 13.86 │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 8.91  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 1.98  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 3.96  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 5.94  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 1.98  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 3.96  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 5.94  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 0.99  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 1.98  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 13.86 │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 8.91  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 8.91  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 1.98  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 3.96  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 5.94  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 0.99  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 1.98  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 13.86 │ Martha Silk           │ Canada         │ Steve Johnson │
│ 1.98  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 13.86 │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 8.91  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 1.98  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 3.96  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 5.94  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 0.99  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 0.99  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 1.98  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 13.86 │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 8.91  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 1.98  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 3.96  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 5.94  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 1.98  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 3.96  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 5.94  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 0.99  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 1.98  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 13.86 │ João Fernandes        │ Portugal       │ Margaret Park │
│ 10.91 │ João Fernandes        │ Portugal       │ Margaret Park │
│ 1.98  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 3.96  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 5.94  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 0.99  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 1.98  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 13.86 │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 8.91  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 1.98  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 13.86 │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 8.91  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 1.98  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 3.96  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 5.94  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 0.99  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 0.99  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 1.98  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 13.86 │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 14.91 │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 1.98  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 3.96  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 5.94  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 1.98  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 3.96  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 5.94  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 0.99  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 1.98  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 13.86 │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 8.91  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 1.98  │ Camille Bernard       │ France         │ Margaret Park │
│ 3.96  │ Camille Bernard       │ France         │ Margaret Park │
│ 5.94  │ Camille Bernard       │ France         │ Margaret Park │
│ 1.99  │ Camille Bernard       │ France         │ Margaret Park │
│ 1.98  │ Camille Bernard       │ France         │ Margaret Park │
│ 13.86 │ Camille Bernard       │ France         │ Margaret Park │
│ 8.91  │ Camille Bernard       │ France         │ Margaret Park │
│ 1.98  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 13.86 │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 8.91  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 2.98  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 3.96  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 5.94  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 0.99  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 1.98  │ Marc Dubois           │ France         │ Steve Johnson │
│ 13.86 │ Marc Dubois           │ France         │ Steve Johnson │
│ 8.91  │ Marc Dubois           │ France         │ Steve Johnson │
│ 1.98  │ Marc Dubois           │ France         │ Steve Johnson │
│ 3.96  │ Marc Dubois           │ France         │ Steve Johnson │
│ 5.94  │ Marc Dubois           │ France         │ Steve Johnson │
│ 0.99  │ Marc Dubois           │ France         │ Steve Johnson │
│ 3.96  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 5.94  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 0.99  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 3.98  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 13.86 │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 8.91  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 1.98  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 1.98  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 3.96  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 5.94  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 0.99  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 1.98  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 16.86 │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 8.91  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 8.91  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 1.98  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 7.96  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 5.94  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 0.99  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 1.98  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 13.86 │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 1.98  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 21.86 │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 8.91  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 1.98  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 3.96  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 5.94  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 0.99  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 5.94  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 0.99  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 1.98  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 21.86 │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 8.91  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 1.98  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 3.96  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 1.98  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 3.96  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 5.94  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 0.99  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 1.98  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 13.86 │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 8.91  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 8.91  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 1.98  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 3.96  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 8.94  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 0.99  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 1.98  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 13.86 │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 1.98  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 13.86 │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 8.91  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 1.98  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 3.96  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 5.94  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 0.99  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 0.99  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 1.98  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 13.86 │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 8.91  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 1.98  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 3.96  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 5.94  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 1.98  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 3.96  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 6.94  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 0.99  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 1.98  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 13.86 │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 8.91  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 8.91  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 3.96  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 5.94  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 0.99  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 13.86 │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 13.86 │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 8.91  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 3.96  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 5.94  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 0.99  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 0.99  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 1.98  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 13.86 │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 8.91  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 1.98  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 3.96  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 5.94  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 1.98  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 3.96  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 5.94  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 0.99  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 1.98  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 13.86 │ Mark Taylor           │ Australia      │ Margaret Park │
│ 8.91  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 1.98  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 3.96  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 5.94  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 0.99  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 1.98  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 13.86 │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 8.91  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 1.98  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 13.86 │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 17.91 │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 1.98  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 3.96  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 5.94  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 0.99  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 1.98  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 13.86 │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 8.91  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 1.98  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 3.96  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 5.94  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 1.99  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 3.96  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 5.94  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 1.99  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 1.98  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 13.86 │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 8.91  │ Puja Srivastava       │ India          │ Jane Peacock  │
└───────┴───────────────────────┴────────────────┴───────────────┘

**/

--¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?


SELECT  COUNT(invoiceid) as total_ventas FROM invoices 
   ...> WHERE invoiceDate REGEXP '2009' or invoicedate REGEXP '2011';

/**
┌──────────────┐
│ total_ventas │
├──────────────┤
│ 166          │
└──────────────┘.tabl
**/


--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.

SELECT COUNT(InvoiceLineId) as total_items from invoice_items      
   ...> WHERE InvoiceId = 37;

/**
┌─────────────┐
│ total_items │
├─────────────┤
│ 4           │
└─────────────┘
**/


--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY





--Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

--Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.

--Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.

--Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

--Proporciona una consulta que muestre todas las facturas.

--Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

--¿Qué agente de ventas realizó más ventas en 2009?

--Escribir una consulta que muestre todas las playlists de la base de datos.

--Escribe una consulta que liste todas las canciones de una playlist.

--Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.