# 🎮 Tetris DevOps Project – End-to-End CI/CD, Kubernetes, GitOps & Monitoring

This project demonstrates a **production-style DevOps pipeline** by deploying a **Tetris web application** using modern DevOps tools and practices including **Docker, Kubernetes, GitOps, CI/CD pipelines, and monitoring**.

The goal of this project is to simulate how real applications are built, packaged, deployed, and monitored in a cloud environment.

---

# 📌 Project Overview

The Tetris application is containerized and deployed to a Kubernetes cluster running on an AWS EC2 instance. The deployment process is automated using CI/CD pipelines and GitOps practices.

Whenever code changes are pushed to GitHub:

1. CI pipeline runs
2. Docker image is built
3. Image is pushed to Docker Hub
4. Kubernetes manifests are updated
5. ArgoCD automatically deploys the new version
6. Prometheus collects metrics
7. Grafana visualizes system performance

---

# 🏗 Architecture

```
Developer
   │
   │ git push
   ▼
GitHub Repository
   │
   │ CI/CD Pipeline
   ▼
GitHub Actions
   │
   │ Build + Security Scan
   ▼
Docker Image
   │
   │ Push
   ▼
Docker Hub
   │
   ▼
Kubernetes Cluster (AWS EC2)
   │
   ▼
ArgoCD (GitOps Deployment)
   │
   ▼
Tetris Application
   │
   ▼
Prometheus → Metrics
Grafana → Monitoring Dashboard
```

---

# 🚀 Technologies Used

### Cloud

* AWS EC2

### Containerization

* Docker

### Container Orchestration

* Kubernetes

### CI/CD

* GitHub Actions

### GitOps

* ArgoCD

### Monitoring

* Prometheus
* Grafana

### Infrastructure as Code

* Terraform (optional extension)

---

# 📂 Project Structure

```
tetris-devops-project
│
├── app
│   ├── index.html
│   ├── app.js
│   └── style.css
│
├── Dockerfile
│
├── k8s
│   ├── deployment.yaml
│   └── service.yaml
│
├── .github
│   └── workflows
│       └── ci-cd.yml
│
├── monitoring
│   ├── prometheus.yaml
│   └── grafana.yaml
│
└── README.md
```

---

# ⚙️ Step 1 – Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/tetris-devops-project.git
cd tetris-devops-project
```

---

# 🐳 Step 2 – Build Docker Image

```bash
docker build -t tetris-app .
```

Run locally:

```bash
docker run -d -p 8080:80 tetris-app
```

Open in browser:

```
http://localhost:8080
```

---

# 📦 Step 3 – Push Image to Docker Hub

Login:

```bash
docker login
```

Tag image:

```bash
docker tag tetris-app USERNAME/tetris-app:latest
```

Push image:

```bash
docker push USERNAME/tetris-app:latest
```

---

# ☸️ Step 4 – Deploy to Kubernetes

Apply Kubernetes manifests:

```bash
kubectl apply -f k8s/
```

Check pods:

```bash
kubectl get pods
```

Check services:

```bash
kubectl get svc
```

Access the application:

```
http://EC2_PUBLIC_IP:NODEPORT
```

---

# 🔄 Step 5 – GitOps Deployment with ArgoCD

Install ArgoCD:

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Expose ArgoCD UI:

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
```

Get admin password:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret \
-o jsonpath="{.data.password}" | base64 -d
```

Login to the ArgoCD dashboard and connect your GitHub repository.

ArgoCD will automatically sync and deploy your application.

---

# 📊 Step 6 – Monitoring

Install Prometheus:

```bash
helm install prometheus prometheus-community/prometheus
```

Install Grafana:

```bash
helm install grafana grafana/grafana
```

Grafana dashboards will visualize:

* CPU usage
* Memory usage
* Pod metrics
* Cluster performance

---

# 🔐 Security Features

The CI pipeline includes:

* Dockerfile linting
* Vulnerability scanning
* Container image scanning
* Dependency checks

This ensures the application follows **secure DevOps practices**.

---

# 👨‍💻 Author

**Shaoor Khan**


Give it a ⭐ on GitHub!
