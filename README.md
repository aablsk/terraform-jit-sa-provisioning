# Problem definition
- We want to create **authoritative** project IAM bindings with terraform (e.g. as part of Disaster Recovery requirements). 
- This implies **creating the necessary bindings for P4SA/Service Agent account**.
- If we simply **enable APIs**, the P4SA is not necessarily created as they **may be created just in time (JIT)**, when the **services API is called for the first time**.
- If the P4SA does not exist, assigning IAM roles will fail.

# How to reproduce the issue (reproduction branch)
- switch to branch `reproduction` to reproduce
- ensure you are using a new project and DO NOT navigate to Data Transfer UI as this will trigger the creation of the P4SA

# Example case
- Use `bigquerydatatransfer.googleapis.com` as example as the corresponding P4SA `"serviceAccount:service-$PROJECT_NUMBER@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"` is created JIT, when the first API call to Data Transfer API is made.

# Solution
- Use [google_project_service_identity terraform provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service_identity)

# Notes
- Using [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit) for easier handling of enabling apis and assigning project IAM bindings.
