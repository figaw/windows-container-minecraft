# Best Minecraft Server in the World

Or... at least it's running natively in a Windows Container on Microsofts Nanoserver.

# Requirements

## 1. Server

1. Download the minecraft `server.jar` from [https://minecraft.net/download/server](https://minecraft.net/download/server)
1. Add it to the `minecraft` folder

## 2. Java Runtime Environment (JRE)

1. Download a Java Runtime Environment 8, you can find this on Google and put it beside the `Dockerfile`.
    I used the `jre-8u181-windows-x64.tar.gz`, which Docker unpacks when you add it to a container.
1. Overwrite the values in the `Dockerfile` with your corresponding file, and its contents

## 3. EULA

Change the value from `eula=false` to `eula=true`, to indicating your agreement to Mojangs Minecraft EULA.

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

# Minecraft run command

```shell
java -Xmx1024M -Xms1024M -jar -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 server.jar nogui
```

# Roadmap

- Add a version with a powershell build container
- Add a volume for worlds, i.e. persistent storage
