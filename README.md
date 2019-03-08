# kops-cluster-templates

A set of templates to create different kubernetes clusters using kops.

This repository contains a list of kops templates based on different configurations available e.g public and private topology. To generate a customized config, open the `prepareTemplate.sh` file and replace the export statements with your desired values and run it. It will generate a customized config file whose name will be the same as the one you specify in `prepareTemplate.sh` without `.tmpl`.