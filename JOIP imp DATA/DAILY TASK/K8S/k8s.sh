K8S installation steps
------------------------
install docker 
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ubuntu
exit
------------------------------------
Switch to sudo user
sudo -i
# Run these commands as root
###Install GO###
wget https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x ./installer_linux
./installer_linux
source ~/.bash_profile

git clone https://github.com/Mirantis/cri-dockerd.git
cd cri-dockerd
mkdir bin
go build -o bin/cri-dockerd
mkdir -p /usr/local/bin
install -o root -g root -m 0755 bin/cri-dockerd /usr/local/bin/cri-dockerd
cp -a packaging/systemd/* /etc/systemd/system
sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
systemctl daemon-reload
systemctl enable cri-docker.service
systemctl enable --now cri-docker.socket
---------------------------------------------
Installing kubadm, kubectl, kubelet

#Update the apt package index and install packages needed to use the Kubernetes apt repository:

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
#Download the Google Cloud public signing key:

sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

#Add the Kubernetes apt repository:

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

#Update apt package index, install kubelet, kubeadm and kubectl, and pin their version:

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


-----------------------------------------------------------

# To join the nodes to master  


kubeadm join 172.31.19.170:6443 --token detmjt.jxzuxn0q1ono49rt \
--cri-socket "unix:///var/run/cri-dockerd.sock" \
        --discovery-token-ca-cert-hash sha256:5edd26e17cec806d7474250d59dffa596cbbe043724430bb4512c709dd07b601
--------------------------------------------------------

#AKS INSTALLATIONS
 
### Azure cli installations on windows
choco install azure-li 
... after this installed with AZURE cli .next install resourses & cluster 

###  Azure CLI installations in Linux
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
--------------------------------------------
  sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
----------------------------------------------
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
    sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
    -------------------------------------
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
-----------------------------------------------------
    sudo apt-get update
sudo apt-get install azure-cli
------------------------------------------------------------------------------------
####Now we installed with AZURE cli .next install resourses & cluster 

 Execute az login
##Creating the Resource group 
https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli

 az group create --name myResourceGroup --location eastus
  az aks create -g myResourceGroup -n myAKSCluster --enable-managed-identity --node-count 1 --enable-addons monitoring --enable-msi-auth-for-monitoring  --generate-ssh-keys
 Next give credentials
 az aks get-credentials --resource-group myResourceGroup --name myAKSCluster

 ##To install AKS 
 
 sudo -i
 az aks install-cli
 exit
 az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
 kubectl get nodes

##How to delete cluster

$ az aks delete --resource-group MyResourceGroup --yes --no-wait


------------------------------------------------------------------------
1.	Create a MySQL pod with Stateful Set with 1 replica

apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql-st
  labels:
    env: uat
spec:
  minReadySeconds: 10
  replicas: 2
  selector:
    matchLabels:
      env: uat
  template:
    metadata:
      name: mysql-st
      labels:
        env: uat
    spec:
      containers:
        - name: mysql
          image: mysql:8.0
          volumeMounts:
            - mountPath: /var/lib/mysql
              name: nop-sql
          ports:
            - name: mysql-st
              containerPort: 3306
              protocol: TCP
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: rootroot
            - name: MYSQL_USER
              value: Su
            - name: MYSQL_PASSWORD
              value: rootroot
            - name: MYSQL_DATABASE
              value: Persons
            # - MYSQL_ROOT_PASSWORD: rootroot
            #   MYSQL_DATABASE: Persons
            #   MYSQL_USER: Su
            #   MYSQL_PASSWORD: rootroot
  volumeClaimTemplates:
    - metadata:
        name: htmlhome
      spec:
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 1Gi
        storageClassName: managed
---
apiVersion: v1
kind: Service
metadata:
  name: mysqlsvc
  labels:
    env: uat
spec:
  clusterIP: None
  type: ClusterIP
  ports:
    - name: mysqlsvc
      port: 8081
      protocol: TCP
      targetPort: 3306
  selector:
    env: uat

-----------------------------------------------------------------------------
2.	Create a nopCommerce deployment with 1 replica
apiVersion: apps/v1
kind: Deployment
metadata:
  name: newjenkinsdeploy
  labels:
    env: testing
spec:
  minReadySeconds: 2
  replicas: 2
  selector:
    matchLabels:
      env: testing
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      name: newjenkinsdeploy
      labels:
        env: testing
    spec:
      containers:
        - name: newjenkinsdeploy
          image: sridhar231/jenkins:1.0
          ports:
            - name: tcpport
              protocol: TCP
              containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: jenkins-svc
  labels:
    env: testing
spec:
  selector:
    env: testing
  ports:
    - name: jenkins-svc
      port: 8081
      protocol: TCP
      targetPort: 8080
  type: LoadBalancer
---------------------------------------------
 


3.	Create a Headless Service to interact with nopCommerce with MySQL 

---
apiVersion: v1
kind: Service
metadata:
  name: nopCommerce-svc
spec:
  selector:
    app: nopCommerce
  type: ClusterIP
  clusterIP: None
  ports:
    - name: nopCommerce-svc
      port: 5000
      targetPort: 5000
      protocol: TCP

 ---
apiVersion: v1
kind: Pod
metadata:
  name: mysql
spec:
  containers:
        - name: mysql
          image: mysql:8.0
          ports:
            - name: mysql-st
              containerPort: 3306
              protocol: TCP
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: rootroot
            - name: MYSQL_USER
              value: Su
            - name: MYSQL_PASSWORD
              value: rootroot
            - name: MYSQL_DATABASE
              value: Persons
           
 
    
      
4.	Create a Load Balancer to expose the nopCommerce to External World 
---
apiVersion: v1
kind: Service
metadata:
  name: nop-svc
  labels:
    env: testing
spec:
  selector:
    env: testing
  ports:
    - name: nop-svc
      port: 5000
      targetPort: 5000
  type: LoadBalancer

---
apiVersion: v1
kind: Pod
metadata:
  name: nopcommerce
spec:
  containers:
    - name: nopcommerce
      image: nopcommerce:latest
      ports:
        containerPort: 5000
        
   
  
      







