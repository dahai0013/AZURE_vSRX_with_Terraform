# AZURE_vSRX_with_Terraform

This project has been created to simplify the creation/instantiation of the JUNIPER vSRX NG-Firewall on AZURE.
https://www.juniper.net/uk/en/products-services/security/srx-series/vsrx/

This project use Terraform to create the vRSX ( https://www.terraform.io/ )

## Getting Started

  * 1- Create an Account on Azure ( https://portal.azure.com/)
  * 2- Create an account on Azure with permission ( for the Terraform script )
  3- upload this repo to your laptop
  4- create a file: var_value.tfvars ( .tfvars extension is important )
  5- download terraform ( on window it will be an .exe file )
  6- in the local repro directory, run the command:  terraform --

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

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
