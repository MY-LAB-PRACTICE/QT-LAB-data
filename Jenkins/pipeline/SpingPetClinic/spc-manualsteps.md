sudo apt update &&sudo apt install openjdk-17-jdk -y
wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
sudo mkdir /usr/share/maven
tar -xvzf apache-maven-3.9.4-bin.tar.gz -C /usr/share/maven
sudo tar -xvzf apache-maven-3.9.4-bin.tar.gz -C /usr/share/maven
sudo vi ~/.bashrc   --->export PATH="$PATH:/usr/share/maven/apache-maven-3.9.4/bin"
source ~/.bashrc
mvn --version
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic && mvn package
EXPOSE 8080
java -jar /spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar


sh 'sudo apt update &&sudo apt install openjdk-17-jdk -y'
sh 'wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz'
sh 'sudo mkdir /usr/share/maven'
sh 'sudo tar -xvzf apache-maven-3.9.4-bin.tar.gz -C /usr/share/maven'
sh 'export PATH=$PATH:/usr/share/maven/apache-maven-3.9.4/bin  >> sudo vi ~/.bashrc'
sh 'source ~/.bashrc'
sh 'mvn --version'
sh 'git clone https://github.com/spring-projects/spring-petclinic.git'
sh 'cd spring-petclinic && mvn package'
sh 'EXPOSE 8080'
sh 'java -jar /spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar'

FROM 
sh 'apt update && apt install openjdk-17-jdk -y'
sh 'wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz'
sh 'mkdir /usr/share/maven'
sh 'sudo tar -xvzf apache-maven-3.9.4-bin.tar.gz -C /usr/share/maven'
sh 'export PATH=$PATH:/usr/share/maven/apache-maven-3.9.4/bin  >> sudo vi ~/.bashrc'
sh 'source ~/.bashrc'
sh 'mvn --version'
sh 'git clone https://github.com/spring-projects/spring-petclinic.git'
sh 'cd spring-petclinic && mvn package'
sh 'EXPOSE 8080'
sh 'java -jar /spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar'
-------------------------------------------------------------------------------------------------------
Dockerfile for **********************NOP COMMERCE*********************
---------------------------------------------------------------------------------------

FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="khaja" organization="qt" project="learning"
ARG user=nopcommerce
ARG group=nopcommerce
ARG uid=1000
ARG gid=1000
ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip
ARG HOME_DIR=/nop
RUN apt update && apt install unzip -y
# Create user nopcommerce
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$HOME_DIR" -u ${uid} -g ${gid} -m -s /bin/bash ${user}
USER ${user}
WORKDIR ${HOME_DIR}
ADD --chown=${user}:${group} ${DOWNLOAD_URL} ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip
RUN unzip ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip && \
    mkdir ${HOME_DIR}/bin && mkdir ${HOME_DIR}/logs
EXPOSE 5000
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
CMD [ "dotnet", "Nop.Web.dll"]
-------------------------------------------------------------------------------------------------------
Dockerfile for **********************SPRING-PET-CLINIC*********************
---------------------------------------------------------------------------------------
FROM ubuntu:latest
LABEL author="khaja" organization="QT"
RUN apt update && apt install openjdk-17-jdk -y
RUN apt install wget -y && cd /tmp
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
RUN mkdir /usr/share/maven
RUN tar -xvzf apache-maven-3.9.4-bin.tar.gz -C /usr/share/maven
ENV PATH="$PATH:/usr/share/maven/apache-maven-3.9.4/bin"
RUN mvn --version
RUN apt install git -y
RUN git clone https://github.com/spring-projects/spring-petclinic.git
RUN cd spring-petclinic && mvn package
RUN ls
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar"]





