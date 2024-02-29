Is docker mandatory for k8s?
How k8s is different from Docker?
Is k8s open-source or commercial?
what problems k8s solve?
what benefits k8s brings?
Are there any k8s alternatives?
What abiut Azure Kubernetes(AKS),AWS(eks) and Google k8s(GKE)?
How the job market is for k8s?
How to learn k8s?
--------------------------

* What are the different workload components you are familiar with?
Give 5 component names may be
Pods 
Deployments
Services
Ingress 
Namespaces
 
* What is the functionality of API Server in master node?
  The API server is a component of the k8s control plane that exposes the K8S API.
  The API server is the front end for the k8s control plane
  It also handles authentication and authorization.

* What is kubelet do on worker nodes?
  An agent that runs on each node in the cluster. It makes sure that containers are running in a pod.
  The Kubelet takes a set of PodSpecs that are provided through various machanisms and ensures that the containers describe in thise Pod Specs are running and healthy.The Kubelet doesn't manage containers which were not created by Kubernetes.

* What is etcd database?
   Consitent and highly-available key value store used   
  as   k8s backing store for all cluster data.
*  Who manages master node in cloud version of k8s?
  Usualy the cloud service provider.
* Can we have multiple mastre nodes?
  Yes we can have multiple master nodes for high availability.With stacked control plane nodes where etcd nodes are colocated with control plane nodes.
* What is the cluster configuration you have worked on?
   Single master node & worker nodes.
* What is the Kubernetes version you are familiar with?
   1.27
* What is pod?
   In k8s a pod is the smallest and most basic unit of deployement.A pod encapsulatesone or more containers storage resources network configurations and other optins required to run a specific set of containers together.
* What is Deployement?
   In K8S a deployement is ian object that provides declarative updated and management for a set of replica pods.When you create a Deployement you specify the desired state of by defining the container images number of replicas and other configuration parameters.
 * What is a replicaSet?
   In Kubernetes, a "ReplicaSet" is an object that ensures a specified number of replica pods are running at any given time.
   It is responsible for maintaining the desired replica conunt and managing the lifecycle of the pods.
 * Differences between POD and DEPLOYMENT?
   A Pod represents a single instance of a running process, while a Deployment manages a set of replica pods and provides features for declarative updates, scaling, and rolling updates.
   Deployments are a higher-level abstraction that simplifies the management and scaling of pods, whereas Pods are the atomic units that encapsulates conatiners and resources needed to run an application.
 *  Can a POD use ReplicaSet?
    No we cannot directly associate a POD with  ReplicaSet.In order to do that we need to use Deployements.  

    What is Replication Controller?
 * The concept of a Replication controller is an older    
   predecessor concept to the Replicase in k8s.
   While the replicaset is recommended for managing ans scaling pods the Replication controller is still supported for backward compatibility purposes.
   Replication Controllers use Equality -based or set based selectors where as Replicaset uses lables based selectors 
   for selecting POD's.

 ## What is a sidear or helper container?
   * In the context of containerization and microservices a sidcar or "helper container" refers to a secondary container that runs alongside the main application container within a pod in kubernetes.
   * The sidecar container provides auxillary functionalities and support to the main conatiner enhancing the overall capabilities of the application.

##  Why are the lables user in a deployements?
  * Lables in a Deployements in Kubernetes are used for various purpose including identification grouping and selecting resources within the deployement.
  * They enable you to organize and control different aspects of your Deployment such as service routing,updates,rollbacks and monitoring based on specific attributes or criteria.

##  What is Manifest file?
 A manifest file refers to a YAML or JSON file that defines the desired state of kubernets resources.

##  What is a service in K8S?
 In k8s a services is an abstraction that provides a consistent way to access and communicate with a set od Pods.It acts as a stable network endpoints for accessing pods enabling inter-pod communication and load balaencing.

##  What is cluster IP service?
 The default Service type which exposes the service on a cluster-internal IP address.It is accessible only within the cluster.

## What is a NodePort service?
 Exposes the service on a specific port on each node in the cluster .The Service is accessible using the cluster nodes IP addresses.

## What is a Loadbalencer service ?
 Provision a cloud providers load balencer to distribute to the Service.External clients can access the services using a publicly accessible IP address.

## How the POD communication happens in k8s?
DNS-Based service Discovery. K8s provides a built in service called CoreDNS.

## Which service is secure in k8s?
ClusterIP in most secure in k8s.
In k8s the most secure service type is typically the cluster IP Service type.

## How is a service mapped to its respective POD's?
Using LABLES
In k8s  a service is mappec to its respective pods through the use of lables and selectors.Lable are key-value paires that are attached to k8s objects including pods and services.

## How to look at which POS's are mapped to a service?
 "kubectl describe service <service name>

## Tell me 4 commands to work with services?
  kubectl get services
  kubectl describe service <service name>
  kubectl edit service <service name>
  kubectl delete service <service name>
  
##  




      

     
