# NaviBook

*NaviBook* es una aplicación móvil desarrollada con Flutter, diseñada para ayudar a los usuarios a gestionar eficientemente sus colecciones de libros. Ya seas un lector ávido que busca organizar sus libros favoritos, rastrear su progreso de lectura o descubrir nuevos títulos, NaviBook ofrece una experiencia intuitiva y fluida para satisfacer todas tus necesidades de gestión de libros.

## Tabla de Contenidos

- [NaviBook](#navibook)
  - [Tabla de Contenidos](#tabla-de-contenidos)
  - [Características](#características)
  - [Capturas de Pantalla](#capturas-de-pantalla)
  - [Video de Demostración](#video-de-demostración)
  - [Inicio Rápido](#inicio-rápido)
    - [Prerequisitos](#prerequisitos)
    - [Instalación](#instalación)
  - [Uso](#uso)
  - [Estructura del Proyecto](#estructura-del-proyecto)
  - [Arquitectura](#arquitectura)
  - [Gestión de Estado](#gestión-de-estado)
  - [Enrutamiento](#enrutamiento)
  - [Persistencia de Datos](#persistencia-de-datos)
  - [Contribuciones](#contribuciones)
  - [Licencia](#licencia)
  - [Contacto](#contacto)

## Características

- **Gestión de Perfil de Usuario:**
  - Crear, ver y editar tu perfil personal.
  - Almacenamiento persistente de información de perfil usando `SharedPreferences`.
  
- **Colección de Libros:**
  - Navegar a través de una lista curada de libros.
  - Ver información detallada sobre cada libro.
  
- **Favoritos:**
  - Marcar libros como favoritos para un acceso rápido.
  - Gestionar tu lista de libros favoritos de manera fluida.
  
- **Diseño Responsivo:**
  - Optimizado para diferentes tamaños de pantalla y orientaciones.
  
- **Validación de Formularios:**
  - Validaciones robustas para asegurar la integridad de los datos en los formularios de usuario.
  
- **Gestión de Estado:**
  - Gestión eficiente del estado usando Riverpod para un código escalable y mantenible.

## Capturas de Pantalla

![Pantalla de Inicio](https://res.cloudinary.com/dsqonpjii/image/upload/v1730921557/navibook/uiq3kyjoacmmvpzsemxw.png)
*Pantalla de Inicio mostrando la colección de libros.*

![Pantalla detalle](https://res.cloudinary.com/dsqonpjii/image/upload/v1730921506/navibook/shprymky33cf0u7u8rz7.png)
*Pantalla de Perfil mostrando información del usuario en modo de solo lectura.*

![Pantalla Busquedad](https://res.cloudinary.com/dsqonpjii/image/upload/v1730921543/navibook/ck8l5seyeky74nlynl7x.png)
*Pantalla de Perfil mostrando información del usuario en modo de solo lectura.*

![Editar Perfil](https://res.cloudinary.com/dsqonpjii/image/upload/v1730921486/navibook/fwevaofxjzosvqsbkvuc.png)
*Pantalla de Editar Perfil permitiendo a los usuarios actualizar su información.*

## Video de Demostración

[Demo del Video](https://res.cloudinary.com/dsqonpjii/video/upload/v1730921791/navibook/zm1f87ggcp6htlou23r1.mov)

*Haz clic en la imagen de arriba para ver una demostración de NaviBook en acción.*

## Inicio Rápido

Sigue estas instrucciones para configurar y ejecutar NaviBook en tu máquina local para desarrollo y pruebas.

### Prerequisitos

- **Flutter SDK:** Asegúrate de tener Flutter instalado. Si no, sigue la [guía oficial de instalación de Flutter](https://flutter.dev/docs/get-started/install).
- **Dart SDK:** Incluido con Flutter.
- **IDE:** Visual Studio Code, Android Studio o cualquier IDE preferido con soporte para Flutter.
- **Dispositivo/Emulador:** Un dispositivo físico o emulador para ejecutar la aplicación.

### Instalación

1. **Clonar el Repositorio:**

```bash
  git clone https://github.com/tu_usuario/navibook.git
  cd navibook
```

2. **Instalar Dependencias:**

Ejecuta el siguiente comando para instalar todas las dependencias necesarias:

```bash
  flutter pub get
```

3. **Ejecutar la Aplicación:**

Conecta tu dispositivo o inicia un emulador, luego ejecuta:

```bash
  flutter run
```

Alternativamente, puedes usar las herramientas integradas de tu IDE para ejecutar la aplicación.

## Uso

Una vez que la aplicación esté en funcionamiento, puedes navegar a través de las diferentes secciones:

1. **Pantalla de Inicio:**
   - Navega a través de la lista de libros disponibles.
   - Toca un libro para ver información detallada.

2. **Pantalla de Perfil:**
   - Ver tu información de perfil en modo de solo lectura.
   - Toca el icono de editar para modificar tus detalles.
   - Después de editar, toca el icono de guardar para persistir los cambios.

3. **Favoritos:**
   - Marca libros como favoritos para un acceso rápido.
   - Ver y gestionar tu lista de libros favoritos.

## Estructura del Proyecto

El proyecto sigue una estructura limpia y modular para asegurar la mantenibilidad y escalabilidad.

```arduino
navibook/
├── android/
├── ios/
├── lib/
│   ├── config/
│   │   ├── router/
│   │   │   └── app_router.dart
│   │   └── theme/
│   │       └── app_theme.dart
│   ├── domain/
│   │   └── entities/
│   │       └── user_profile.dart
│   ├── presentation/
│   │   ├── providers/
│   │   │   └── profile_provider.dart
│   │   ├── screens/
│   │   │   ├── home_screen.dart
│   │   │   ├── book_screen.dart
│   │   │   └── profile_view.dart
│   │   ├── views/
│   │   │   ├── home_view.dart
│   │   │   ├── favorites_view.dart
│   │   │   └── profile_view.dart
│   │   └── widgets/
│   │       ├── profile_form_fields.dart
│   │       └── custom_bottom_navigation.dart
│   ├── main.dart
├── assets/
│   └── images/
│       ├── logo.png
│       ├── home_screen.png
│       ├── profile_screen.png
│       └── edit_profile.png
├── test/
│   └── profile_provider_test.dart
├── pubspec.yaml
└── README.md
```

## Arquitectura
NaviBook sigue un enfoque de Arquitectura Limpia (Clean Architecture), separando las preocupaciones en diferentes capas para mejorar la testabilidad y mantenibilidad.

## Gestión de Estado
La aplicación utiliza Riverpod para la gestión del estado, proporcionando una solución robusta y escalable para manejar el estado de la aplicación.

- Providers: Definidos en lib/presentation/providers/, principalmente usando StateNotifierProvider para gestionar estados complejos como perfiles de usuario.

## Enrutamiento
GoRouter se utiliza para manejar la navegación dentro de la aplicación, ofreciendo un enfoque declarativo para la gestión de rutas.
  - Configuración de Rutas: Ubicada en lib/config/router/app_router.dart, definiendo rutas para las pantallas de inicio, libros y perfil.

## Persistencia de Datos
SharedPreferences se emplea para persistir datos de usuario localmente, asegurando que los perfiles de usuario y preferencias se retengan entre sesiones de la aplicación.
  - Persistencia de Perfil: Gestionada por UserProfileNotifier en lib/presentation/providers/profile_provider.dart, manejando operaciones de carga y guardado.  

## Contribuciones
¡Las contribuciones son bienvenidas! Por favor, sigue estos pasos para contribuir a NaviBook:

1. Fork del Repositorio:
Haz clic en el botón "Fork" en la parte superior derecha de la página del repositorio.

2. Clonar tu Fork:
```bash
git clone https://github.com/tu_usuario/navibook.git
cd navibook
```

3. Crear una Nueva Rama:
```bash
git checkout -b feature/NombreDeTuFeature
```

4. Realizar tus Cambios:
Implementa tu feature o corrige bugs según sea necesario.

5. Commit de tus Cambios:
```bash
git commit -m "feat: Añadir descripción de la nueva feature"
```

6. Push a tu Fork:
```bash
git push origin feature/NombreDeTuFeature
```

7. Crear un Pull Request:

Navega al repositorio original y crea un pull request desde tu fork.

## Licencia
Este proyecto está licenciado bajo la Licencia MIT.

## Contacto
Para cualquier consulta o retroalimentación, por favor contacta a:

Nombre: Jasan Hernández
Email: jasan814@gmail.com
GitHub: [jasanhdz](https://github.com/jasanhdz)
LinkedIn: [Jasan](https://www.linkedin.com/in/jasanhdz/)