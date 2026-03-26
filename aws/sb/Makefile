.PHONY: help init fmt validate plan apply destroy

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  init      terraform init"
	@echo "  fmt       terraform fmt -recursive"
	@echo "  validate  fmt + terraform validate"
	@echo "  plan      validate + terraform plan"
	@echo "  apply     validate + terraform apply"
	@echo "  destroy   terraform destroy"

init:
	terraform init

fmt:
	terraform fmt -recursive

validate: fmt
	terraform validate

plan: validate
	terraform plan

apply: validate
	terraform apply

destroy:
	terraform destroy
