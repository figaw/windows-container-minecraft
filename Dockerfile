FROM microsoft/nanoserver:1803

COPY minecraft ./minecraft

# These are the values you should overwrite
# BRUTALLY (sort of) ~stolen~ inspired by https://github.com/oracle/docker-images/blob/master/OracleJava/windows-java-8/nanoserver/Dockerfile
ENV JAVA_PKG=server-jre-8u181-windows-x64.tar.gz \
    JAVA_HOME=C:\\jdk1.8.0_181

ADD $JAVA_PKG ./

# since setx can't be run as ContainerUser,
# and I don't want to do it as Administrator
#  because then the environment isn't set.. hardcode it!
# docker run -it --rm microsoft/nanoserver:1803 cmd.exe /C "set"
ENV PATH="C:\Windows\system32;C:\Windows;C:\Users\ContainerUser\AppData\Local\Microsoft\WindowsApps;$JAVA_HOME\bin"

WORKDIR ./minecraft

CMD [ "java -Xmx1024M -Xms1024M -jar -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 server.jar nogui" ]
