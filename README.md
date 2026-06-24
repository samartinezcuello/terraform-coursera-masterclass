# 🚀 Terraform Masterclass: From Beginner to Advanced

Este repositorio contiene los laboratorios prácticos y proyectos desarrollados durante mi especialización en **Terraform (Infrastructure as Code)** orientada a **Amazon Web Services (AWS)**. 

El repositorio está dividido en dos grandes bloques: **Ejercicios conceptuales** numerados por orden de aprendizaje y **Proyectos prácticos** de arquitectura en la nube.

## 🛠️ Tecnologías
* **IaC:** Terraform (HCL)
* **Cloud Provider:** AWS (EC2, S3, IAM, CloudWatch, RDS, etc.)
* **Automation:** Terraform Cloud / GitOps

---

## 📂 Estructura del Repositorio

### 📝 Exercises (`/exercises`)
Una bitácora de aprendizaje paso a paso que cubre desde los fundamentos hasta patrones avanzados de automatización:

* **Fundamentos:** `01-benefits-iac`, `02-HCL`, `03-first-tf-project`
* **Core Mechanics:** `04-backends` (Gestión del State remotos), `05-providers`, `06-resources`, `07-data-sources`
* **Lógica Dinámica y Datos:** `08-input-vars-locals-outputs`, `09-expressions`, `10-functions`, `11-multiple-resources` (`count` / `for_each`), `15-object-validation`
* **Modularización:** `12-public-modules` (Uso de módulos del Registry), `13-local-modules`, `14-use-own-module` (Diseño de módulos propios)
* **Ciclo de Vida y Enterprise:** `16-state-manipulation`, `17-workspaces`, `18-terraform-cloud`

### 🏗️ Projects (`/projects`)
Casos de uso reales e infraestructuras integradas:
* `proj01-s3-static-website`: Despliegue automatizado y seguro de un sitio web estático utilizando Amazon S3, configurando políticas de acceso y manejo de entornos.

---

## 🔒 Buenas Prácticas Aplicadas
* **Seguridad:** Uso estricto de `.gitignore` para evitar la filtración de credenciales de AWS o archivos de estado local (`.tfstate`).
* **Código DRY (Don't Repeat Yourself):** Uso intensivo de variables y módulos para garantizar la reusabilidad del código.
