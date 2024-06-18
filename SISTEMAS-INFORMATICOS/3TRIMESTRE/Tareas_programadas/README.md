# GNU/Linux 

Resuelve los siguientes apartados. Cuando se pregunte por qué comando se utilizaría, debes indicar el comando completo, con las opciones y parámetros necesarios para que funcione:

1. Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am.

```bash
at next monday 2:00 <<< "uptime > ~/cargaNextMonday 2> carga.err"
# o
echo "uptime > ~/cargaNextMonday.txt 2> ~/carga.err" | at next monday 2:00
```

2. Guardar en un fichero llamado "cargaAllMondays.txt" situado en el HOME la carga del sistema TODOS los lunes a las 2:00 am

```bash
#abrir crontab

crontab -e

# añadir línea
  0   2  * * 1  uptime >> ~/cargaAllMondays.txt 2>&1
# min h dm m ds 
```

3. Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida.

```bash
crontab -e

*/30 * * * * uptime >> ~/carga30min.txt 2>&1

```

4. Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes.

```bash
0 3 10,20,30 * * find /home -type f -mtime +30 -exec rm {} \;

```
5. Realizar los siguientes pasos (crea un script con nombre "miscript.sh" en tu HOME que simplemente imprima la fecha en el formato: "Ahora mismo son las HH:MM del día DD/MM/YYYY"). En cada tarea haz que la salida se añada a un fichero llamado "datos_fecha.txt" localizado en tu HOME).
```bash
echo 'echo "Ahora mismo son las $(date +"%H:%M del día %d/%m/%Y")"' > ~/miscript.sh
chmod +x ~/miscript.sh

```
6. Ejecutar el script "~/miscript.sh" en 12 horas a partir de ahora.
```bash
echo "~/miscript.sh" | at now + 12 hours

```

7. Ejecutar el script "~/miscript.sh" a las horas en punto de 8:00 a 12:00 (ambas inclusive) los fines de semana de febrero a abril (ambos inclusive).

```bash
crontab -e

0 8-12 * 2-4 6,7 ~/miscript.sh >> ~/datos_fecha.txt 2>&1


```

8. Ejecutar el script "~/miscript.sh" justo en una semana a partir de ahora.

```bash
echo "~/miscript.sh" | at now + 1 week

```
9. Ejecutar el script "~/miscript.sh" cada 4 horas durante los diez primeros días de cada mes.
```bash
crontab -e 

0 */4 1-10 * * ~/miscript.sh >> ~/datos_fecha.txt

```
10. Ejecutar el script "~/miscript.sh" sólo cuando la carga baje de 1.5.
```bash
batch << EOF
echo "~/miscript.sh" >> ~/datos_fecha.txt
EOF

```
11. Mostrar que las ejecuciones están programadas y esperando para ejecutarse.

```bash
atq
#o
crontab -l
```

12. Eliminar/comentar todas las ejecuciones programadas

```
atrm $(atq -q)
# o
crontab -r

```

# MS Windows
Crear un programa batch que muestre un mensaje y la fecha y hora y ejecutar este fichero según lo indicado (se debe añadir la salida en un fichero de texto):

1. El próximo lunes a las 12:50
```batch
schtasks /create /sc once /st 12:50 /tn tarea1 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
2. Todos los días a las 16:30
```batch
schtasks /create /sc daily /st 16:30 /tn tarea2 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
3. Todas las semanas a las 23:00.

```batch
schtasks /create /sc weekly /d MON /st 23:00 /tn tarea3 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
4. Todos los meses a las 11:00
```batch
schtasks /create /sc monthly /d 1 /st 11:00 /tn tarea4 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
5. Cuando el sistema tenga baja carga
```batch
schtasks /create /sc onidle /tn tarea5 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
1. Los lunes, miércoles y viernes a las 20:00
```batch
schtasks /create /sc weekly /d MON,WED,FRI /st 20:00 /tn tarea6 /tr "cmd /c echo Mensaje && echo Fecha y Hora: %date% %time%" >> C:\Ruta\al\Fichero.txt

```
1. Mañana a las 12:00, y repetir la ejecución 5 veces cada 10 minutos
```batch
schtasks /create /sc once /sd %date% /st 12:00 /tn tarea7 /tr "cmd /c for /l %i in (1,1,5) do (echo Mensaje && echo Fecha y Hora: %date% %time%) && timeout /t 600" >> C:\Ruta\al\Fichero.txt

```