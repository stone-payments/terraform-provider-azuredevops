// Variaveis relacionados a organização existente
variable "org_url" {
    description = "URL of organization"
    type        = string 
}

variable "org_token" {
    description = "TOKEN of organization"
    type        = string 
}

// Variaveis relacionado ao projeto ao ser criado
variable "project_name" {
    description = "The name that the project will be called"
    type        = string
}

variable "description" {
    description = "Description of project"
    type        = string 
}

variable "visibility" {
    description = "Specify privacy of project (private or public)"
    type        = string
    default     = "private" 
}

variable "version_control" {
    description = "Set system control of project"
    type        = string
    default     = "Git"  
}

variable "work_item_template" {
    description = "Set work item of project"
    type        = string
    default     = "Agile"
}

// Variaveis relacionados as features do novo projeto
variable "boards" {
    description = "Feature boards of Azure"
    type        = string
    default     = "enabled"
}

variable "repositories" {
    description = "Feature repositories of Azure"
    type        = string
    default     = "disabled"
}

variable "pipelines" {
    description = "Feature pipelines of Azure"
    type        = string
    default     = "enabled"
}

variable "testplans" {
    description = "Feature testplans of Azure"
    type        = string
    default     = "enabled"
}

variable "artifacts" {
    description = "Feature artifacts of Azure"
    type        = string
    default     = "enabled"
}

// Variaveis referente aos endpoints
variable "github_token" {
  description = "Github Personal Token"
  type        = string
}

// Variaveis a srem utilizadas na var group
variable "NssmPath" {
  type    = string
  default = "C:\\ProgramData\\chocolatey\\lib\\nssm\\tools\\nssm-2.24\\win64\\nssm.exe"
}

variable "DefaultInstallationDir" {
  type    = string
  default = "C:\\buy4\\applications"
}

variable "ChocolateySource" {
  type    = string
  default = "https://artifacts-vip.stone.com.br:8443/artifactory/api/nuget/chocolatey-prod"
}

variable "ZabbixEndpoint_atlanta" {
  type    = string
  default = "zabbix-proxy.dc1.buy4.io"
}

variable "F5LTMName_atlanta" {
  type    = string
  default = "10.99.1.50"
}

variable "F5UserName_atlanta" {
  type = string
}

variable "F5Password_atlanta" {
  type = string
}

variable "TaskGroupAutoCreated_atlanta" {
  type    = string
  default = true
}

variable "ZabbixEndpoint_chicago" {
  type    = string
  default = "chi1-proxyvm-zabbix.buy4.io"
}

variable "F5LTMName_chicago" {
  type    = string
  default = "10.100.1.50"
}

variable "F5UserName_chicago" {
  type = string
}

variable "F5Password_chicago" {
  type = string
}

variable "TaskGroupAutoCreated_chicago" {
  type    = string
  default = true
}

variable "ZabbixEndpoint_central" {
  type    = string
  default = "zabbixsc.buy4sc.local"
}

variable "F5LTMName_central" {
  type    = string
  default = "172.17.35.40"
}

variable "F5UserName_central" {
  type = string
}

variable "F5Password_central" {
  type = string
}

variable "ZabbixEndpoint_tierpoint_nonproduction" {
  type    = string
  default = "zabbixtp.buy4sc.local"
}

variable "F5LTMName_tierpoint_nonproduction" {
  type    = string
  default = "52.179.210.36"
}

variable "F5UserName_tierpoint_nonproduction" {
  type = string
}

variable "F5Password_tierpoint_nonproduction" {
  type = string
}

variable "ZabbixEndpoint_tierpoint_production" {
  type    = string
  default = "zabbixtp.buy4sc.local"
}

variable "F5LTMName_tierpoint_production" {
  type    = string
  default = "bigip-tierpoint.buy4.io"
}

variable "F5UserName_tierpoint_production" {
  type = string
}

variable "F5Password_tierpoint_production" {
  type = string
}
