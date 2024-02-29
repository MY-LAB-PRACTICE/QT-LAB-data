## Nexus Installations:
* First we need to take t2.large machine
* Do the following steps(document):
* sudo apt-get update
* sudo  apt install openjdk-8-jre-headless -y
* wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.29.2-02-unix.tar.gz
* sudo mv nexus-3.29.2-02-unix.tar.gz /opt
* cd /opt
* sudo  tar -zxvf nexus-3.29.2-02-unix.tar.gz
* sudo  mv /opt/nexus-3.29.2-02 /opt/nexus
* sudo adduser nexus
* sudo visudo
* sudo chown -R nexus:nexus /opt/nexus
* sudo chown -R nexus:nexus /opt/sonatype-work
*  sudo vim /opt/nexus/bin/nexus.rc   ---->run_as_user="nexus" (file shold have only this line)
*  sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
*  su - nexus
*  /etc/init.d/nexus start

## If mchine reconnect the we need to restart and status

## In pipeline for Nexus following step formate to be add: 
*  nexusArtifactUploader artifacts: [[artifactId: 'spring-petclinic', classifier: '', file: '/home/ubuntu/workspace/spc-nexus/target/spring-petclinic-3.1.0-SNAPSHOT.jar', type: 'jar']], credentialsId: 'nexus', groupId: 'org.springframework.samples', nexusUrl: '100.26.252.177:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '3.1.0-SNAPSHOT'

 
* 
