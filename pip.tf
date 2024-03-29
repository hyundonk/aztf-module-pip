
resource "azurerm_public_ip" "public_ip" {
  for_each              = var.services

	name                  = "${var.prefix}-pip-${each.value.name}"
  location              = var.location
  resource_group_name   = var.rg

	allocation_method     = var.allocation_method # "Static"
	
  sku                   = var.sku 

	public_ip_prefix_id   = var.public_ip_prefix_id
  availability_zone	= "No-Zone"
  tags                  = var.tags
}


/*
output "public_ip" {
	value = {
		for ip in azurerm_public_ip.public_ip:
		ip.name => ip.id 
	}
}
*/
