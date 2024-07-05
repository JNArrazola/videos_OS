# 2.5 Conexión remota
El `acceso remoto` es la capacidad de los usuarios de conectarse desde cualquier sitio a un dispositivo o una red. Mediante este acceso, los usuarios pueden administrar *archivos* y *datos* que se encuentran guardados en un dispositivo remoto, lo que les permite **colaborar** de manera continuada y mantener su **productividad** desde **cualquier sitio**.

## 2.5.1 Servicio de red de conexión remota.
Un `servicio de red de conexión remota` es una tecnología que permite a los usuarios acceder a una red o a un sistema informático desde una **ubicación remota**. Estos servicios son cruciales para el *acceso* y la *administración* de recursos de red cuando los usuarios `no están físicamente presentes` en la misma ubicación que los recursos.

Algunos ejemplos pueden ser: 
* `VPN`: Permite a los usuarios conectarse a una red privada a través de una red pública como internet de manera segura.
* `SSH`: Protocolo utilizado para acceder de manera segura a una computadora remota. **SSH** cifra las conexiones y permite la **ejecución de comandos** en la máquina remota.
* `TELNET:` Un protocolo de red que permite a los usuarios conectarse a una máquina remota a través de la *línea de comandos*. Sin embargo, a diferencia de SSH, Telnet **no cifra la conexión** y **es menos seguro**.

## 2.5.2 Características de servicios de red de conexión remota.
Entre las características principales de este tipo de servicio se puede distinguir: 
* **Seguridad**: Los servicios de conexión remota suelen incluir medidas de seguridad como `cifrado` y `autenticación` par aproteger los datos transmitidos y prevenir accesos no autorizados.
* **Flexibilidad**: Permiten a los usuarios trabajar desde **cualquier lugar**, siempre y cuando tengan acceso a `internet`.
* **Gestión remota**: Facilitan la **administración de servidores** y otros recursos de red sin necesidad de estar `físicamente presentes`.
* **Acceso a recursos**: Los usuarios pueden **acceder a archivos**, **aplicaciones** y otros **recursos** de la red remota como si estuvieran en la red local.

## 2.5.3 Tipos y características de conexiones remotas.
Entre los tipos y características de conexiones remotas encontramos: 

### 1. **`VPN (Virtual Private Network)`**
**Características:**
- `Cifrado`: Los datos se cifran para proteger la privacidad y la seguridad.
- `Acceso seguro`: Permite el acceso a una red privada a través de una red pública.
- `Integridad de datos`: Asegura que los datos no se alteren durante la transmisión.

> Entre los usos comunes de una `VPN`, podemos encontrar el acceso remoto seguro a redes corporativas y la navegación segura en internet.

### 2. **`SSH (Secure Shell)`**

**Características:**
- `Cifrado`: Proporciona una conexión segura y cifrada.
- `Autenticación`: Utiliza métodos de autenticación robustos, como claves públicas y privadas. 
- `Acceso a línea de comandos`: Permite ejecutar comandos en una máquina remota.

> Entre los usos comunes de esta tecnología, nos encontramos con la **administración de servidores** y acceso remoto a sistemas **Unix/Linux**.

### 3. **`TELNET`**
**Características:**
- `Conexión sin cifrado`: No cifra los datos, lo que lo hace menos seguro que **SSH**.
- `Acceso a línea de comandos`: Permite el **acceso** a la línea de comandos de una máquina remota.
- `Protocolo deprecado`: Ha sido en gran medida **reemplazado** por SSH debido a sus problemas de seguridad.

> Entre los usos más comunes se encuentra la **configuración de equipos de red**, siempre y cuando la seguridad no sea una preocupación principal.

## 2.5.4 Explicar la instalación o actualización para tener disponible el servicio de SSH. 
En el caso de `EndeavourOS`,, se pueden seguir los siguientes pasos: 

### Instalación del servicio **SSH**
1. **Abrir** una terminal.
2. **Actualizar** el sistema: 
```sh
$ sudo pacman -Syu
```
3. **Instalar** `openssh` con el siguiente comando: 
```sh
$ sudo pacman -S openssh
```
4. **Iniciar** el servicio SSH:
```sh
$ sudo systemctl start sshd
```
5. **Habilitar** el servicio SSH al inicio del ssitema: 
```sh
$ sudo systemctl enable sshd
```
6. **Verificar** el estado del servicio:
```sh
$ sudo systemctl status sshd 
```
> Siguiendo estos pasos, el equipo debería estar listo tanto para actuar como servidor, como para actuar como cliente.

## 2.5.5 Explicar el funcionamiento de los comandos y parámetros de conexión remota.
### Comando básico para conectarse a un servidor remoto.
```sh
$ ssh usuario@host
```
Donde: 
- **usuario**: Es el nombre de usuario del servidor remoto.
- **host**: La dirección IP o el nombre de dominio del servidor remoto.

Una vez se realicé este paso, se le pedirá al usuario que se está intentando conectar que ingrese la contraseña del dispositivo (siempre y cuando se haya establecido una contraseña previamente). Posterior a escribir la contraseña, el usuario obtendrá el acceso a la terminal de la máquina en cuestión.

### Especificar un puerto diferente.
Por defecto, `SSH` utiliza el puerto 22. Sin embargo, si el servidor está configurado para escuchar un puerto diferente, es posible especificar el puerto con el parámetro **-p**.
```sh
ssh usuario@host -p puerto
```
Donde: 
- **puerto**: Es el número de puerto que el servidor SSH está escuchando.

## 2.5.6 Explicar el funcionamiento de los comandos de transferencia de archivos y directorios.
### `SCP (Secure Copy)` 
`SCP` es un comando que permite **copiar** archivos y directorios entre sistemas de manera segura utilizando **SSH**. La sintaxis básica es la siguiente: 
```sh
$ scp [opciones] origen destino
```
### Ejemplos prácticos
1. Copiar un archivo desde el `local` ⇒ `remoto`:
```sh
$ scp archivo.txt usuario@remoto:/ruta/destino/
```
2. Copiar un archivo desde el `remoto` ⇒ `local`:
```sh
$ scp usuario@remoto:/ruta/origen/archivo.txt /ruta/destino
```
3. Copiar un directorio recursivamente: 
```sh
$ scp -r directorio/ usuario@remoto:/ruta/destino
```
