.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: dev-apply dev-destroy prod-apply prod-destroy
LOG=/tmp/terraform-make.log

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-10s\033[0m %s\n", $$1, $$2}'

pull:
	@rm -f $LOG
	@git pull &>>$LOG
dev-validate:
	@echo "+++++++++++++++++++++++ VALIDATIONS +++++++++++++++++++++++++++++++++++"
	@cd ENV/DEV/validate
	@cp ../vars.tf ../terraform.tfvars .
	@terraform init >>$LOG
	@terraform apply -auto-approve
	@echo "+++++++++++++++++++++++-------------+++++++++++++++++++++++++++++++++++"

dev-apply: pull dev-validate ## Terraform create for DEV env
	@cd ENV/DEV
	@terraform init
	@terraform apply -auto-approve

dev-destroy: ## Terraform destroy for DEV env
	@cd ENV/DEV
	@terraform init
	@terraform destroy -auto-approve


#prod-apply: git## App Server Setup, Configures STUDENT APP + PRODUCT APP


#prod-destroy: git## DB Server Setup, Configures MariaDB + MongoDB + RabbitMQ
