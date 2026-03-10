# docker.devcontainer-jazzy.idf.microros_agent

La idea de este repositorio es almacenar el dockerfile de la imagen de un contenedor con todos los frameworks necesarios para desarrollar robótica con ROS2 Jazzy y microros con el microcontrolador ESP32 con el IDF de Espressif.

#### Requisitos:
- [ ] Visual Studio Code
- [ ] Docker ([Windows](https://docs.docker.com/desktop/setup/install/windows-install/) o [Linux](https://docs.docker.com/engine/))
- [ ] Extensión instalada: [ms-vscode-remote.remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Quick Start Guide

### Compilar imagen

Este repositorio se puede clonar en la carpeta raíz del proyecto, en el home del usuario o en cualquier lugar donde se quiera conservar.

``` bash
export DOCKER_IMAGE_INSTALLING_PATH="$HOME/Projects/.docker/jazzy_idf"
git clone -b jazzy_idf-v5.2 https://github.com/AngMolGo/docker.devcontainer-jazzy.idf.microros_agent.git $DOCKER_IMAGE_INSTALLING_PATH
```

Para compilar el dockerfile:

```bash
docker build -f $DOCKER_IMAGE_INSTALLING_PATH/Dockerfile.devc_jazzy_idf_uros_agent -t devc_general:jazzy_idf_uros_agent .
```

### Ejecución de DevContainer

Dentro del repositorio se encuentra una plantilla para un directorio ```.devcontainer``` con la configuración necesaria para inicializar un devcontainer, mediante el uso de un archivo ```devcontainer``` y un archivo ```compose.yaml```. Este directorio se debe de copiar en la raíz del workspace del proyecto y configurarse para poder ser utilizado con el proyecto a utilizar:

``` bash
cp $DOCKER_IMAGE_INSTALLING_PATH/.devcontainer_template <workspace-path>/.devcontainer
cd <workspace-path>
code .devcontainer # Configurar archivos devcontainer.json y compose.yaml
```

Al termino de la configuración, para inicializar el devcontainer se abre el directorio de trabajo del proyecto:

``` bash
code <workspace-path>
```

Al momento de abrir el espacio de trabajo del proyecto, Visual Studio Code preguntará si se quiere reabrir el proyecto dentro del contenedor,o bien, presionando la tecla ```F1``` dentro de VSCode o ```ctrl+shift+P``` o en el menú desplegable  ```View > Command Palette...```

> [!IMPORTANT]
> Es muy importante realizar una correcta configuración de los archivos ```devcontainer.json``` y ```compose.yaml```, ya que estos determinarán el funcionamiento, configuración y comportamiento que tendrá el contenedor.

## Configuración ```postCreateCommand``` de paquetes y workspaces

En la imagen fueron copiados scripts de instalación de diferentes paquetes de ROS2 e IDF, estos srcipts fueron copiados en el directorio ```/root/setup_scripts``` del contenedor. 

Se recomienda usar el comando ```postCreateCommand``` en el archivo ```devcontainer.json``` para instalar los paquetes necesarios para el desarrollo de la aplicación en el momento de la creación del devcontainer.

``` json
"postCreateCommand": "./setup_scripts/<install_requirement_script>",
```