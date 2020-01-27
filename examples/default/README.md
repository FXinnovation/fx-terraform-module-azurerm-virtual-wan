# Default Example

This should only create basic resource

## Usage
```
terraform init
terraform plan
terraform apply
terraform destroy
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client\_id |  | string | n/a | yes |
| client\_secret |  | string | n/a | yes |
| subscription\_id |  | string | n/a | yes |
| tenant\_id |  | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bgp\_address |  |
| virtual\_hub\_ids |  |
| vpn\_gateway\_ids |  |
| wan\_id |  |

<!-- END OF PRE_COMMIT_TERRAFORM DOCS HOOK -->
