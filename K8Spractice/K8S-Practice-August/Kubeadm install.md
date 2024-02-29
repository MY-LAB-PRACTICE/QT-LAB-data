### kubeadm INSTALL ON UBUNTU:::
  First install docker

   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh ./get-docker.sh
   sudo usermod -aG docker ubuntu
   exit
   * reconnect to mechine
   * docker info
Swith to root user...
### Install GO ::
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
tar -C /usr/local -xvzf go1.21.0.linux-amd64.tar.gz
vi bash_profile   :----> export PATH=$PATH:/usr/local/go/bin
source ./bash_profile
 go version

## Install cri-dockerd

git clone https://github.com/Mirantis/cri-dockerd.git

sudo apt install make -y   :----> Make used to build the packsge for go language

cd cri-dockerd
make cri-dockerd
install -o root -g root -m 0755 cri-dockerd /usr/local/bin/cri-dockerd
install packaging/systemd/* /etc/systemd/system
sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
systemctl daemon-reload
systemctl enable --now cri-docker.socket

## Install Kubeadm,kubectl
1. Update the apt package index and install packages needed to use the Kubernetes apt repository:

## sudo apt-get update

## sudo apt-get install -y apt-transport-https ca-certificates curl
2. Download the public signing key for the Kubernetes package repositories. The same signing key is used for all repositories so you can disregard the version in the URL:

## curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
3.  Add the appropriate Kubernetes apt repository:

# ((This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list))
 ## echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
4. Update the apt package index, install kubelet, kubeadm and kubectl, and pin their version:

## sudo apt-get update
## sudo apt-get install -y kubelet kubeadm kubectl
## sudo apt-mark hold kubelet kubeadm kubectl

*Do the below steps to become mechine as master::(Only in master not in node)

## kubectl init --pod-network-cidr 192.168.0.0/16(for calico) 10.244.0.0/16(for flanel)
* Here i am using calico
 ## kubeadm init --pod-network-cidr 192.168.0.0/16 --cri-socket  unix:///var/run/cri-dockerd.sock
 ![pre](6)
 mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  ## Refer the Document (https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises)
  * kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
* curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml -O
  * kubectl create -f custom-resources.yaml
 *  watch kubectl get pods -n calico-system
  --------------------------
  NAMESPACE     NAME                READY   STATUS                  RESTARTS         AGE
kube-system   calico-node-txngh   1/1     Running                   0              54s


_+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Now join the node to master 
run the following command in node 

kubeadm join 172.31.52.94:6443 --token 7gejy2.5ul2byy1l4hu4qh2 \
        --cri-socket "unix:///var/run/cri-dockerd.sock" \
        --discovery-token-ca-cert-hash sha256:c36b4cb58af822ef7a23235a4ab91cb4d3557ebf365c27aa51c8ee0d868558a2

## sha256:c36b4cb58af822ef7a23235a4ab91cb4d3557ebf365c27aa51c8ee0d868558a2  ---->This is changes every time         
