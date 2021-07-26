tcb-azure-m8

BootCamp Azure – Module 8

Install Wiki.js with azure app service and azure database for postgreSQL

Requeriments and Instructions Terraform:

- Run commands in a linux host (needs terraform);
- Create azure user principal: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
- Set Azure parameters.tf and tfvar.tf (postgre and app service names must be uniques)
- Due azure limitation, terraform cannot create FREE plan for app service
- terraform init -> terraform validate -> terraform plan -out plan -> terraform apply plan
- Install wiki.js
- access admin dashboard berofe create inital page (other tab): https://YOUR-WIKI.DOMAIN.COM/a

To configure Wiki.js with AAD auth:
- https://docs.requarks.io/auth/azure
- After configure with link above, copy "Callback URL / Redirect URI" generated in Wiki.js Azure ADconfiguration and add in -> azure app registration -> Redirect URI (like step A3).