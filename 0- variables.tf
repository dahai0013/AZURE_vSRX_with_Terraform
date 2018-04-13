provider "azurerm" {
    subscription_id = "${var.azure_subscription_id}"
    client_id       = "${var.azure_client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
}

variable azure_subscription_id {
    type = "string"
}

variable azure_client_id {
    type = "string"
}

variable client_secret {
    type = "string"
}

variable tenant_id {
    type = "string"
}

variable vm_username {
    type = "string"
}

variable vm_password {
    type = "string"
}
