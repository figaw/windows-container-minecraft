# Best Minecraft Server in the World

Or... at least it's running natively in a Windows Container on Microsofts Nanoserver.

# Requirements

## 1. Server

1. Download the minecraft `server.jar` from [https://minecraft.net/download/server](https://minecraft.net/download/server)
1. Add it to the `minecraft` folder

## 2. Java Runtime Environment (JRE)

1. Copied from [Oracle Java on Docker](https://github.com/oracle/docker-images/tree/master/OracleJava)
    - [Download Server JRE 8](http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html) `.tar.gz` file.
        place it beside the `Dockerfile`

1. Overwrite the values in the `Dockerfile` with your corresponding file, and its contents

## 3. EULA

In `minecraft/eula.txt`, change the value from `eula=false` to `eula=true`, indicating your agreement to Mojangs Minecraft EULA.

# Build with

```shell
docker build -t figaw/mc:latest -t figaw/mc:1.0 .
```

# Run it with

```shell
docker run -d -p 25565:25565 --name minecraft figaw/mc
```

## Connecting

Find the IP to connect to it with

```shell
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' minecraft
```

## Stopping

```shell
docker rm -f minecraft
```

## Logs

```shell
docker logs minecraft
```

Add `-f` to follow, `ctrl + c` to stop following.

# Minecraft Run Command

```shell
java -Xmx1024M -Xms1024M -jar -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 server.jar nogui
```

# Roadmap

- Add a version with a powershell build container
- Add a volume for worlds, i.e. persistent storage
