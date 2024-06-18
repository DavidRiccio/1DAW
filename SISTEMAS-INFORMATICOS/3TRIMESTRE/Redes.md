# Redes

### Sistema de comunicación:

- Componentes esenciales:
    - Transmisor/emisor
Canal de transmisión
    - Receptor
    
- Proceso:
    - El mensaje original es convertido en señales eléctricas mediante un transductor de entrada.
    - En el destino, otro transductor de salida transforma nuevamente la señal.

## Red de computadoras:

- Definición:

    Conjunto de equipos informáticos y software conectados para compartir información y recursos.
    Ejemplo: Internet.

- Finalidad:

    Compartir recursos e información.
    Asegurar la confiabilidad y disponibilidad de la información.
    Aumentar la velocidad de transmisión y reducir costos.

- Ventajas de las redes:

    1. Compartir información: Bases de datos, documentos, programas.

    2. Compartir recursos: Periféricos, dispositivos, CPU, programas.

    3. Trabajo en grupo: Facilita la ejecución de tareas complicadas.

    4. Comunicación: Intercambio eficiente de mensajes.

- Desventajas de las redes:

    1. Privacidad de la información: Uso indebido de la información.

    2. Seguridad de la información: Acceso no autorizado.

- Clasificación de redes:

    1. Por extensión:
        - **LAN:** Red de Área Local.
        - **WAN:** Red de Área Amplia.
        - **MAN:** Red de Área Metropolitana.
        - **WLAN, WMAN, WWAN:** Versiones inalámbricas de LAN, MAN y WAN.
        - **SAN:** Red de Área de Almacenamiento.
        - **PAN:** Red de Área Personal.
    
    2. Por medio de conexión:
        - Red cableada: Cable coaxial, par trenzado, fibra óptica.

        - Red inalámbrica: Ondas electromagnéticas.
    3. Por relación funcional:
        - Cliente-servidor: Clientes conectados a un servidor central.

        - Igual-a-igual (P2P): Nodos que actúan como clientes y servidores.
    4. Por grado de autenticación:
        - Red de acceso público: IP proporcionada por un ISP.

        - Red privada: Direcciones IP privadas, necesita un router para acceso a Internet.
    
### Internet e Intranet:

- Internet: Público, global, abierto a todos.

- Intranet: Privado, dentro de una organización, utiliza tecnología Internet.

### Topología de red:

- **Física:** Bus, estrella, anillo, malla, árbol, mixta.

- **Lógica:**
Difusión (broadcast), transmisión de tokens.

### Servicios y protocolos:

- Servicios: Carpetas compartidas, servicios de impresión, DNS, DHCP.

- Protocolos: Normas para intercambiar información.

# Normalización en las Redes Locales

### Procedimientos y Normas en el Proceso de Comunicación

En cualquier proceso de comunicación, existen procedimientos y normas esenciales que el emisor y el receptor deben seguir para garantizar una transmisión efectiva y sin errores:

- **Identificación de Dispositivos:** Cada dispositivo en la red debe ser identificado de manera única.

- **Control de Transmisión:** Determinar quién puede transmitir en cada momento para evitar colisiones de señales.

- **Sincronización:** El receptor debe identificar claramente cuándo comienza y termina una transmisión.

- **Codificación de Datos:** Los datos se representan en bits y se transforman en señales apropiadas para el canal de comunicación.

- **Información Adicional:** Añadir metadatos a los datos para regular el proceso de comunicación.

- **Ruteo:** Los dispositivos intermedios determinan el camino que deben seguir los mensajes.

- **Control de Errores:** Implementar mecanismos para detectar y corregir errores en la transmisión.

### Protocolos y Estándares

**Protocolos de Comunicación:** Conjunto de normas y procedimientos establecidos por los diseñadores de redes para que los componentes de la red puedan comunicarse.

**Estándares de Red:** Modelos o patrones que permiten a los fabricantes crear componentes compatibles entre sí.

- Estándares de **Facto**: Iniciativa de empresas.
- Estándares de **Jure**: Emitidos por organismos oficiales.

### Organismos Reguladores

**Ámbito Internacional:**

- ITU: Unión Internacional de Telecomunicaciones, sector ITU-T.

- ISO/IEC: Organización Internacional para la Estandarización y Comisión Eléctrica Internacional.

- IEEE: Instituto de Ingenieros Eléctricos y Electrónicos.

**Estados Unidos:**

- ANSI: Instituto Americano de Normas Nacionales.

**Europa:**

- CEN: Comité Europeo de Normalización.

- CENELEC: Comité Europeo de Normalización Electrotécnica.

- ETSI: Instituto Europeo de Estándares de Telecomunicaciones.
España:

- CTN: Comités Técnicos de Normalización.

- AENOR: Asociación Española de Normalización y Certificación.

### Arquitecturas de Red Basadas en Capas

Las arquitecturas de red se dividen en capas para simplificar y estandarizar el proceso de comunicación entre computadoras.

- Modelo **OSI:**

    Surgido para unificar técnicas y conocimientos, aunque complejo para su implementación práctica.
    Se divide en siete capas: Física, Enlace de Datos, Red, Transporte, Sesión, Presentación, Aplicación.

- Modelo **TCP/IP:**

    Más práctico y sencillo, se convirtió en el estándar de facto para las redes.
    Evolucionado a partir de la red ARPANET.

![Imagen OSI/TCP-IP](https://forum.huawei.com/enterprise/api/file/v1/small/thread/682157328142569472.png?appid=esc_es)

**Modelo OSI**

- Capa Física: Define aspectos físicos de transmisión de información (cableado, conectores, señales)

- Capa de Enlace de Datos: Establece un enlace lógico fiable entre dos dispositivos (tramas, control de flujo y errores)

- Capa de Red: Establece enlaces lógicos entre dispositivos en redes distintas (enrutamiento, direccionamiento IP)

- Capa de Transporte: Regula el flujo de información extremo a extremo (segmentos, control de flujo y errores)

- Capa de Sesión: Establece, mantiene y termina sesiones de usuario (control de diálogo, puntos de restauración)

- Capa de Presentación: Ofrece mecanismos de representación de datos (formateo, cifrado, compresión)

- Capa de Aplicación: Interactúa con el usuario final (transferencia de ficheros, correo electrónico, navegación web)

**Modelo TCP/IP**

- Capa de Acceso a la Red: Transmisión de datos sin importar la red configurada.

- Capa de Internet: Transmisión de datagramas utilizando direccionamiento IP.

- Capa de Transporte: Realiza una transmisión fiable entre aplicaciones.

## Capa 1: FÍSICA

En un sistema de transmisión, el medio de transmisión es el soporte físico a través del cual el emisor y el receptor establecen la comunicación. Los medios de transmisión se clasifican en guiados y no guiados, ambos utilizando ondas electromagnéticas para la transmisión. En medios guiados, estas ondas se conducen a través de cables.

### medios guiados:

- Velocidad de transmisión: La velocidad varía significativamente entre los diferentes tipos de cables, con la fibra óptica permitiendo las velocidades más altas.

- Alcance de la señal: Determinado por la atenuación que sufre la señal mientras viaja por el cable. A mayor distancia, mayor atenuación, lo que limita la longitud del cable sin regenerar la señal.

- Calidad de la señal: Un problema principal en la transmisión de datos por cables eléctricos es la inducción electromagnética, que genera interferencias debido al campo magnético alrededor del cable.

- Tipos de Medios de Transmisión Guiados:

    1.  Cable Coaxial:

        - Utilizado en televisión por cable, redes de área local, etc.
        - Tiene una estructura con un conductor central, un aislante, una malla metálica y una cubierta exterior.
        - Ofrece buena protección contra interferencias electromagnéticas.

    2. Par Trenzado:

        - Consiste en dos alambres de cobre aislados y trenzados helicoidalmente.
        - El trenzado reduce la interferencia eléctrica.
        - Clasificado en diferentes categorías según la velocidad y frecuencia que soporta:

            - **UTP** (Unshielded Twisted Pair): No tiene - apantallamiento. Flexible y sensible a interferencias.

            - **STP** (Shielded Twisted Pair): Cada par está apantallado individualmente y globalmente. Alta inmunidad al ruido.

            - **FTP** (Foiled Twisted Pair): Los pares tienen una malla conductora global. Buena protección contra interferencias.
    
    3. Fibra Óptica:

        - Utiliza filamentos de vidrio o plástico para transmitir datos mediante pulsos de luz.

        - Alta velocidad de transmisión, baja atenuación y alta resistencia a interferencias electromagnéticas.

        - Utilizada en redes de alta velocidad, telecomunicaciones y conexiones a larga distancia.

### Medios no guiados

1. Radiofrecuencia:

    Utilizada para comunicación inalámbrica como WiFi, Bluetooth, etc.
    Emite ondas electromagnéticas omnidireccionales o direccionales.

2. Microondas:

    Utilizadas para comunicaciones satelitales y enlaces de larga distancia.
    Requiere visión directa entre antenas.

3. Infrarrojos/Láser:

    Utilizados para comunicación de corto alcance.
    Sensibles a obstáculos físicos entre el emisor y el receptor.

### Elementos de Conexión

Adaptador de Red o Interfaz de Red:

- Dispositivo que permite la conexión a la red.
- Incluye circuitería necesaria para interpretar la información en forma de bits.

Conectores:

- Elementos donde termina la conexión del cable.
- Varían según el tipo de cable y requieren una tarjeta de red compatible.

Antenas:

- Utilizadas en redes inalámbricas.
- ueden ser omnidireccionales (emiten en todas direcciones) o direccionales (emiten en una dirección).
- Transmiten señales electromagnéticas sin necesidad de cables.

    - Clasificación de Antenas:

        - Antenas de Hilo:

        Ejemplos: Monopolo vertical, dipolo, Yagi, espira, helecoidal.
        Antenas de Apertura:
        Ejemplo: Antena parabólica.
        
        - Antenas Planas:

        Compactas y discretas, utilizan matriz planar.
        Agrupaciones de Antenas (Arrays):
        Conjunto de antenas que se comportan como una única antena.

### Transmisiones de Larga Distancia

- Visión Directa: Necesaria para transmisiones sin obstáculos entre antenas emisora y receptora.

- Rebote de Señal: Utilizado en transmisiones terrestres de largas distancias mediante la troposfera o la ionosfera.

- Satélites: Permiten la transmisión de señales rebotadas en condiciones favorables.

### Parámetros de Transmisiones Inalámbricas

- **Frecuencia (f):** Ciclos por segundo (Hz).
- **Amplitud (A):** Variación de la señal.
- **Fase (θ):** Punto en el ciclo donde empieza la onda.

**Ejemplos de Frecuencias:**

- Infrarrojos (300 GHz a 430 THz): Comunicación a corta distancia.
- Luz Visible (430 THz a 770 THz): Comunicación con aplicaciones específicas.
- Radiofrecuencias (3 Hz a 300 GHz): Comunicación inalámbrica común.

**Modulación**

- Modulación Analógica:

    - AM: Modulación de amplitud.
    - FM: Modulación de frecuencia.
    - PM: Modulación de fase.

- Modulación Digital:

    - ASK: Desplazamiento de amplitud.
    - FSK: Desplazamiento de frecuencia.
    - PSK: Desplazamiento de fase.
    - QAM: Modulación de amplitud en cuadratura, combinando amplitud y fase.
    
## Conexiones Cableadas (Par Trenzado)

Categoría 3: Velocidad hasta 10 Mbits/seg.
Categoría 4: Velocidad hasta 16 Mbits/seg.
Las categorías más altas permiten mayores velocidades y mejores prestaciones en las comunicaciones de red.

### fibra óptica

La fibra óptica es una tecnología avanzada de transmisión de datos que utiliza pulsos de luz para transmitir información binaria a través de cables de fibra de vidrio ultradelgados. Este sistema se compone de tres elementos clave: una fuente de luz, el medio de transmisión (la fibra óptica) y un detector que convierte los pulsos de luz en señales eléctricas. A continuación, se detalla el funcionamiento y las características de la fibra óptica, así como las diferentes modalidades y estándares de Ethernet relacionados.

- Componentes del Sistema de Transmisión Óptico
    - Fuente de Luz: Generalmente, un pulso de luz representa un bit 1 y la ausencia de luz representa un bit 0.
    - Medio de Transmisión: La fibra de vidrio ultradelgada que consta de un núcleo y un revestimiento. El núcleo tiene un índice de refracción mayor que el revestimiento, lo que permite la reflexión total interna de la luz.
    - Detector: Un dispositivo que convierte los pulsos de luz en impulsos eléctricos.

- Tipos de Fibra Óptica

    - Monomodo:
    Características: Transmite luz en línea recta.

    - Multimodo:
    Características: La luz se propaga rebotando en la superficie interna del núcleo.

    - Multimodo de Índice Gradual:
    Características: La luz se transmite mediante una refracción gradual.

- Ventajas y Desventajas de la Fibra Óptica


| Ventajas                                                                 | Desventajas                                      |
|--------------------------------------------------------------------------|--------------------------------------------------|
| Alta velocidad de transmisión (hasta 10 Gbps).                           | Alto costo de instalación y mantenimiento.       |
| Baja atenuación.                                                         |                                                  |
| No sufre interferencias electromagnéticas.                               |                                                  |
| Ideal para largas distancias y gran cantidad de información.             |                                                  |

- Conectores para Cables de Fibra Óptica
    - SC (Straight Connection): Conector de inserción directa, utilizado principalmente con fibras monomodo.
    - ST (Straight Tip): Similar al SC pero requiere un giro para la inserción, común en instalaciones Ethernet híbridas.
    - LC (Lucent Connector): Conector pequeño, popular tanto en fibras monomodo como multimodo.

### Ethernet y Estándares IEEE 802.3
Velocidades de Datos y Cables Utilizados

- **10 Mbps:**
    - 10Base5: Coaxial grueso, 500 m.
    - 10Base2: Coaxial fino, 185 m.
    10BaseT: UTP Cat3/Cat5, 100 m.

- **100 Mbps:**
    - 100BaseTX: UTP Cat5 o mayor, 100 m.
    - 100BaseFX: Fibras ópticas multimodo, 500 m.
    - 100BaseT4: 4 pares UTP de Cat3 a 5, 100 m.
    - 1000 Mbps (1 Gbps):
    - 1000BaseCX: 4 pares STP Cat5e o 6, 25 m.
    - 1000BaseTX: 4 pares UTP Cat5e o 6, 100 m.
    - 1000BaseSX: Fibras ópticas multimodo, 550 m.
    - 1000BaseLX: Fibras ópticas monomodo, 2 a 10 km.

- **10 Gbps:**
    - 10GBaseT: 4 pares UTP Cat 6, 100 m.
    - 10GBaseLX4: Fibras ópticas monomodo, 10 km.
    - 10GBaseS: Fibras ópticas multimodo, 300 m.
    - 10GBaseE: Fibras ópticas monomodo, 40 km.

### Colisiones en Ethernet y Segmentación de Redes

- Dominios de Colisión: Área donde una trama puede colisionar con otra. Los switches y routers son necesarios para separar estos dominios y evitar colisiones.

- Tormentas de Difusión: Se generan cuando hay avalanchas de tramas de difusión, lo que puede colapsar la red. Los dispositivos intermedios ayudan a controlar y limitar estos problemas.

## Dispositivos de Interconexión

1. Repetidores: Regeneran la señal para extender el alcance de la red.
2. Concentradores (Hubs):
    - Activos: Regeneran la señal.
    - Pasivos: Solo interconectan los equipos sin regenerar la señal.

Topologías de Conexión: En cascada o en estrella.
![Topología de red](https://upload.wikimedia.org/wikipedia/commons/4/4a/Topología_de_red.png)

## Capa 2: ENLACE

La capa de enlace de datos gestiona la transmisión a través de un enlace físico, mejorando la fiabilidad y ofreciendo servicios adicionales.

### Dispositivos de Red

- **Nodos:** Dispositivos con dirección de red.
- **Dispositivos de acceso al medio:** Operan en capas de enlace y/o física, proporcionando acceso al medio de transmisión.

### Tipos de Enlaces

- Enlaces **punto a punto:** Canal exclusivo entre dos nodos.
- Enlaces de **difusión:** Canal compartido por varios nodos (e.g., redes inalámbricas, hubs).

### Enlace Lógico
Un enlace virtual que contiene la información necesaria para gestionar transmisiones entre nodos a través del enlace físico.

### Trama o Frame
Unidad de datos de los protocolos del nivel de enlace.

### Servicios Típicos de la Capa de Enlace

- Entramado: Encapsulamiento de datos de la capa de red en una trama.
- Métodos de acceso al medio: Controla el acceso al enlace, simple para enlaces punto a punto, complejo para enlaces de difusión.
- Sincronismo: Sincronización del reloj del receptor con el del emisor.
Direccionamiento físico: Identificación única de nodos mediante direcciones MAC.
- Control de flujo: Ajusta la velocidad de envío de tramas al procesamiento del nodo receptor.
- Detección y corrección de errores: Mecanismos para detectar y corregir errores en la transmisión.
- Entrega fiable: Garantiza la entrega de datos mediante retransmisión de tramas dañadas.
- Multiplexación de protocolos: Etiquetado de tramas para indicar el protocolo encapsulado.

### Implementación de Servicios

- Subcapa MAC: Direccionamiento físico, gestión de tramas, sincronización, control de acceso al medio.
- Subcapa LLC: Multiplexación de protocolos, control de flujo, retransmisión de tramas en caso de error.

### Direccionamiento Físico y Direcciones MAC

- Dirección MAC: Identificación única en un medio compartido (48 bits).
- Direcciones MAC especiales: Broadcast (todos los bits a 1), multicast (último bit del primer byte a 1), localmente administradas (penúltimo bit del primer byte a 1).
- Modo promiscuo: Acepta todas las tramas recibidas para análisis de tráfico.

### Métodos de Acceso al Medio

- Particionado del canal:

    - TDM: División del tiempo de uso del canal.
    - FDM: División del ancho de banda del canal.
    - CDMA: Codificación de información con códigos únicos.

- Toma de turnos:

    - Protocolo de sondeo (polling): Nodo maestro dirige los turnos.
    - Protocolo de paso de testigo (token passing): Trama especial (token) intercambiada entre nodos.

- Acceso aleatorio:

    - Aloha: Emisión directa con confirmación de recepción.
    - CSMA: Sondeo del medio antes de emitir.
    - CSMA/CD: Sondeo del canal durante la transmisión.
    - CSMA/CA: Evita colisiones utilizando técnicas específicas.
    
### Control de Errores

Mecanismos para detectar y corregir errores durante la transmisión de una trama.

### Códigos de detección de errores

- Bits de paridad

    Definición: Se agrega un bit, llamado de paridad, al final de cada byte.
    Funcionamiento: El bit de paridad toma un valor específico (por ejemplo, 1) si el número de unos en el byte es par, o su complementario (0) si es impar.
    Propósito: Detectar errores simples de un solo bit.

- Paridad bidimensional

    - Definición: Se calcula el bit de paridad para cada byte y, cada 8 bytes, un bit de paridad adicional para cada conjunto de bits que ocupan el mismo orden en cada uno de los 8 bytes.
    - Capacidad: Permite detectar y corregir algunos errores.
    - Uso: Es un código corrector además de un detector de errores.

- Sumas de comprobación (checksum)

    - Definición: Agrupa los bits en grupos de un tamaño determinado (ej. 16 bits) y los trata como números enteros.
    - Funcionamiento: Se suman todos los grupos y se usa el resultado como código de detección.
    - Propósito: Verificar la integridad de los datos transmitidos.

- Códigos polinomiales o CRC (Cyclic Redundancy Check)

    - Definición: Utilizan operaciones matemáticas complejas para detectar errores.
    - Implementación: Generalmente implementados en hardware, como en el chip controlador del adaptador de red.
    - Capacidad: Muy efectivos en la detección de errores, pero no permiten la corrección de los mismos.

### Topologías Ethernet

- Topología de bus: Utilizaba un bus coaxial.
- Concentradores (hubs): Permitieron una lógica de bus en una topología física de estrella.
- Conmutadores (switches): Permitieron una lógica de conmutación de paquetes en una topología física de estrella.

### Conmutación de las tramas

- Topología: Utiliza una topología física de estrella, centralizando la conexión a la LAN en un punto.
- Dispositivo central: El conmutador, que redirige el tráfico del nivel de enlace hacia el enlace donde se encuentra el destinatario de la trama.

**Conmutadores o switches**

- Definición: 
Dispositivos de acceso con varios puertos de conexión.

- Funciones:
    - Analizar las tramas del nivel de enlace.
    - Extraer la información de destino y redirigir las tramas.
    - Poseen una tabla de direccionamiento MAC y una memoria intermedia para evitar colisiones.

**Funcionamiento de un conmutador**

1. Recepción de una trama:
- Detectar errores y, si existen, descartar la trama.
- Averiguar las direcciones MAC de origen y destino.

2. Comprobación y almacenamiento:
- Verificar la tabla de direccionamiento MAC y, si es necesario, actualizarla.

3. Reenvío de la trama:
- Dirección de broadcast: Reenviar por todos los puertos, excepto el de origen.
- Dirección multicast: Reenviar según configuración del conmutador.
- Dirección unicast: Reenviar por el puerto correspondiente o por todos los puertos si no existe una entrada en la tabla.

**Dominios de colisión y difusión**

- Dominios de colisión: Regiones donde dos tramas pueden colisionar.
- Dominios de difusión: Áreas donde se propaga una trama de broadcast.
- Conmutadores: No separan en dominios de difusión, permitiendo la propagación de tramas de broadcast por todos los puertos.

#### Protocolos de enlace en las LAN

- Ethernet DIX
    - Origen: Desarrollado por Bob Metcalfe y David Boggs, comercializado por Digital Equipment, Intel y Xerox.
    - Características:
    - Utilizaba CSMA/CD.
    - Direccionamiento MAC de 48 bits.
    - Campo de control de errores.

- IEEE 802.3 y derivados
    - Definición: Estándares internacionales del IEEE basados en Ethernet.
    - Características:
    - Servicios de la subcapa MAC.
    - Utilizan CSMA/CD y direccionamiento físico de 48 bits.
    - Campo de control de errores y longitud de datos.

- Ethernet DIX-II
    - Compatibilidad: Compatible con el estándar IEEE 802.3.
    - Características: Similar a Ethernet DIX original, con multiplexación de protocolos.

- Redes Ethernet actuales: Ethernet II
    - Compatibilidad: Coexistencia de IEEE 802.3 y Ethernet DIX-II en la misma LAN.
    - Definición: Parte de la especificación Ethernet II del IEEE.

- Otros protocolos
    - Token ring (IEEE 802.5): Utilizaba una topología de anillo con paso de testigo.
    - FDDI: Basado en una topología de doble anillo de fibra óptica.

- Protocolos de enlace en las LAN inalámbricas
    - IEEE 802.11 (WiFi): Utilizan CSMA/CA, direccionamiento MAC de 48 bits y mecanismos de retransmisión de tramas con errores.
    - Bluetooth (IEEE 802.15): Protocolos para conexiones inalámbricas de corto alcance.

- Protocolos de enlace avanzados
    - IEEE 802.1Q: Permite la creación de redes locales virtuales (VLAN), separando dispositivos en redes lógicas distintas.

### Redes LAN Ethernet II

- Especificación: Permite la coexistencia de IEEE 802.3 y Ethernet DIX-II.
- Características:
    - Direccionamiento físico: Direccionamiento MAC de 48 bits.
    - Formato de las tramas:
    - Preámbulo: 8 bytes para sincronización.
    - Dirección MAC destino y origen: 6 bytes cada una.
    - Tipo / longitud: Diferencia entre Ethernet DIX-II y IEEE 802.3.
    - Datos: Entre 46 y 1500 bytes.
    - FCS: CRC de 32 bits para control de errores.

- Acceso al medio: CSMA/CD.
- Sincronización y delimitación: Mediante el preámbulo y la longitud de la trama.
- Control de errores: A través del campo FCS.
- Multiplexación de protocolos superiores: Utiliza el campo tipo en Ethernet DIX-II.
- Espacio entre tramas (IFG): Tiempo de 96 bits entre transmisiones.

**Especificaciones físicas**

Velocidad, multiplexación y tipo de medio: Variadas según la implementación específica de Ethernet.

### Dispositivos de la capa de enlace

- Puentes (bridges)
Función: Unen dos enlaces de distinta naturaleza y permiten el paso de un tipo de medio a otro dentro del mismo enlace.
- Conmutadores (switches)

- Tipos:
    - Domésticos: Sencillos, pocos puertos (4-8), no configurables.
    - Para rack: Tamaño estándar, muchos puertos (12-36), operan a 100/1000 Mbps.
    - Full-duplex: Comunicación bidireccional simultánea.
    - Configurables: Permiten opciones avanzadas, como VLANs, y administración remota.
    - Puntos de acceso inalámbricos (access points)
    - Función: Integran dispositivos de una red inalámbrica en una LAN cableada.

## Capa 3: RED

**Redes Privadas y Públicas**
Las direcciones IP públicas permiten la conexión a Internet y deben ser únicas en toda la red global. En cambio, las direcciones IP privadas, utilizadas en intranets, permiten la configuración de todos los servicios típicos de Internet (web, correo, mensajería instantánea) dentro de una red privada, sin conflicto de direcciones en Internet.

**Direcciones IP**

- úblicas: Visibles en Internet, permiten que un ordenador sea accesible desde cualquier otro.
- Privadas: Visibles solo en redes internas, utilizadas en empresas. Pueden acceder a Internet a través de un router con IP pública.
- Estáticas: Fijas, usadas por servidores.
- Dinámicas: Cambian con cada conexión, usadas por usuarios finales.

**Clases de direcciones IP**

- Clase A: Gran número de hosts (16,777,214).
- Clase B: Moderado número de hosts (65,534).
- Clase C: Menor número de hosts (254).
- Clase D: Multicast.
- Clase E: Reservadas.

**Máscaras de subred**

Permiten identificar si una dirección IP pertenece a la misma subred. Ejemplos de máscaras: 255.0.0.0 (Clase A), 255.255.0.0 (Clase B), 255.255.255.0 (Clase C).

**Difusión y multidifusión**

- Difusión (broadcast): Envío a todos los hosts de una red.
- Multidifusión (multicast): Envío a varios hosts suscritos a un grupo.
- Unidifusión: Envío a un único host.

**Redes Privadas y Públicas**

- Intranet: Red privada con protocolos TCP/IP, puede tener acceso a Internet.
- Extranet: Unión de dos o más intranets.
- Internet: Red pública de redes TCP/IP.
- Máscara de Subred y Subnetting

Las redes pueden dividirse en subredes para optimizar el uso de direcciones IP.
Ejemplo de subnetting: Una red de Clase C (192.168.1.0/24) puede subdividirse para crear múltiples subredes más pequeñas.

### Protocolos de capa 3

1. **ARP (Address Resolution Protocol):**

Protocolo utilizado para mapear direcciones IP a direcciones MAC (Media Access Control) en una red local, permitiendo que los dispositivos se comuniquen entre sí dentro de una red Ethernet.

2. **ICMP (Internet Control Message Protocol):**

Protocolo utilizado para enviar mensajes de control y error entre dispositivos de red. Es fundamental para el diagnóstico de problemas de red, como con las herramientas ping y traceroute.

3. **NAT (Network Address Translation):**

Técnica utilizada para modificar las direcciones IP en los encabezados de los paquetes mientras están en tránsito, permitiendo que múltiples dispositivos en una red local compartan una sola dirección IP pública.

4. **IGMP (Internet Group Management Protocol):**

Protocolo utilizado para gestionar la membresía de dispositivos en grupos multicast en una red IP, facilitando la transmisión eficiente de datos a múltiples destinatarios.

5. **IGP (Interior Gateway Protocol):**

Conjunto de protocolos de enrutamiento utilizados para el intercambio de información de enrutamiento dentro de un sistema autónomo (AS). Ejemplos comunes incluyen RIP y OSPF.

6. **RIP (Routing Information Protocol):**

Protocolo de enrutamiento de vector de distancia que utiliza el número de saltos como métrica para determinar la mejor ruta. Es sencillo y adecuado para redes pequeñas.

7. **OSPF (Open Shortest Path First):**

Protocolo de enrutamiento de estado de enlace que utiliza el algoritmo del camino más corto primero (SPF) para determinar la mejor ruta para los paquetes de datos dentro de una red IP.

8. **BGP (Border Gateway Protocol):**

Protocolo de enrutamiento de pasarela exterior que gestiona cómo los paquetes son enrutados a través de Internet mediante el intercambio de información de enrutamiento entre sistemas autónomos (AS).

## Capa 4: TRANSPORTE

La capa de transporte del modelo OSI es crucial para la comunicación continua y confiable entre aplicaciones en la red, permitiendo que múltiples servicios (emails, web, mensajería instantánea, etc.) se utilicen simultáneamente en un solo dispositivo.

### Funciones de la Capa de Transporte

1. Segmentación y Reensamblaje de Datos:

    Segmentación: Divide los datos de aplicación en segmentos manejables.
    Reensamblaje: Ensambla los segmentos en el destino para formar el flujo de datos original.

2. Seguimiento de Conversaciones:

    Mantiene múltiples conversaciones entre aplicaciones en hosts origen y destino.

3. Identificación de Aplicaciones:

Usa números de puerto para identificar a qué aplicación corresponde cada segmento de datos.

### Control de las Conversaciones

- Establecimiento de Sesión: Prepara aplicaciones para comunicarse antes de transmitir datos.
- Entrega Confiable: Asegura que todos los segmentos lleguen al destino, con retransmisión en caso de pérdida.
- Entrega en el Mismo Orden: Mantiene el orden de los segmentos recibidos.
- Control de Flujo: Regula la cantidad de datos transmitidos para evitar sobrecargas.

### Soporte de Comunicación Confiable

- Operaciones Básicas:
    - Seguimiento de datos transmitidos.
    - Acuse de recibo de datos recibidos.
    - Retransmisión de datos no reconocidos.

### Protocolos de Transporte: TCP y UDP

1. Protocolo de Control de Transmisión (TCP):

- Orientado a conexión.
- Proporciona entrega confiable, ordenada y control de flujo.
- Utiliza más recursos, adecuado para aplicaciones que requieren alta confiabilidad (exploradores web, email, transferencia de archivos).

2. Protocolo de Datagramas de Usuario (UDP):

- Sin conexión.
- Proporciona entrega rápida con menos recursos.
- Adecuado para aplicaciones donde la pérdida de datos es tolerable (DNS, streaming de video, VoIP).

### Direccionamiento de Puertos

- Puertos: Números que identifican las aplicaciones en comunicación.

**Tipos de Puertos:**

- Bien Conocidos (0-1023): Reservados para servicios comunes (HTTP, SMTP).
- Registrados (1024-49151): Asignados a procesos o aplicaciones de usuario.
- Dinámicos/Privados (49152-65535): Asignados dinámicamente para conexiones temporales.

### Segmentación y Reensamblaje

- TCP: Utiliza números de secuencia en los encabezados para asegurar el orden de los segmentos.
- UDP: No mantiene el orden ni la conexión, proporcionando una transferencia más rápida pero menos confiable.

### Comunicación Confiable con TCP

- Sesiones Orientadas a Conexión:
Establecen una conexión bidireccional antes de transmitir datos.

- Acuses de Recibo:
Garantizan la confiabilidad al confirmar la recepción de datos.

### Establecimiento de la Conexión TCP

Intercambio de Señales de Tres Vías **(Three-Way Handshake)**:

Objetivos:
- Verificar que el dispositivo de destino esté presente en la red.
- Confirmar que el dispositivo de destino tiene un servicio activo en el puerto destino.
- Informar al dispositivo de destino que el cliente intenta establecer una sesión de comunicación.

Pasos:
- SYN (Cliente a Servidor): El cliente envía un segmento con un valor de secuencia inicial.
- SYN-ACK (Servidor a Cliente): El servidor responde con un segmento que contiene un valor de reconocimiento y su propio valor de secuencia.
- ACK (Cliente a Servidor): El cliente envía un segmento de reconocimiento.

**Campos de Control del Encabezado TCP:**

- URG: Indica datos urgentes.
- ACK: Campo significativo de acuse de recibo.
- PSH: Función de empuje.
- RST: Reconfiguración de la conexión.
- SYN: Sincronizar números de secuencia.
- FIN: Finalización de la transmisión de datos.

### Finalización de la Conexión TCP

- Proceso de Cuatro Pasos:

    - FIN (Cliente a Servidor): El cliente indica que no tiene más datos para enviar.
    - ACK (Servidor a Cliente): El servidor confirma la recepción del FIN.
    - FIN (Servidor a Cliente): El servidor indica que no tiene más datos para enviar.
    - ACK (Cliente a Servidor): El cliente confirma la recepción del FIN del servidor.

### Protocolos capa 4

- **NTP (Network Time Protocol)**
Sincronizar el reloj de los sistemas computacionales a través de redes de datos.
Utiliza el protocolo UDP en el **puerto 123**.

Asegura que todos los dispositivos en una red tengan el mismo tiempo, esencial para la coordinación de eventos y tareas.

Puede proporcionar una precisión de sincronización de hasta unos pocos milisegundos en redes de alta latencia.

- **DNS (Domain Name System)**

Traducir nombres de dominio (como www.example.com) en direcciones IP (como 192.0.2.1).

Utiliza principalmente el protocolo UDP en el **puerto 53**, pero puede usar TCP para consultas más largas y transferencias de zona.

- **SCTP (Stream Control Transmission Protocol)**

Proporcionar transporte de datos confiable y con control de flujo similar a TCP, pero con características adicionales.

### Cacharros de capa 4

- Router con nat 
- Firewall

### Firewall

Filtro solo ve la ip y puerto no ve la infromación del paquete

- pueden tener listas de ip
- malo: embudo

## Capa 5: SESIÓN

1. Establecimiento de Sesión: Permite a los dispositivos iniciar sesiones de comunicación entre sí. Esto implica la autenticación y la negociación de parámetros de comunicación.

2. Mantenimiento de Sesión: Gestiona y controla el flujo de datos durante la comunicación, garantizando que la información se transmita de manera ordenada y sin errores. También maneja la recuperación de sesiones interrumpidas debido a fallas de red o dispositivos.

3. Terminación de Sesión: Finaliza adecuadamente las sesiones de comunicación una vez que se ha completado la transferencia de datos, liberando los recursos utilizados y cerrando la conexión entre los dispositivos.

## Capa 6: PRESENTACIÓN

1. Traducción de Datos: Convierte los datos recibidos desde la capa superior en un formato adecuado para su transmisión a través de la red, y viceversa, traduciendo los datos recibidos de la red al formato utilizado por la aplicación.

2. Compresión de Datos: Reduce el tamaño de los datos mediante técnicas de compresión, lo que ayuda a optimizar la eficiencia del ancho de banda y acelerar la transferencia de datos.

4. Cifrado y Encriptación: Proporciona mecanismos de seguridad para proteger la confidencialidad y la integridad de los datos durante su transmisión, mediante la aplicación de algoritmos de cifrado y encriptación.

5. Formato de Datos: Define y gestiona la estructura y el formato de los datos, incluyendo la codificación de caracteres, la representación de números y la gestión de la sintaxis utilizada para la comunicación entre aplicaciones.

## Capa 7: APPLICACIÓN

- La capa de Aplicación es responsable de proporcionar acceso directo a los procesos subyacentes que administran y envían comunicaciones a la red humana.

- Sirve como origen y destino de las comunicaciones en las redes de datos, permitiendo a los usuarios interactuar con la red de manera significativa y efectiva.

### Protocolos de capa 7

- **DNS (Domain Name System):** Un sistema de nombres de dominio que traduce nombres de dominio legibles por humanos en direcciones IP numéricas utilizadas por las computadoras para comunicarse en redes.

- **Telnet:** Un protocolo que permite a un usuario controlar de forma remota otra computadora a través de una red, como si estuviera sentado físicamente frente a ella.

- **SSH (Secure Shell):** Un protocolo de red que proporciona una forma segura de acceder a un dispositivo remoto a través de una conexión encriptada, utilizado para administrar sistemas y transferir archivos de forma segura.

- **SMTP (Simple Mail Transfer Protocol):** Un protocolo utilizado para enviar correos electrónicos desde un cliente de correo electrónico a un servidor de correo electrónico o entre servidores de correo electrónico.

- **POP3 (Post Office Protocol versión 3):** Un protocolo que permite a un cliente de correo electrónico recuperar correos electrónicos almacenados en un servidor de correo electrónico remoto y descargarlos en el dispositivo del usuario.

- **IMAP (Internet Message Access Protocol):** Un protocolo similar al POP3 que permite a un cliente de correo electrónico acceder y administrar correos electrónicos almacenados en un servidor de correo electrónico remoto, manteniendo los correos electrónicos en el servidor.

- **DHCP (Dynamic Host Configuration Protocol):** Un protocolo utilizado para asignar direcciones IP de manera dinámica a dispositivos en una red, así como también configurar otros parámetros de red, como la puerta de enlace predeterminada y la configuración de DNS.

- **HTTP (Hypertext Transfer Protocol):** Un protocolo utilizado para la transferencia de datos en la World Wide Web, principalmente para el acceso a recursos como páginas web y archivos multimedia.

- **HTTPS (Hypertext Transfer Protocol Secure):** Una versión segura del protocolo HTTP que utiliza una capa adicional de seguridad mediante el cifrado de la comunicación entre el cliente y el servidor, comúnmente utilizado para transacciones en línea y acceso a contenido sensible.

**FTP (File Transfer Protocol):** Un protocolo utilizado para la transferencia de archivos entre dispositivos en una red, permitiendo la carga y descarga de archivos de forma eficiente y segura.

### Proxy

- Es como un firewall pero si ve la información que hay dentro del paquete y filta (decide)
- La peticion le llega u hace de cliente (intermediario)
- Hace cacheado
- Anonimato

### Cacharro de capa 7

- Servidores
- Proxy

## SEGURIDAD 

### Seguridad física:

- Control de acceso a equipos mediante tarjetas, contraseñas, biometría, etc.
- Protección contra peligros físicos como agua, polvo, etc.
- Cuidado en la limpieza de equipos para evitar daños con líquidos o abrasivos.

### Principio de "menos es más":

Eliminar o desactivar software, servicios, usuarios, puertos y permisos no necesarios.

### Servidores dedicados:

Asignar un servidor para cada servicio de red para mayor seguridad y estabilidad.

### Mantenimiento y actualización:

Mantener el sistema operativo, aplicaciones y servicios siempre actualizados para resolver vulnerabilidades.

### Encriptación:

Encriptar comunicaciones, discos y otros datos sensibles.

### Implementar logging:

Utilizar ficheros de registros para registrar eventos relevantes del sistema y detectar posibles amenazas.

### Utilizar firewall:

Configurar firewalls para filtrar el tráfico de red y controlar quién y qué puede acceder a la red.

### Emplear proxy:

Utilizar proxies para filtrar contenido a nivel de aplicación y permitir cacheado y otras opciones avanzadas.

### Medidas adicionales:

- Cerrar puertos no necesarios y cambiar los puertos por defecto cuando sea posible.
- Emplear herramientas antivirus, de monitorización, auditorías, IPS (prevención de intrusiones), IDS (detección de intrusiones), entre otras.
- Restringir el uso de dispositivos I/O no necesarios como USB, CD-ROM, etc.
- Configurar contraseñas seguras y proteger la BIOS.
- Utilizar sandbox y máquinas virtuales para probar software potencialmente dañino.
- Implementar políticas de backup, RAID, SAI (UPS), entre otras.


