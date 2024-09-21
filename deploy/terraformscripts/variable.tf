variable "instance_type"{
    type= "String"
    default = "t2.medium"
}

variable "allowedPort"{
    type = list 
    default     = [
    6443,  # Kubernetes API server
    2379,  # etcd server client API
    2380,  # etcd server peer API
    10250, # Kubelet API
    10251, # kube-scheduler
    10252, # kube-controller-manager
    30000, # NodePort Services start
    32767,  # NodePort Services end
    80,
    22,
    8080,
    3000, 
    9090
  ]
}