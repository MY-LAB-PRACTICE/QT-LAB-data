## Install Dotnet-7 
sudo apt update
sudo apt upgrade dotnet-sdk-7.0

## Clone ,install NopCommerce
sh 'git clone https://github.com/CICDProjects/nopCommerceJuly23.git'
sh 'dotnet restore src/NopCommerce.sln'
sh 'dotnet build -c Release src/NopCommerce.sln'
sh 'dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o publish'
sh 'mkdir publish/bin publish/logs'
sh 'zip -r nopCommerce.zip publish'
sh 'cd publish' 
sh 'dotnet Nop.Web.dll --urls http://0.0.0.0:5000' (to run the dotnet nop)





https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/


  1 FROM ubuntu:22.04
  2 RUN  apt update && apt install openjdk-17-jdk -y
  3 RUN  whereis java
  4 RUN  apt install wget -y
  5 RUN  wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.
     4-bin.tar.gz
  6 RUN  ls
  7 RUN  mkdir /usr/share/maven
  8 RUN  tar -xvzf apache-maven-3.9.4-bin.tar.gz -C /usr/share/maven
  9 RUN export PATH="$PATH:/usr/share/maven/apache-maven-3.9.4/bin" >> /etc/environment


  +++++++++++++++++++++
  getiing error --->GPG error: https://packages.cloud.google.com/apt kubernetes-xenial InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY B53DC80D13EDEF05 
  ## sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6494C6D6997C215E

  https://askubuntu.com/questions/943539/the-following-signatures-couldnt-be-verified-because-the-public-key-is-not-avai