
<h1 align="center">CASOS DE USO RESERVA DE VUELOS</h1>

<img src=""></img> 







#### Pasajero
|  Actor | Pasajero |
|---|---|
| Descripción  | Persona que utiliza el sistema de reserva de vuelos  |
| Características  | Comsumidor que realiza y aprovecha el sistema de reserva |
| Relaciones | Gestión de la maleta  |
| Referencias | Búsqueda de vuelo, reserva de vuelo y gestión de maletas |   
|  Notas |  No hay |
| Autor  | David Riccio |
|Fecha |23/01/2024|

---

#### Agente de reservas
|  Actor | Agente de reservas |
|---|---|
| Descripción  | Persona que se encarga de la gestión de las reservas  |
| Características  | Este actos se encargará de preparar, actualizar y cancelar las reservas que no se puedan dar |
| Relaciones | Gestión de la maleta  |
| Referencias | Actualización de vuelos, cancelación de vuelos y gestión de la maleta |   
|  Notas |  No hay |
| Autor  | David Riccio |
|Fecha |23/01/2024|

## Casos de uso

#### Gestión de la maleta

|  Caso de Uso	CU | Gestión de la maleta  |
|---|---|
| Fuentes  | Reserva de vuelos |
| Actor  |  Pasajero y agente de reservas |
| Descripción | Gestión de trámites por los cuales una maleta tiene que ser aceptada para entrar  |
| Flujo básico | Para empezar, el agente dentrá que tener todos los vuelos actualizados con sus respectivos horarios para que el apsajero decida cuál es el mejor para él en lo que respecta a su situación. Asimismo, una vez reservado el vuelo y hacer los trámites corresponientes deberá de destionar tanto el agente como el pasajero la maleta. El pasajero deberá llevar en ella todo lo que le sea útil y posible de llevar, mientras que el agente deberá de concretar en el billete del avión la maleta que llevará con el máximo de kilos |
| Pre-condiciones | El apsajero debe haber comprado el billete con las especificaciones de su maleta sin sobrepasar los máximos de peso, además deberá aportar la documentación correspondiente apra ser identificado  |  
| Post-condiciones  | Una vez hecho todo lo anterior de forma corresta, el pasajero lo unico que puede hacer es esperar a llegar a su destino y ahí esperar a que su maleta llegue a la cinta para poder recogerla  |  
|  Requerimientos | DNI y billete de avión  |
|  Notas |  No hay |
| Autor  | David Riccio |
|Fecha |23/01/2024|

  ---

  #### Búsqueda de vuelos
  |  Caso de Uso	CU | Busqueda de vuelos  |
  |---|---|
  | Fuentes  | Reserva de vuelos |
  | Actor  |  Pasajero  |
  | Descripción | Momento inicial donde se buscan ofertas de vuelos diferentes  |
  | Flujo básico | El pasajero por diferentes cuestione, ya se aporque está de vacaciones o otras desea buscar un vuelo a un destino, asimismo empezará a buscarlo en el busquedador|
  | Pre-condiciones | Ganas/Deber ir de viaje  |  
  | Post-condiciones  | Una vez encontrado el vuelo deberá pagarlo y aportar la documentación necesaria  |  
  |  Requerimientos | DNI y dinero  |
  |  Notas |  No hay |
  | Autor  | David Riccio |
  |Fecha |23/01/2024|

  ---

  #### Reservar vuelos
  |  Caso de Uso	CU | Reservar vuelos  |
  |---|---|
  | Fuentes  | Reserva de vuelos |
  | Actor  |  Pasajero  |
  | Descripción | Se formaliza la reserva del vuelo  |
  | Flujo básico | Los agentes de vuelos teniendo la información de los actualizada de los vuelos y una vez consultadas las diferenters ofertas donde el pasajero decidirá cuál es la que más le gusta reservará el billete |
  | Pre-condiciones | Ganas/Deber ir de viaje  |  
  | Post-condiciones  | Una vez encontrado el vuelo deberá pagarlo y aportar la documentación necesaria  |  
  |  Requerimientos | DNI y dinero  |
  |  Notas |  No hay |
  | Autor  | David Riccio |
  |Fecha |23/01/2024|

  ---

  #### Actualización de vuelos
  |  Caso de Uso	CU | Actualziación de vuelos  |
  |---|---|
  | Fuentes  | Reserva de vuelos |
  | Actor  |  Agentes de reservas  |
  | Descripción | Se actualizan los precios, horarios, etc de los vuelos  |
  | Flujo básico | Los agentes de vuelos tendrán que gestionar toda la información para poder ser mostrada al público |
  | Pre-condiciones | Información de los vuelos  |  
  | Post-condiciones  | Una vez actualizados los datos de los vuelos serán actualizados en la página web |  
  |  Requerimientos | Información  |
  |  Notas |  No hay |
  | Autor  | David Riccio |
  |Fecha |23/01/2024|
  
  ---

  #### Cancelación de vuelos
  |  Caso de Uso	CU | Cancelación de vuelos  |
  |---|---|
  | Fuentes  | Reserva de vuelos |
  | Actor  |  Agentes de reservas  |
  | Descripción | Momento en el cuál el vuelo por diferentes razones se tiene que cancelar  |
  | Flujo básico | Una vez los agentes de reservas hayan tenido todos los datos actualziados, el pasajero buscará una oferta de vuelo que quiera y por tanto procederá a reservar el vuelo con toda la gestión de la maleta. Sin embargo puede que en algún momento este vuelo se cancele por diferentes razones|  
  | Pre-condiciones | Situación adversa que impida el despegue del avión  | 
  | Post-condiciones  | Se le dará aviso a los pasajero y se procederá a ejecutar lo que la empresa tenga previsto para estos casos |  
  |  Requerimientos | Información, billete de avión, DNI, dinero  |
  |  Notas |  No hay |
  | Autor  | David Riccio |
  |Fecha |23/01/2024|