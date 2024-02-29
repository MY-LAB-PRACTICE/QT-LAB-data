## CICD
* Continuous integration is a process where we integrate a set of tools or integrate a set of processes that we follow before to delivery or deploying the application to the customer.
* Continuous delivery is the process where we deploy the application on a specific platform of the customer.

## SSL(secure socket layers) Certificate
Ref::: https://www.mageplaza.com/blog/ssl-certificate.html?gclid=CjwKCAjwrranBhAEEiwAzbhNtV38zop0UM2s0PDEqZQIFrsliCB7M45waGAJddBAzY-xTsNBNvmIxRoCLBUQAvD_BwE
## In technology terms, an SSL certificate is a protocol for servers and web browsers, ensuring that data passed between the two are private. It’s done using an encrypted link that connects the server and browser.






## JENKINS ***
*To make Jenkins highly available use NFS in aws 

## Search for---> aws mount efs on fqdn---> to mount the jenkins on efs
** file-system-id.efs.aws-region.amazonaws.com
* nslookup
* ![pre](Jenkins-images/3-nslookup.png)
* nano etc/fstab---> if we add in fstab then only it saves permanently mounted after restart
* ## for IP address based sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport mount-target-IP:/   /efs 
* ### find . -name jenkins.log---> To check what is happening in background while jenkins runnig
* ## cat /var/logs/jenkins/jenkins.log  ---> to check the logs
* docker ps -a ----> To check the background process of docker
* ![pre](Jenkins-images/5-Background%20process.png)
* ## Blue Ocean to check the multi branch pieline
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## JENKINS PIPELINE::
* Jenkins integration with docker,sonar cube,nexus
*  # For nexus
*  ![pre](Jenkins-images/10-nexus-1.png)
*  ![pre](Jenkins-images/11-nexus-2.png)
*  ![pre](Jenkins-images/12-nexus.png)
*  For reference use following formate
*  ##                nexusArtifactUploader artifacts: [[artifactId: 'spring-petclinic', classifier: '', file: '/home/ubuntu/workspace/spc-nexus/target/spring-petclinic-3.1.0-SNAPSHOT.jar', type: 'jar']], credentialsId: 'nexus', groupId: 'org.springframework.samples', nexusUrl: '100.24.206.104:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '3.1.0-SNAPSHOT'
----------------------------------------
## For Docker::
For docker intaegrated with jenkins create secret in the follwing formate

![pre](Jenkins-images/15-docker%20hub%20credentials%20in%20jenkins.png)
--------------------------------------

For sonar intaegrated with jenkins create secret in the follwing formate
![pre](Jenkins-images/13-sonar%20cube%20installation-1.png)
![pre](Jenkins-images/14-sonar-2.png)
* For reference use following formate

            sh 'mvn clean package sonar:sonar -Dsonar.organization=sridhardevops    -Dsonar.token=94fa8a4b44707c54a1aae9c4894e0cd8bf0d18d6 -Dsonar.host.url=https://sonarcloud.io -Dsonar.projectKey=sridhardevops006'

------------------------------------------------------------
* 