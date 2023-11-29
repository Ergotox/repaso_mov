# repaso_mov
# Pasos para realizar el proyecto
1. Al crear tu proyecto limpia tu main.dart quitandole la plantilla que se genera por defecto.
2. Para hacer uso del DDD necesitamos realizar la distribución correcta de carpetas, en caso de este proyecto tenemos la siguiente distribución - El contenido de cada bounded puede variar.
   
<div align="center">
  <img src="images/distribución.png" alt="Logo" width=60%>
</div>

3. Ahora que tenemos las carpetas creadas, pasamos a importar las dependencias que usaremos, http, path y sqflite, para la correcta realización.
   
<div align="center">
  <img src="images/dependencies.png" alt="Logo" width=60%>
</div>

4. Primero creamos la barra de negación ya que esto nos permitirá trasladarnos de pestaña a pestaña, lo haremos en el bounded de navegación (dentro de app_navigation.dart está más detallado).
   
5. Vamos a la creación del service para poder hacer uso del api, para ello primero tenemos que crear la clase donde almacenaremos los datos que recibiremos del API, esto guiandonos de los datos que nos bota el Api como la imagen a continuación.
   
<div align="center">
  <img src="images/model a seguir.png" alt="Logo" width=80%>
</div>

3. Una vez creada la clase deberia quedar algo así (Revisar el archivo)

<div align="center">
  <img src="images/characterclass.png" alt="Logo" width=90%>
</div>

7. Como tambien trabajaremos con almacenamiento local, crearemos la base de datos y el repository 
* Database
  
<div align="center">
  <img src="images/databse.png" alt="Logo" width=90%>
</div>

* Repository (Revisar el archivo)
  
<div align="center">
  <img src="images/characterrepository.png" alt="Logo" width=90%>
</div>

8. Ahora si pasaremos a crear el service, el cual deberia quedar de la siguiente manera

<div align="center">
  <img src="images/service.png" alt="Logo" width=90%>
</div>

9. Para mostrar la lista de los personajes de rick and morty necesitamos 3 cosas, primero el card donde se mostrará su imagen y su nombre, el contenedor donde estarán todos esos cards y el detalle de estas mismas
10. Primero comenzaremos con el widget de card, despues con la vista details, con estos 2 ya podriamos realizar el home donde se mostraran los personajes principales.
11. Ahora finalizamos esta sección implementando el character container 
12. con todo esto implementado realizamos la pagina de busqueda 
13. Seguimos con la pagina de favoritos y finalizamos con cambiar las referencias en el AppNavigator
14. Para cambiar el icon primero necesitamos crear una capeta assests->icons->icon.png
    
<div align="center">
  <img src="images/service.png" alt="Logo" width=90%>
</div>

15.  Una vez creada, para poderlo usar necesitamos agregar la ruta en nuestro archivo pubspec.yaml
<div align="center">
  <img src="images/yaml_icons.png" alt="Logo" width=90%>
</div>