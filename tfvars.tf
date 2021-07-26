#Azure Location
variable "AZURE_LOCATION" {
    type = string
    default = "eastus"
}

#RG NameAzure Location
variable "RG_NAME" {
    type = string
    default = "Final-Project"
}

#POSTGRES name - MUST BE UNIQUE
variable "PG_NAME" {
    type = string
    default = "MUST BE UNIQUE"
}

#APP_PLAN
variable "APP_PLAN" {
    type = string
    default = "F1"
}

#APP_SERVICE - MUST BE UNIQUE
variable "APP_SERVICE" {
    type = string
    default = "MUST BE UNIQUE"
}

#DB_TYPE
variable "DB_TYPE" {
    type = string
    default = "postgres"
}

#DB_PORT
variable "DB_PORT" {
    type = string
    default = "5432"
}

#DB_NAME
variable "DB_NAME" {
    type = string
    default = "wiki"
}

#DB_USER
variable "DB_USER" {
    type = string
    default = "sql"
}

#DB_PASS
variable "DB_PASS" {
    type = string
    default = "Admin123456!"
}

#DB_SSL
variable "DB_SSL" {
    type = string
    default = "true"
}

#Subscription ID
variable "SUB_ID" {
    type = string
    default = ""
}

#Principal Client ID
variable "CLI_ID" {
    type = string
    default = ""
}

#Principal Client SECRET
variable "CLI_SECRET" {
    type = string
    default = ""
} 

#Tenant ID  
variable "TEN_ID" {
    type = string
    default = ""
} 