
# Make sure to set the following environment variables:
#   AZDO_PERSONAL_ACCESS_TOKEN
#   AZDO_ORG_SERVICE_URL
#   AZDO_GITHUB_SERVICE_CONNECTION_PAT
terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "=0.0.998"
    }
  }
}

# resource "azuredevops_project" "terraform_add_project" {
#   name               = var.project_name
#   description        = var.description
#   visibility         = var.visibility
#   version_control    = var.version_control
#   work_item_template = var.work_item_template
#   features = {
#       "boards"       = var.boards
#       "repositories" = var.repositories
#       "pipelines"    = var.pipelines
#       "testplans"    = var.testplans
#       "artifacts"    = var.artifacts
#   }
# }

// Adicionando grupos padrão da azure
data "azuredevops_group" "tf_padrao_projectadm" {
  project_id = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  name       = "Project Administrators"
}

// Adicionando grupos padrão da Stone
resource "azuredevops_group" "developers" {
  scope = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  display_name = "Developers"
  description  = "Members of this group can add modify and delete code builds and workitems and view releases within the team project."
}

resource "azuredevops_group" "infrastructureengineers" {
  scope        = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  display_name = "Infrastructure Engineers"
  description  = "Members of this group can add modify and delete code builds workitems and releases within the team project."
}

resource "azuredevops_group" "techleads" {
  scope        = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  display_name = "Tech Leads"
  description  = "Members of this group can add modify and delete code builds and workitems and view trigger releases within the team project."
}

resource "azuredevops_group" "databaseadmins" {
  scope        = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  display_name = "Database Admins"
  description  = "Members of this group can add modify and delete code builds workitems and releases within the team project."
}

resource "azuredevops_group" "externaldevelopers" {
  scope        = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  display_name = "External Developers"
  description  = "Members of this group can add modify and delete code builds and workitems and view releases within the team project."
}

resource "azuredevops_group" "productmanagers" {
  scope        = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  display_name = "Product Managers"
  description  = "Members of this group can add modify and delete workitems and view code builds and releases within the team project."
}

resource "azuredevops_group_membership" "membership" {
  group = data.azuredevops_group.tf_padrao_projectadm.descriptor
  members = [
    azuredevops_group.developers.descriptor,
    azuredevops_group.infrastructureengineers.descriptor,
    azuredevops_group.techleads.descriptor,
    azuredevops_group.databaseadmins.descriptor,
    azuredevops_group.externaldevelopers.descriptor,
    azuredevops_group.productmanagers.descriptor
  ]
}


// Configurando permissões dos grupos padrões Stone
resource "azuredevops_project_permissions" "perm-developers" {
  project_id = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal  = azuredevops_group.developers.id
  permissions = {
    WORK_ITEM_PERMANENTLY_DELETE = "Deny"
  }
}

resource "azuredevops_project_permissions" "perm-techleads" {
  project_id = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal  = azuredevops_group.techleads.id
  permissions = {
    WORK_ITEM_PERMANENTLY_DELETE = "Deny"
  }
}

# resource "azuredevops_project_permissions" "perm-infrastructureengs" {
#   project_id = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
#   principal  =azuredevops_group.infrastructureengineers.id
#   permissions = {

#   }
# }

resource "azuredevops_project_permissions" "perm-databaseadmins" {
  project_id = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal  =azuredevops_group.databaseadmins.id
  permissions = {
    WORK_ITEM_PERMANENTLY_DELETE = "Deny"
  }
}

resource "azuredevops_project_permissions" "perm-extdevelopers" {
  project_id = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal  =azuredevops_group.externaldevelopers.id
  permissions = {
    WORK_ITEM_PERMANENTLY_DELETE = "Deny"
  }
}

resource "azuredevops_project_permissions" "perm-productmanagers" {
  project_id = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal  =azuredevops_group.productmanagers.id
  permissions = {
    WORK_ITEM_PERMANENTLY_DELETE = "Deny"
    START_BUILD                  = "Deny"
    ADMINISTER_BUILD             = "Deny"
    EDIT_BUILD_STATUS            = "Deny"
    UPDATE_BUILD                 = "Deny"
  }
}

resource "azuredevops_project_releases_permissions" "perm_releases_developers" {
  project_id  = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal   = azuredevops_group.developers.id
  permissions = {
    ViewReleaseDefinition        = "allow"
    EditReleaseDefinition        = "deny"
    DeleteReleaseDefinition      = "deny"
    ManageReleaseApprovers       = "deny"
    ManageReleases               = "deny"
    ViewReleases                 = "allow"
    CreateReleases               = "deny"
    EditReleaseEnvironment       = "deny"
    DeleteReleaseEnvironment     = "deny"
    AdministerReleasePermissions = "deny"
    DeleteReleases               = "deny"
    ManageDeployments            = "deny"
    ManageReleaseSettings        = "deny"
    ManageTaskHubExtension       = "deny"
  }
}

resource "azuredevops_project_releases_permissions" "perm_releases_techleads" {
  project_id  = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal   = azuredevops_group.techleads.id
  permissions = {
    ViewReleaseDefinition        = "allow"
    EditReleaseDefinition        = "deny"
    DeleteReleaseDefinition      = "deny"
    ManageReleaseApprovers       = "deny"
    ManageReleases               = "deny"
    ViewReleases                 = "allow"
    CreateReleases               = "deny"
    EditReleaseEnvironment       = "deny"
    DeleteReleaseEnvironment     = "deny"
    AdministerReleasePermissions = "deny"
    DeleteReleases               = "deny"
    ManageDeployments            = "deny"
    ManageReleaseSettings        = "deny"
    ManageTaskHubExtension       = "deny"
  }
}

resource "azuredevops_project_releases_permissions" "perm_releases_infrastructureengs" {
  project_id  = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal   = azuredevops_group.infrastructureengineers.id
  permissions = {
    ViewReleaseDefinition        = "allow"
    EditReleaseDefinition        = "allow"
    DeleteReleaseDefinition      = "allow"
    ManageReleaseApprovers       = "allow"
    ManageReleases               = "allow"
    ViewReleases                 = "allow"
    CreateReleases               = "allow"
    EditReleaseEnvironment       = "allow"
    DeleteReleaseEnvironment     = "allow"
    AdministerReleasePermissions = "allow"
    DeleteReleases               = "allow"
    ManageDeployments            = "allow"
    ManageReleaseSettings        = "allow"
    ManageTaskHubExtension       = "allow"
  }
}

resource "azuredevops_project_releases_permissions" "perm_releases_databaseadmins" {
  project_id  = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal   = azuredevops_group.databaseadmins.id
  permissions = {
    ViewReleaseDefinition        = "allow"
    EditReleaseDefinition        = "allow"
    DeleteReleaseDefinition      = "allow"
    ManageReleaseApprovers       = "allow"
    ManageReleases               = "allow"
    ViewReleases                 = "allow"
    CreateReleases               = "allow"
    EditReleaseEnvironment       = "allow"
    DeleteReleaseEnvironment     = "allow"
    AdministerReleasePermissions = "allow"
    DeleteReleases               = "allow"
    ManageDeployments            = "allow"
    ManageReleaseSettings        = "allow"
    ManageTaskHubExtension       = "allow"
  }
}

resource "azuredevops_project_releases_permissions" "perm_releases_extdevelopers" {
  project_id  = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal   = azuredevops_group.externaldevelopers.id
  permissions = {
    ViewReleaseDefinition        = "allow"
    EditReleaseDefinition        = "deny"
    DeleteReleaseDefinition      = "deny"
    ManageReleaseApprovers       = "deny"
    ManageReleases               = "deny"
    ViewReleases                 = "allow"
    CreateReleases               = "deny"
    EditReleaseEnvironment       = "deny"
    DeleteReleaseEnvironment     = "deny"
    AdministerReleasePermissions = "deny"
    DeleteReleases               = "deny"
    ManageDeployments            = "deny"
    ManageReleaseSettings        = "deny"
    ManageTaskHubExtension       = "deny"
  }
}

resource "azuredevops_project_releases_permissions" "perm_releases_productmanagers" {
  project_id  = "668a3fc6-9b45-431e-8a1c-41cdbd79f745"
  principal   = azuredevops_group.productmanagers.id
  permissions = {
    ViewReleaseDefinition        = "allow"
    EditReleaseDefinition        = "deny"
    DeleteReleaseDefinition      = "deny"
    ManageReleaseApprovers       = "deny"
    ManageReleases               = "deny"
    ViewReleases                 = "allow"
    CreateReleases               = "deny"
    EditReleaseEnvironment       = "deny"
    DeleteReleaseEnvironment     = "deny"
    AdministerReleasePermissions = "deny"
    DeleteReleases               = "deny"
    ManageDeployments            = "deny"
    ManageReleaseSettings        = "deny"
    ManageTaskHubExtension       = "deny"
  }
}
