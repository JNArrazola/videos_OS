# Video: Exposición 2.3 Scripts de la interfaz de línea de comandos y 2.4 Comandos para empaquetar y comprimir archivos y directorios

## 2.3.5 Ejecutar script creado en Linux desde un lenguaje de programación
La ejecución de scripts de Bash desde un lenguaje de programación puede variar dependiendo del lenguaje que estés usando.
```java
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ExecuteScript {
    public static void main(String[] args) {
        try {
            // Define el script a ejecutar
            String scriptPath = "/home/jarrazola/Documents/video_equipo_unidad2/script.sh";

            // Ejecuta el script
            ProcessBuilder processBuilder = new ProcessBuilder("bash", scriptPath);
            Process process = processBuilder.start();

            // Lee la salida del script
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            // Espera a que el proceso termine
            int exitCode = process.waitFor();
            System.out.println("Exited with code: " + exitCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```
## 2.3.6 Utilizar el comando cron para ejecutar un script en una hora especificada de forma diaria, semanal y mensual
## Instalar cron en arch: 
```bash
pacman -S cronie
systemctl enable --now cronie.service
crontab  -e
```

`cron` es una utilidad de **Linux** que permite programar tareas para que se ejecuten en momentos específicos. Para editar las tareas programadas, puedes usar el comando `crontab -e`.

### Ejemplos: 
- Diariamente a las 2:30 AM: 
```bash
30 2 * * * /ruta/al/script.sh
```
- Semanalmente a las 3:00 AM del lunes: 
```bash
0 3 * * 1 /ruta/al/script.sh
```
- Mensualmente a las 4:00 AM del primer día del mes: 
```bash
0 4 1 * * /ruta/al/script.sh
```
### Estructura de `cron`
```txt
*     *     *     *     *     comando a ejecutar
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +----- día de la semana (0 - 6) (domingo=0)
|     |     |     +------- mes (1 - 12)
|     |     +--------- día del mes (1 - 31)
|     +----------- hora (0 - 23)
+------------- minuto (0 - 59)
```
### Ver procesos programados: 
```bash
[jarrazola@archlinux ~]$ crontab -l
```
### Ejecutar un script al iniciar el SO:
1. Entramos a la ruta: 
    ```sh
    cd /etc/systemd/system/
    ``` 
2. Creamos el archivo: 
   ```sh
    sudo touch archivo.service
   ```
3. Editamos el archivo: 
   ```sh
    sudo nano archivo.service
   ```
4. Añadimos la configuración: 
    ```sh
    [Unit]
    Description=Ejecutar script al inicio

    [Service]
    ExecStart=/ruta/al/script.sh
    Type=oneshot
    RemainAfterExit=true

    [Install]
    WantedBy=multi-user.target
    ```
5. Recargamos daemons: 
    ```sh
    sudo systemctl daemon-reload
    ```
6. Activamos el servicio: 
    ```sh
    sudo systemctl enable miscript.service
    ```
7. Verificamos el estado del servicio: 
    ```sh
    sudo systemctl status miscript.service
    ```
8. Desactivarlo: 
    ```sh
    sudo systemctl disable nombre_del_servicio.service
    ```