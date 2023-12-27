# karate

Este proyecto esta otientado a la automatizacion de pruebas de API usando Karate con Cucumber

> :information_source: Este Repositorio tiene fines de aprendizaje. Fue contruido utilizando un Mac con procesador M2

## Tech Stack

| Herramienta   | Version       |
| ------------- |:-------------:|
| IntelliJ Idea | Community Edition 2023.2.5 |
| Gradle        | 7.6      |
| Java SDK      | correto-17      |
| junit-bom      | 5.9.1      |
| junit-jupiter      | latest      |
| karate-junit5      | 1.4.1      |
| commons-io      | 2.15.1      |
| cucumber-reporting      | 5.0.0      |

### Pruebas de API: Instalación y Ejecución
> :information_source: Estamos usando Gradle para nuestras dependencias, con el comando test detallado a continuacion las vamos a instalar
Desde la carpeta KarateAPI podemos usar este comando para ejecutar las pruebas de las API especificando nuestro runner (test/java/petStore/PetsRunner)

```
$ ./gradlew test --tests PetsRunner -Dkarate.env=stage 
```
Debemos considerar que dentro del archivo PetsRunner actualmente estamos apuntando unicamente a un feature que es la de pets-crud.feature y esa es la que se va a ejecutar por defecto
Una vez ejecutadas las pruebas, se genera un reporte en el directorio:
- build/reports/tests/test/classes/petStore.PetsRunner.html

Podemos tambien ejecutar pruebas en paralelo con el comando:
```
$ ./gradlew test --tests PetsManagement -Dkarate.env=stage 
```
Una vez ejecutadas las pruebas, se genera un reporte en el directorio:
- build/cucumber-html-reports/

## Estructura del proyecto
```
src/
|-- main/
|   |-- java/
|       |-- com/
|           |-- karate/
|-- test/
|   |-- java/
|       |-- petStore/
|           |-- data/                          # Aqui podemos agregamos archivos de data para las APIs
|               |-- features files             # Aqui podemos detallar los diferentes test suites
|               |-- runners/                   # Aqui podemos configurar runners simples o en paralelo
|       |-- karate-config.js/                  # Este archivo es para configuraciones de ambientes
|       |-- logback-test.xml/                  # Este archivo es para configuracion de los logs de karate
build.gradle                                   # Configuracion de las dependencias que vamos a usar
|-- ...
```


## Enlaces de Ayuda

- [Karate repositorio en Git]([https://serenity-bdd.github.io/docs/screenplay/screenplay_fundamentals#screenplay-and-cucumber](https://github.com/karatelabs/karate))
- [APIs utilizadas]([https://serenity-bdd.github.io/docs/screenplay/screenplay_webdriver](https://petstore.swagger.io/)https://petstore.swagger.io/)
