output "cluster_lookup_id" {
  description = "Map of id values across all cluster_lookup, keyed the same as var.cluster_lookup except keys with no id are omitted"
  value       = { for k, v in data.databricks_cluster.cluster_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cluster_lookup_cluster_id" {
  description = "Map of cluster_id values across all cluster_lookup, keyed the same as var.cluster_lookup except keys with no cluster_id are omitted"
  value       = { for k, v in data.databricks_cluster.cluster_lookup : k => v.cluster_id if v.cluster_id != null && length(v.cluster_id) > 0 }
}
output "cluster_lookup_cluster_info" {
  description = "Map of cluster_info values across all cluster_lookup, keyed the same as var.cluster_lookup except keys with no cluster_info are omitted"
  value       = { for k, v in data.databricks_cluster.cluster_lookup : k => one(v.cluster_info) if v.cluster_info != null && length(v.cluster_info) > 0 }
  sensitive   = true
}
output "cluster_lookup_cluster_name" {
  description = "Map of cluster_name values across all cluster_lookup, keyed the same as var.cluster_lookup except keys with no cluster_name are omitted"
  value       = { for k, v in data.databricks_cluster.cluster_lookup : k => v.cluster_name if v.cluster_name != null && length(v.cluster_name) > 0 }
}
output "cluster_lookup_provider_config" {
  description = "Map of provider_config values across all cluster_lookup, keyed the same as var.cluster_lookup except keys with no provider_config are omitted"
  value       = { for k, v in data.databricks_cluster.cluster_lookup : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}

