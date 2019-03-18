# kops-cluster-templates

A set of templates to create different kubernetes clusters using kops.

This repository contains a list of kops templates based on different configurations available e.g public and private topology. To generate a customized config, open the corresponding `.sh` file and replace the export statements with your desired values and run it. It will generate a customized config file whose name will be the same as the template you chose without `.tmpl`. e.g if you want to generate a template for private topology then replace the values of export variables in `prepare-template-private-topology.sh` and when you run it then a file named `private-toplogy.yaml` will be created