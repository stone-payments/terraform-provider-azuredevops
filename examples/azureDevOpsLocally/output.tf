// Output do projeto criado
output "project_id" {
    description = "Return id of new project"
    value       = azuredevops_project.terraform_add_project.id
}

output "project_template_id" {
    description = "Return process template id of new project"
    value       = azuredevops_project.terraform_add_project.process_template_id
}

// Output dos services endpoints
output "service_ep_github_name" {
    description = "Return name service endpoint of Github"
    value       = azuredevops_serviceendpoint_github.service_endpoint_github.service_endpoint_name
}

output "service_ep_github_id" {
    description = "Return id service endpoint of Github"
    value       = azuredevops_serviceendpoint_github.service_endpoint_github.id
}

// Output dos grupos de variaveis
output "vargroup_id" {
    description = "Return id of default variables group"
    value       = azuredevops_variable_group.var_group.id
} 
