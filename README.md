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

- [] alarms

### ALB

- [] configure SSL/TLS certificate, 443
- [] alarms

### ECS

- [] alarms