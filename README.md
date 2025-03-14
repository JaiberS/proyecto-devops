# Proyecto DevOps - Despliegue de Aplicación en Kubernetes con Terraform

## 📌 Descripción
Este proyecto implementa una aplicación escalable utilizando Docker, Kubernetes y Terraform. 

- **Docker**: Contenedoriza la aplicación.
- **Kubernetes**: Gestiona la orquestación de los contenedores.
- **Terraform**: Automatiza la infraestructura como código (IaC).
- **HPA**: Configuración de escalado automático en Kubernetes.

## 📂 Estructura del Repositorio

```
/devops
├── .gitignore  # Archivos ignorados por Git
├── Dockerfile  # Configuración de Docker
├── README.md   # Documentación del proyecto
├── index.js    # Aplicación en Node.js
├── package.json # Dependencias y configuración de Node.js
├── main.tf      # Configuración de Terraform
├── kubernetes/  # Configuración de Kubernetes
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── hpa.yaml
```

## 🚀 Pasos para Clonar y Ejecutar el Proyecto

### **1. Clonar el repositorio**
```bash
git clone https://github.com/JaiberS/proyecto-devops.git
cd proyecto-devops
```

### **2. Construir y ejecutar el contenedor con Docker**
```bash
docker build -t jaibers10/devops .
docker run -d -p 3000:3000 jaibers10/devops
```
Verifica que está corriendo:
```bash
docker ps
```

### **3. Subir la imagen a Docker Hub**
```bash
docker login
docker tag jaibers10/devops jaibers10/devops:latest
docker push jaibers10/devops:latest
```

### **4. Desplegar la aplicación en Kubernetes**
```bash
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
```
Verifica los pods y servicios:
```bash
kubectl get pods
kubectl get services
```
Si usas Minikube:
```bash
minikube service devops-service --url
```

### **5. Implementar Escalabilidad Automática (HPA)**
```bash
kubectl apply -f kubernetes/hpa.yaml
kubectl get hpa
```
Para probar el escalado automático:
```bash
kubectl run -i --tty load-generator --rm --image=busybox -- /bin/sh
while true; do wget -q -O- http://devops-service; done
```

### **6. Desplegar con Terraform**
```bash
terraform init
terraform apply
```
Confirma escribiendo `yes` cuando se solicite.

Verifica el despliegue con:
```bash
kubectl get deployments
kubectl get services
```

