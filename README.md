## Module order

VPC => ECR => RDS => ALB => ECS

## Run

```sh
tf init -var-file="environments/dev/terraform.tfvars"
tf plan -var-file="environments/dev/terraform.tfvars"
tf apply -var-file="environments/dev/terraform.tfvars"
```

## TODO

### RDS

- alarm

### ALB

- configure SSL/TLS certificate
- alarm

### ECS