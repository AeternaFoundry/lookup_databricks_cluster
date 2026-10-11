data "databricks_cluster" "cluster_lookup" {
  for_each = var.cluster_lookup

  cluster_id   = each.value.cluster_id
  cluster_name = each.value.cluster_name

  dynamic "cluster_info" {
    for_each = each.value.cluster_info != null ? [each.value.cluster_info] : []
    content {
      dynamic "autoscale" {
        for_each = cluster_info.value.autoscale != null ? [cluster_info.value.autoscale] : []
        content {
          max_workers = autoscale.value.max_workers
          min_workers = autoscale.value.min_workers
        }
      }
      autotermination_minutes = cluster_info.value.autotermination_minutes
      dynamic "aws_attributes" {
        for_each = cluster_info.value.aws_attributes != null ? [cluster_info.value.aws_attributes] : []
        content {
          availability           = aws_attributes.value.availability
          ebs_volume_count       = aws_attributes.value.ebs_volume_count
          ebs_volume_iops        = aws_attributes.value.ebs_volume_iops
          ebs_volume_size        = aws_attributes.value.ebs_volume_size
          ebs_volume_throughput  = aws_attributes.value.ebs_volume_throughput
          ebs_volume_type        = aws_attributes.value.ebs_volume_type
          first_on_demand        = aws_attributes.value.first_on_demand
          instance_profile_arn   = aws_attributes.value.instance_profile_arn
          spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
          zone_id                = aws_attributes.value.zone_id
        }
      }
      dynamic "azure_attributes" {
        for_each = cluster_info.value.azure_attributes != null ? [cluster_info.value.azure_attributes] : []
        content {
          availability               = azure_attributes.value.availability
          capacity_reservation_group = azure_attributes.value.capacity_reservation_group
          first_on_demand            = azure_attributes.value.first_on_demand
          dynamic "log_analytics_info" {
            for_each = azure_attributes.value.log_analytics_info != null ? [azure_attributes.value.log_analytics_info] : []
            content {
              log_analytics_primary_key  = log_analytics_info.value.log_analytics_primary_key
              log_analytics_workspace_id = log_analytics_info.value.log_analytics_workspace_id
            }
          }
          spot_bid_max_price = azure_attributes.value.spot_bid_max_price
        }
      }
      cluster_cores = cluster_info.value.cluster_cores
      cluster_id    = cluster_info.value.cluster_id
      dynamic "cluster_log_conf" {
        for_each = cluster_info.value.cluster_log_conf != null ? [cluster_info.value.cluster_log_conf] : []
        content {
          dynamic "dbfs" {
            for_each = cluster_log_conf.value.dbfs != null ? [cluster_log_conf.value.dbfs] : []
            content {
              destination = dbfs.value.destination
            }
          }
          dynamic "s3" {
            for_each = cluster_log_conf.value.s3 != null ? [cluster_log_conf.value.s3] : []
            content {
              canned_acl        = s3.value.canned_acl
              destination       = s3.value.destination
              enable_encryption = s3.value.enable_encryption
              encryption_type   = s3.value.encryption_type
              endpoint          = s3.value.endpoint
              kms_key           = s3.value.kms_key
              region            = s3.value.region
            }
          }
          dynamic "volumes" {
            for_each = cluster_log_conf.value.volumes != null ? [cluster_log_conf.value.volumes] : []
            content {
              destination = volumes.value.destination
            }
          }
        }
      }
      dynamic "cluster_log_status" {
        for_each = cluster_info.value.cluster_log_status != null ? [cluster_info.value.cluster_log_status] : []
        content {
          last_attempted = cluster_log_status.value.last_attempted
          last_exception = cluster_log_status.value.last_exception
        }
      }
      cluster_memory_mb  = cluster_info.value.cluster_memory_mb
      cluster_name       = cluster_info.value.cluster_name
      cluster_source     = cluster_info.value.cluster_source
      creator_user_name  = cluster_info.value.creator_user_name
      custom_tags        = cluster_info.value.custom_tags
      data_security_mode = cluster_info.value.data_security_mode
      default_tags       = cluster_info.value.default_tags
      dependency_mode    = cluster_info.value.dependency_mode
      dynamic "docker_image" {
        for_each = cluster_info.value.docker_image != null ? [cluster_info.value.docker_image] : []
        content {
          dynamic "basic_auth" {
            for_each = docker_image.value.basic_auth != null ? [docker_image.value.basic_auth] : []
            content {
              password = basic_auth.value.password
              username = basic_auth.value.username
            }
          }
          url = docker_image.value.url
        }
      }
      dynamic "driver" {
        for_each = cluster_info.value.driver != null ? [cluster_info.value.driver] : []
        content {
          host_private_ip = driver.value.host_private_ip
          instance_id     = driver.value.instance_id
          dynamic "node_aws_attributes" {
            for_each = driver.value.node_aws_attributes != null ? [driver.value.node_aws_attributes] : []
            content {
              is_spot = node_aws_attributes.value.is_spot
            }
          }
          node_id         = driver.value.node_id
          private_ip      = driver.value.private_ip
          public_dns      = driver.value.public_dns
          start_timestamp = driver.value.start_timestamp
        }
      }
      driver_instance_pool_id = cluster_info.value.driver_instance_pool_id
      dynamic "driver_node_type_flexibility" {
        for_each = cluster_info.value.driver_node_type_flexibility != null ? [cluster_info.value.driver_node_type_flexibility] : []
        content {
          alternate_node_type_ids = driver_node_type_flexibility.value.alternate_node_type_ids
          aws_context_id          = driver_node_type_flexibility.value.aws_context_id
        }
      }
      driver_node_type_id          = cluster_info.value.driver_node_type_id
      enable_elastic_disk          = cluster_info.value.enable_elastic_disk
      enable_local_disk_encryption = cluster_info.value.enable_local_disk_encryption
      dynamic "executors" {
        for_each = cluster_info.value.executors != null ? cluster_info.value.executors : []
        content {
          host_private_ip = executors.value.host_private_ip
          instance_id     = executors.value.instance_id
          dynamic "node_aws_attributes" {
            for_each = executors.value.node_aws_attributes != null ? [executors.value.node_aws_attributes] : []
            content {
              is_spot = node_aws_attributes.value.is_spot
            }
          }
          node_id         = executors.value.node_id
          private_ip      = executors.value.private_ip
          public_dns      = executors.value.public_dns
          start_timestamp = executors.value.start_timestamp
        }
      }
      dynamic "gcp_attributes" {
        for_each = cluster_info.value.gcp_attributes != null ? [cluster_info.value.gcp_attributes] : []
        content {
          availability              = gcp_attributes.value.availability
          boot_disk_size            = gcp_attributes.value.boot_disk_size
          confidential_compute_type = gcp_attributes.value.confidential_compute_type
          first_on_demand           = gcp_attributes.value.first_on_demand
          google_service_account    = gcp_attributes.value.google_service_account
          local_ssd_count           = gcp_attributes.value.local_ssd_count
          use_preemptible_executors = gcp_attributes.value.use_preemptible_executors
          zone_id                   = gcp_attributes.value.zone_id
        }
      }
      dynamic "init_scripts" {
        for_each = cluster_info.value.init_scripts != null ? cluster_info.value.init_scripts : []
        content {
          dynamic "abfss" {
            for_each = init_scripts.value.abfss != null ? [init_scripts.value.abfss] : []
            content {
              destination = abfss.value.destination
            }
          }
          dynamic "dbfs" {
            for_each = init_scripts.value.dbfs != null ? [init_scripts.value.dbfs] : []
            content {
              destination = dbfs.value.destination
            }
          }
          dynamic "file" {
            for_each = init_scripts.value.file != null ? [init_scripts.value.file] : []
            content {
              destination = file.value.destination
            }
          }
          dynamic "gcs" {
            for_each = init_scripts.value.gcs != null ? [init_scripts.value.gcs] : []
            content {
              destination = gcs.value.destination
            }
          }
          dynamic "s3" {
            for_each = init_scripts.value.s3 != null ? [init_scripts.value.s3] : []
            content {
              canned_acl        = s3.value.canned_acl
              destination       = s3.value.destination
              enable_encryption = s3.value.enable_encryption
              encryption_type   = s3.value.encryption_type
              endpoint          = s3.value.endpoint
              kms_key           = s3.value.kms_key
              region            = s3.value.region
            }
          }
          dynamic "volumes" {
            for_each = init_scripts.value.volumes != null ? [init_scripts.value.volumes] : []
            content {
              destination = volumes.value.destination
            }
          }
          dynamic "workspace" {
            for_each = init_scripts.value.workspace != null ? [init_scripts.value.workspace] : []
            content {
              destination = workspace.value.destination
            }
          }
        }
      }
      instance_pool_id       = cluster_info.value.instance_pool_id
      is_single_node         = cluster_info.value.is_single_node
      jdbc_port              = cluster_info.value.jdbc_port
      kind                   = cluster_info.value.kind
      last_restarted_time    = cluster_info.value.last_restarted_time
      last_state_loss_time   = cluster_info.value.last_state_loss_time
      node_type_id           = cluster_info.value.node_type_id
      num_workers            = cluster_info.value.num_workers
      policy_id              = cluster_info.value.policy_id
      remote_disk_throughput = cluster_info.value.remote_disk_throughput
      runtime_engine         = cluster_info.value.runtime_engine
      single_user_name       = cluster_info.value.single_user_name
      spark_conf             = cluster_info.value.spark_conf
      spark_context_id       = cluster_info.value.spark_context_id
      spark_env_vars         = cluster_info.value.spark_env_vars
      spark_version          = cluster_info.value.spark_version
      dynamic "spec" {
        for_each = cluster_info.value.spec != null ? [cluster_info.value.spec] : []
        content {
          apply_policy_default_values = spec.value.apply_policy_default_values
          dynamic "autoscale" {
            for_each = spec.value.autoscale != null ? [spec.value.autoscale] : []
            content {
              max_workers = autoscale.value.max_workers
              min_workers = autoscale.value.min_workers
            }
          }
          dynamic "aws_attributes" {
            for_each = spec.value.aws_attributes != null ? [spec.value.aws_attributes] : []
            content {
              availability           = aws_attributes.value.availability
              ebs_volume_count       = aws_attributes.value.ebs_volume_count
              ebs_volume_iops        = aws_attributes.value.ebs_volume_iops
              ebs_volume_size        = aws_attributes.value.ebs_volume_size
              ebs_volume_throughput  = aws_attributes.value.ebs_volume_throughput
              ebs_volume_type        = aws_attributes.value.ebs_volume_type
              first_on_demand        = aws_attributes.value.first_on_demand
              instance_profile_arn   = aws_attributes.value.instance_profile_arn
              spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
              zone_id                = aws_attributes.value.zone_id
            }
          }
          dynamic "azure_attributes" {
            for_each = spec.value.azure_attributes != null ? [spec.value.azure_attributes] : []
            content {
              availability               = azure_attributes.value.availability
              capacity_reservation_group = azure_attributes.value.capacity_reservation_group
              first_on_demand            = azure_attributes.value.first_on_demand
              dynamic "log_analytics_info" {
                for_each = azure_attributes.value.log_analytics_info != null ? [azure_attributes.value.log_analytics_info] : []
                content {
                  log_analytics_primary_key  = log_analytics_info.value.log_analytics_primary_key
                  log_analytics_workspace_id = log_analytics_info.value.log_analytics_workspace_id
                }
              }
              spot_bid_max_price = azure_attributes.value.spot_bid_max_price
            }
          }
          dynamic "cluster_log_conf" {
            for_each = spec.value.cluster_log_conf != null ? [spec.value.cluster_log_conf] : []
            content {
              dynamic "dbfs" {
                for_each = cluster_log_conf.value.dbfs != null ? [cluster_log_conf.value.dbfs] : []
                content {
                  destination = dbfs.value.destination
                }
              }
              dynamic "s3" {
                for_each = cluster_log_conf.value.s3 != null ? [cluster_log_conf.value.s3] : []
                content {
                  canned_acl        = s3.value.canned_acl
                  destination       = s3.value.destination
                  enable_encryption = s3.value.enable_encryption
                  encryption_type   = s3.value.encryption_type
                  endpoint          = s3.value.endpoint
                  kms_key           = s3.value.kms_key
                  region            = s3.value.region
                }
              }
              dynamic "volumes" {
                for_each = cluster_log_conf.value.volumes != null ? [cluster_log_conf.value.volumes] : []
                content {
                  destination = volumes.value.destination
                }
              }
            }
          }
          dynamic "cluster_mount_info" {
            for_each = spec.value.cluster_mount_info != null ? spec.value.cluster_mount_info : []
            content {
              local_mount_dir_path = cluster_mount_info.value.local_mount_dir_path
              network_filesystem_info {
                mount_options  = cluster_mount_info.value.network_filesystem_info.mount_options
                server_address = cluster_mount_info.value.network_filesystem_info.server_address
              }
              remote_mount_dir_path = cluster_mount_info.value.remote_mount_dir_path
            }
          }
          cluster_name       = spec.value.cluster_name
          custom_tags        = spec.value.custom_tags
          data_security_mode = spec.value.data_security_mode
          dependency_mode    = spec.value.dependency_mode
          dynamic "docker_image" {
            for_each = spec.value.docker_image != null ? [spec.value.docker_image] : []
            content {
              dynamic "basic_auth" {
                for_each = docker_image.value.basic_auth != null ? [docker_image.value.basic_auth] : []
                content {
                  password = basic_auth.value.password
                  username = basic_auth.value.username
                }
              }
              url = docker_image.value.url
            }
          }
          driver_instance_pool_id = spec.value.driver_instance_pool_id
          dynamic "driver_node_type_flexibility" {
            for_each = spec.value.driver_node_type_flexibility != null ? [spec.value.driver_node_type_flexibility] : []
            content {
              alternate_node_type_ids = driver_node_type_flexibility.value.alternate_node_type_ids
              aws_context_id          = driver_node_type_flexibility.value.aws_context_id
            }
          }
          driver_node_type_id          = spec.value.driver_node_type_id
          enable_elastic_disk          = spec.value.enable_elastic_disk
          enable_local_disk_encryption = spec.value.enable_local_disk_encryption
          dynamic "gcp_attributes" {
            for_each = spec.value.gcp_attributes != null ? [spec.value.gcp_attributes] : []
            content {
              availability              = gcp_attributes.value.availability
              boot_disk_size            = gcp_attributes.value.boot_disk_size
              confidential_compute_type = gcp_attributes.value.confidential_compute_type
              first_on_demand           = gcp_attributes.value.first_on_demand
              google_service_account    = gcp_attributes.value.google_service_account
              local_ssd_count           = gcp_attributes.value.local_ssd_count
              use_preemptible_executors = gcp_attributes.value.use_preemptible_executors
              zone_id                   = gcp_attributes.value.zone_id
            }
          }
          idempotency_token = spec.value.idempotency_token
          dynamic "init_scripts" {
            for_each = spec.value.init_scripts != null ? spec.value.init_scripts : []
            content {
              dynamic "abfss" {
                for_each = init_scripts.value.abfss != null ? [init_scripts.value.abfss] : []
                content {
                  destination = abfss.value.destination
                }
              }
              dynamic "dbfs" {
                for_each = init_scripts.value.dbfs != null ? [init_scripts.value.dbfs] : []
                content {
                  destination = dbfs.value.destination
                }
              }
              dynamic "file" {
                for_each = init_scripts.value.file != null ? [init_scripts.value.file] : []
                content {
                  destination = file.value.destination
                }
              }
              dynamic "gcs" {
                for_each = init_scripts.value.gcs != null ? [init_scripts.value.gcs] : []
                content {
                  destination = gcs.value.destination
                }
              }
              dynamic "s3" {
                for_each = init_scripts.value.s3 != null ? [init_scripts.value.s3] : []
                content {
                  canned_acl        = s3.value.canned_acl
                  destination       = s3.value.destination
                  enable_encryption = s3.value.enable_encryption
                  encryption_type   = s3.value.encryption_type
                  endpoint          = s3.value.endpoint
                  kms_key           = s3.value.kms_key
                  region            = s3.value.region
                }
              }
              dynamic "volumes" {
                for_each = init_scripts.value.volumes != null ? [init_scripts.value.volumes] : []
                content {
                  destination = volumes.value.destination
                }
              }
              dynamic "workspace" {
                for_each = init_scripts.value.workspace != null ? [init_scripts.value.workspace] : []
                content {
                  destination = workspace.value.destination
                }
              }
            }
          }
          instance_pool_id = spec.value.instance_pool_id
          is_single_node   = spec.value.is_single_node
          kind             = spec.value.kind
          dynamic "library" {
            for_each = spec.value.library != null ? spec.value.library : []
            content {
              dynamic "cran" {
                for_each = library.value.cran != null ? [library.value.cran] : []
                content {
                  package = cran.value.package
                  repo    = cran.value.repo
                }
              }
              egg = library.value.egg
              jar = library.value.jar
              dynamic "maven" {
                for_each = library.value.maven != null ? [library.value.maven] : []
                content {
                  coordinates = maven.value.coordinates
                  exclusions  = maven.value.exclusions
                  repo        = maven.value.repo
                }
              }
              dynamic "provider_config" {
                for_each = library.value.provider_config != null ? [library.value.provider_config] : []
                content {
                  workspace_id = provider_config.value.workspace_id
                }
              }
              dynamic "pypi" {
                for_each = library.value.pypi != null ? [library.value.pypi] : []
                content {
                  package = pypi.value.package
                  repo    = pypi.value.repo
                }
              }
              requirements = library.value.requirements
              whl          = library.value.whl
            }
          }
          node_type_id = spec.value.node_type_id
          num_workers  = spec.value.num_workers
          policy_id    = spec.value.policy_id
          dynamic "provider_config" {
            for_each = spec.value.provider_config != null ? [spec.value.provider_config] : []
            content {
              workspace_id = provider_config.value.workspace_id
            }
          }
          remote_disk_throughput         = spec.value.remote_disk_throughput
          runtime_engine                 = spec.value.runtime_engine
          single_user_name               = spec.value.single_user_name
          spark_conf                     = spec.value.spark_conf
          spark_env_vars                 = spec.value.spark_env_vars
          spark_version                  = spec.value.spark_version
          ssh_public_keys                = spec.value.ssh_public_keys
          total_initial_remote_disk_size = spec.value.total_initial_remote_disk_size
          use_ml_runtime                 = spec.value.use_ml_runtime
          dynamic "worker_node_type_flexibility" {
            for_each = spec.value.worker_node_type_flexibility != null ? [spec.value.worker_node_type_flexibility] : []
            content {
              alternate_node_type_ids = worker_node_type_flexibility.value.alternate_node_type_ids
              aws_context_id          = worker_node_type_flexibility.value.aws_context_id
            }
          }
          dynamic "workload_type" {
            for_each = spec.value.workload_type != null ? [spec.value.workload_type] : []
            content {
              clients {
                jobs      = workload_type.value.clients.jobs
                notebooks = workload_type.value.clients.notebooks
              }
            }
          }
        }
      }
      ssh_public_keys = cluster_info.value.ssh_public_keys
      start_time      = cluster_info.value.start_time
      state           = cluster_info.value.state
      state_message   = cluster_info.value.state_message
      terminated_time = cluster_info.value.terminated_time
      dynamic "termination_reason" {
        for_each = cluster_info.value.termination_reason != null ? [cluster_info.value.termination_reason] : []
        content {
          code       = termination_reason.value.code
          parameters = termination_reason.value.parameters
          type       = termination_reason.value.type
        }
      }
      total_initial_remote_disk_size = cluster_info.value.total_initial_remote_disk_size
      use_ml_runtime                 = cluster_info.value.use_ml_runtime
      dynamic "worker_node_type_flexibility" {
        for_each = cluster_info.value.worker_node_type_flexibility != null ? [cluster_info.value.worker_node_type_flexibility] : []
        content {
          alternate_node_type_ids = worker_node_type_flexibility.value.alternate_node_type_ids
          aws_context_id          = worker_node_type_flexibility.value.aws_context_id
        }
      }
      dynamic "workload_type" {
        for_each = cluster_info.value.workload_type != null ? [cluster_info.value.workload_type] : []
        content {
          clients {
            jobs      = workload_type.value.clients.jobs
            notebooks = workload_type.value.clients.notebooks
          }
        }
      }
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

