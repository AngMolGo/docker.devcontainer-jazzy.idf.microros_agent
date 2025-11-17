# docker.devcontainer-jazzy.idf.microros_agent
Repositorio para almacenar dockerfile y un template de directorio .devcontainer, para desplegar un devcontainer para desarrollar aplicaciones de ROS2, ESP32 mediante IDF y su componente para desarrollar con microros.

#### Requisitos:
- [ ] Visual Studio Code
- [ ] Docker ([Windows](https://docs.docker.com/desktop/setup/install/windows-install/) o [Linux](https://docs.docker.com/engine/))
- [ ] Extensión instalada: [ms-vscode-remote.remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Quick Start Guide

### Compilar imagen

La idea de este repositorio es almacenar el dockerfile de la imagen de un contenedor con todos los frameworks necesarios para desarrollar robótica con ROS2 Jazzy y microros con el microcontrolador ESP32 con el IDF de Espressif.

Este repositorio se puede clonar en la carpeta raíz del proyecto, en el home del usuario o en cualquier lugar donde se quiera conservar.

``` bash
git clone -b jazzy_idf-v5.2 https://github.com/AngMolGo/docker.devcontainer-jazzy.idf.microros_agent.git ~/projects/.docker/jazzy_idf
```

Para compilar el dockerfile:

```bash
cd ~/projects/.docker/jazzy_idf
docker build -f Dockerfile.devc_jazzy_idf_uros_agent -t devc_general:jazzy_idf_uros_agent .
```

### Ejecución de DevContainer

Dentro del repositorio se encuentra una plantilla para un directorio ```.devcontainer``` con la configuración necesaria para inicializar un devcontainer, mediante el uso de un archivo ```devcontainer``` y un archivo ```compose.yaml```. Este directorio se debe de copiar en la raíz del workspace del proyecto y configurarse para poder ser utilizado con el proyecto a utilizar:

``` bash
cp ./.devcontainer_template <workspace-path>/.devcontainer
cd <workspace-path>
code .devcontainer # Configurar archivos devcontainer.json y compose.yaml
```

Al termino de la configuración, para inicializar el devcontainer se abre el directorio de trabajo del proyecto:

``` bash
code <workspace-path>
```

Al momento de abrir el espacio de trabajo del proyecto, Visual Studio Code preguntará si se quiere reabrir el proyecto dentro del contenedor.

> [!IMPORTANT]
> Es muy importante realizar una correcta configuración de los archivos ```devcontainer.json``` y ```compose.yaml```, ya que estos determinarán el comportamiento, configuración y el comportamiento que tendrá el contenedor.