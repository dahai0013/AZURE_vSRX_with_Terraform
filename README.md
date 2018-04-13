# AZURE_vSRX_with_Terraform

This project has been created to simplify the creation/instantiation of the JUNIPER vSRX NG-Firewall on AZURE.
https://www.juniper.net/uk/en/products-services/security/srx-series/vsrx/

This project use Terraform to create the vRSX ( https://www.terraform.io/ )

## Getting Started

  1. Create an Account on Azure ( https://portal.azure.com/)
  2. Create an account on Azure with permission ( for the Terraform script )
  3. upload this repo to your laptop
  4. create a file: var_value.tfvars ( .tfvars extension is important )
  5. download terraform ( on window it will be an .exe file )
  6. in the local repro directory, run the command:  terraform --

### Prerequisites

  Create the file:  var_value.tfvars

```
azure_subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
azure_client_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
client_secret   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
tenant_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
vm_username = "myusername"
vm_password = "myagoodpassword"
```

### Installing

You can do it ;-)

## Running the tests

on Windows:

```
cd xxxxxx

.\terraform.exe init

.\terraform.exe plan  -var-file="var_value.tfvars"

.\terraform.exe apply  -var-file="var_value.tfvars"

.\terraform.exe destroy -var-file="var_value.tfvars"

```

On linux:

```
cd xxxxxx

terraform init

terraform plan  -var-file="var_value.tfvars"

terraform apply  -var-file="var_value.tfvars"

terraform destroy -var-file="var_value.tfvars"

```


## Contributing

Everyone is welcome ;-)


## Versioning

Beta version

## Authors

* Me, Myself and I ( https://www.youtube.com/watch?v=CGk962QLIzk )


## License

Free Code Forever and Wakanda.

## Acknowledgments

* Terraform Team
* Youtuber, Blogger and contributor of all type
* and You
