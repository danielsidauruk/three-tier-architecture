# Classic Three-Tier Architecture
Consists of Load Balancer, Managed Instance Group (MIG), and Cloud SQL built using Terraform on Google Cloud Platform (GCP).

![three-tier-architecture](https://github.com/danielsidauruk/three-tier-architecture/assets/64315754/9fc8dde2-09e1-4c73-bf38-622171aa65cf)

Installation
============
**1. Clone the Repository:**
```
git clone https://github.com/danielsidauruk/three-tier-architecture.git
```
**2. Go to terraform Directory:**
```
cd three-tier-architecture && cd terraform
```
**3. Add project_id to local env:**
```
export GOOGLE_CLOUD_PROJECT=`gcloud info --format="value(config.project)"`
```
**4. Run terragrunt command:**
```
terragrunt run-all init
```
```
terragrunt run-all plan
```
```
terragrunt run-all apply
```
**Destroy the Infrastructure:**

```
terragrunt run-all destroy
```
