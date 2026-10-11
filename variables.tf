variable "cluster_lookup" {
  description = <<EOT
Map of cluster_lookup, attributes below
Optional:
    - cluster_id
    - cluster_name
    - cluster_info (block):
        - autoscale (optional, block):
            - max_workers (optional)
            - min_workers (optional)
        - autotermination_minutes (optional)
        - aws_attributes (optional, block):
            - availability (optional)
            - ebs_volume_count (optional)
            - ebs_volume_iops (optional)
            - ebs_volume_size (optional)
            - ebs_volume_throughput (optional)
            - ebs_volume_type (optional)
            - first_on_demand (optional)
            - instance_profile_arn (optional)
            - spot_bid_price_percent (optional)
            - zone_id (optional)
        - azure_attributes (optional, block):
            - availability (optional)
            - capacity_reservation_group (optional)
            - first_on_demand (optional)
            - log_analytics_info (optional, block):
                - log_analytics_primary_key (optional)
                - log_analytics_workspace_id (optional)
            - spot_bid_max_price (optional)
        - cluster_cores (optional)
        - cluster_id (optional)
        - cluster_log_conf (optional, block):
            - dbfs (optional, block):
                - destination (required)
            - s3 (optional, block):
                - canned_acl (optional)
                - destination (required)
                - enable_encryption (optional)
                - encryption_type (optional)
                - endpoint (optional)
                - kms_key (optional)
                - region (optional)
            - volumes (optional, block):
                - destination (required)
        - cluster_log_status (optional, block):
            - last_attempted (optional)
            - last_exception (optional)
        - cluster_memory_mb (optional)
        - cluster_name (optional)
        - cluster_source (optional)
        - creator_user_name (optional)
        - custom_tags (optional)
        - data_security_mode (optional)
        - default_tags (optional)
        - dependency_mode (optional)
        - docker_image (optional, block):
            - basic_auth (optional, block):
                - password (optional)
                - username (optional)
            - url (optional)
        - driver (optional, block):
            - host_private_ip (optional)
            - instance_id (optional)
            - node_aws_attributes (optional, block):
                - is_spot (optional)
            - node_id (optional)
            - private_ip (optional)
            - public_dns (optional)
            - start_timestamp (optional)
        - driver_instance_pool_id (optional)
        - driver_node_type_flexibility (optional, block):
            - alternate_node_type_ids (optional)
            - aws_context_id (optional)
        - driver_node_type_id (optional)
        - enable_elastic_disk (optional)
        - enable_local_disk_encryption (optional)
        - executors (optional, block):
            - host_private_ip (optional)
            - instance_id (optional)
            - node_aws_attributes (optional, block):
                - is_spot (optional)
            - node_id (optional)
            - private_ip (optional)
            - public_dns (optional)
            - start_timestamp (optional)
        - gcp_attributes (optional, block):
            - availability (optional)
            - boot_disk_size (optional)
            - confidential_compute_type (optional)
            - first_on_demand (optional)
            - google_service_account (optional)
            - local_ssd_count (optional)
            - use_preemptible_executors (optional)
            - zone_id (optional)
        - init_scripts (optional, block):
            - abfss (optional, block):
                - destination (required)
            - dbfs (optional, block):
                - destination (required)
            - file (optional, block):
                - destination (required)
            - gcs (optional, block):
                - destination (required)
            - s3 (optional, block):
                - canned_acl (optional)
                - destination (required)
                - enable_encryption (optional)
                - encryption_type (optional)
                - endpoint (optional)
                - kms_key (optional)
                - region (optional)
            - volumes (optional, block):
                - destination (required)
            - workspace (optional, block):
                - destination (required)
        - instance_pool_id (optional)
        - is_single_node (optional)
        - jdbc_port (optional)
        - kind (optional)
        - last_restarted_time (optional)
        - last_state_loss_time (optional)
        - node_type_id (optional)
        - num_workers (optional)
        - policy_id (optional)
        - remote_disk_throughput (optional)
        - runtime_engine (optional)
        - single_user_name (optional)
        - spark_conf (optional)
        - spark_context_id (optional)
        - spark_env_vars (optional)
        - spark_version (optional)
        - spec (optional, block):
            - apply_policy_default_values (optional)
            - autoscale (optional, block):
                - max_workers (optional)
                - min_workers (optional)
            - aws_attributes (optional, block):
                - availability (optional)
                - ebs_volume_count (optional)
                - ebs_volume_iops (optional)
                - ebs_volume_size (optional)
                - ebs_volume_throughput (optional)
                - ebs_volume_type (optional)
                - first_on_demand (optional)
                - instance_profile_arn (optional)
                - spot_bid_price_percent (optional)
                - zone_id (optional)
            - azure_attributes (optional, block):
                - availability (optional)
                - capacity_reservation_group (optional)
                - first_on_demand (optional)
                - log_analytics_info (optional, block):
                    - log_analytics_primary_key (optional)
                    - log_analytics_workspace_id (optional)
                - spot_bid_max_price (optional)
            - cluster_log_conf (optional, block):
                - dbfs (optional, block):
                    - destination (required)
                - s3 (optional, block):
                    - canned_acl (optional)
                    - destination (required)
                    - enable_encryption (optional)
                    - encryption_type (optional)
                    - endpoint (optional)
                    - kms_key (optional)
                    - region (optional)
                - volumes (optional, block):
                    - destination (required)
            - cluster_mount_info (optional, block):
                - local_mount_dir_path (required)
                - network_filesystem_info (required, block):
                    - mount_options (optional)
                    - server_address (required)
                - remote_mount_dir_path (optional)
            - cluster_name (optional)
            - custom_tags (optional)
            - data_security_mode (optional)
            - dependency_mode (optional)
            - docker_image (optional, block):
                - basic_auth (optional, block):
                    - password (required)
                    - username (required)
                - url (required)
            - driver_instance_pool_id (optional)
            - driver_node_type_flexibility (optional, block):
                - alternate_node_type_ids (optional)
                - aws_context_id (optional)
            - driver_node_type_id (optional)
            - enable_elastic_disk (optional)
            - enable_local_disk_encryption (optional)
            - gcp_attributes (optional, block):
                - availability (optional)
                - boot_disk_size (optional)
                - confidential_compute_type (optional)
                - first_on_demand (optional)
                - google_service_account (optional)
                - local_ssd_count (optional)
                - use_preemptible_executors (optional)
                - zone_id (optional)
            - idempotency_token (optional)
            - init_scripts (optional, block):
                - abfss (optional, block):
                    - destination (required)
                - dbfs (optional, block):
                    - destination (required)
                - file (optional, block):
                    - destination (required)
                - gcs (optional, block):
                    - destination (required)
                - s3 (optional, block):
                    - canned_acl (optional)
                    - destination (required)
                    - enable_encryption (optional)
                    - encryption_type (optional)
                    - endpoint (optional)
                    - kms_key (optional)
                    - region (optional)
                - volumes (optional, block):
                    - destination (required)
                - workspace (optional, block):
                    - destination (required)
            - instance_pool_id (optional)
            - is_single_node (optional)
            - kind (optional)
            - library (optional, block):
                - cran (optional, block):
                    - package (required)
                    - repo (optional)
                - egg (optional)
                - jar (optional)
                - maven (optional, block):
                    - coordinates (required)
                    - exclusions (optional)
                    - repo (optional)
                - provider_config (optional, block):
                    - workspace_id (optional)
                - pypi (optional, block):
                    - package (required)
                    - repo (optional)
                - requirements (optional)
                - whl (optional)
            - node_type_id (optional)
            - num_workers (optional)
            - policy_id (optional)
            - provider_config (optional, block):
                - workspace_id (optional)
            - remote_disk_throughput (optional)
            - runtime_engine (optional)
            - single_user_name (optional)
            - spark_conf (optional)
            - spark_env_vars (optional)
            - spark_version (optional)
            - ssh_public_keys (optional)
            - total_initial_remote_disk_size (optional)
            - use_ml_runtime (optional)
            - worker_node_type_flexibility (optional, block):
                - alternate_node_type_ids (optional)
                - aws_context_id (optional)
            - workload_type (optional, block):
                - clients (required, block):
                    - jobs (optional)
                    - notebooks (optional)
        - ssh_public_keys (optional)
        - start_time (optional)
        - state (optional)
        - state_message (optional)
        - terminated_time (optional)
        - termination_reason (optional, block):
            - code (optional)
            - parameters (optional)
            - type (optional)
        - total_initial_remote_disk_size (optional)
        - use_ml_runtime (optional)
        - worker_node_type_flexibility (optional, block):
            - alternate_node_type_ids (optional)
            - aws_context_id (optional)
        - workload_type (optional, block):
            - clients (required, block):
                - jobs (optional)
                - notebooks (optional)
    - provider_config (block):
        - workspace_id (optional)
EOT

  type = map(object({
    cluster_id   = optional(string)
    cluster_name = optional(string)
    cluster_info = optional(object({
      autoscale = optional(object({
        max_workers = optional(number)
        min_workers = optional(number)
      }))
      autotermination_minutes = optional(number)
      aws_attributes = optional(object({
        availability           = optional(string)
        ebs_volume_count       = optional(number)
        ebs_volume_iops        = optional(number)
        ebs_volume_size        = optional(number)
        ebs_volume_throughput  = optional(number)
        ebs_volume_type        = optional(string)
        first_on_demand        = optional(number)
        instance_profile_arn   = optional(string)
        spot_bid_price_percent = optional(number)
        zone_id                = optional(string)
      }))
      azure_attributes = optional(object({
        availability               = optional(string)
        capacity_reservation_group = optional(string)
        first_on_demand            = optional(number)
        log_analytics_info = optional(object({
          log_analytics_primary_key  = optional(string)
          log_analytics_workspace_id = optional(string)
        }))
        spot_bid_max_price = optional(number)
      }))
      cluster_cores = optional(number)
      cluster_id    = optional(string)
      cluster_log_conf = optional(object({
        dbfs = optional(object({
          destination = string
        }))
        s3 = optional(object({
          canned_acl        = optional(string)
          destination       = string
          enable_encryption = optional(bool)
          encryption_type   = optional(string)
          endpoint          = optional(string)
          kms_key           = optional(string)
          region            = optional(string)
        }))
        volumes = optional(object({
          destination = string
        }))
      }))
      cluster_log_status = optional(object({
        last_attempted = optional(number)
        last_exception = optional(string)
      }))
      cluster_memory_mb  = optional(number)
      cluster_name       = optional(string)
      cluster_source     = optional(string)
      creator_user_name  = optional(string)
      custom_tags        = optional(map(string))
      data_security_mode = optional(string)
      default_tags       = optional(map(string))
      dependency_mode    = optional(string)
      docker_image = optional(object({
        basic_auth = optional(object({
          password = optional(string)
          username = optional(string)
        }))
        url = optional(string)
      }))
      driver = optional(object({
        host_private_ip = optional(string)
        instance_id     = optional(string)
        node_aws_attributes = optional(object({
          is_spot = optional(bool)
        }))
        node_id         = optional(string)
        private_ip      = optional(string)
        public_dns      = optional(string)
        start_timestamp = optional(number)
      }))
      driver_instance_pool_id = optional(string)
      driver_node_type_flexibility = optional(object({
        alternate_node_type_ids = optional(list(string))
        aws_context_id          = optional(string)
      }))
      driver_node_type_id          = optional(string)
      enable_elastic_disk          = optional(bool)
      enable_local_disk_encryption = optional(bool)
      executors = optional(list(object({
        host_private_ip = optional(string)
        instance_id     = optional(string)
        node_aws_attributes = optional(object({
          is_spot = optional(bool)
        }))
        node_id         = optional(string)
        private_ip      = optional(string)
        public_dns      = optional(string)
        start_timestamp = optional(number)
      })))
      gcp_attributes = optional(object({
        availability              = optional(string)
        boot_disk_size            = optional(number)
        confidential_compute_type = optional(string)
        first_on_demand           = optional(number)
        google_service_account    = optional(string)
        local_ssd_count           = optional(number)
        use_preemptible_executors = optional(bool)
        zone_id                   = optional(string)
      }))
      init_scripts = optional(list(object({
        abfss = optional(object({
          destination = string
        }))
        dbfs = optional(object({
          destination = string
        }))
        file = optional(object({
          destination = string
        }))
        gcs = optional(object({
          destination = string
        }))
        s3 = optional(object({
          canned_acl        = optional(string)
          destination       = string
          enable_encryption = optional(bool)
          encryption_type   = optional(string)
          endpoint          = optional(string)
          kms_key           = optional(string)
          region            = optional(string)
        }))
        volumes = optional(object({
          destination = string
        }))
        workspace = optional(object({
          destination = string
        }))
      })))
      instance_pool_id       = optional(string)
      is_single_node         = optional(bool)
      jdbc_port              = optional(number)
      kind                   = optional(string)
      last_restarted_time    = optional(number)
      last_state_loss_time   = optional(number)
      node_type_id           = optional(string)
      num_workers            = optional(number)
      policy_id              = optional(string)
      remote_disk_throughput = optional(number)
      runtime_engine         = optional(string)
      single_user_name       = optional(string)
      spark_conf             = optional(map(string))
      spark_context_id       = optional(number)
      spark_env_vars         = optional(map(string))
      spark_version          = optional(string)
      spec = optional(object({
        apply_policy_default_values = optional(bool)
        autoscale = optional(object({
          max_workers = optional(number)
          min_workers = optional(number)
        }))
        aws_attributes = optional(object({
          availability           = optional(string)
          ebs_volume_count       = optional(number)
          ebs_volume_iops        = optional(number)
          ebs_volume_size        = optional(number)
          ebs_volume_throughput  = optional(number)
          ebs_volume_type        = optional(string)
          first_on_demand        = optional(number)
          instance_profile_arn   = optional(string)
          spot_bid_price_percent = optional(number)
          zone_id                = optional(string)
        }))
        azure_attributes = optional(object({
          availability               = optional(string)
          capacity_reservation_group = optional(string)
          first_on_demand            = optional(number)
          log_analytics_info = optional(object({
            log_analytics_primary_key  = optional(string)
            log_analytics_workspace_id = optional(string)
          }))
          spot_bid_max_price = optional(number)
        }))
        cluster_log_conf = optional(object({
          dbfs = optional(object({
            destination = string
          }))
          s3 = optional(object({
            canned_acl        = optional(string)
            destination       = string
            enable_encryption = optional(bool)
            encryption_type   = optional(string)
            endpoint          = optional(string)
            kms_key           = optional(string)
            region            = optional(string)
          }))
          volumes = optional(object({
            destination = string
          }))
        }))
        cluster_mount_info = optional(list(object({
          local_mount_dir_path = string
          network_filesystem_info = object({
            mount_options  = optional(string)
            server_address = string
          })
          remote_mount_dir_path = optional(string)
        })))
        cluster_name       = optional(string)
        custom_tags        = optional(map(string))
        data_security_mode = optional(string)
        dependency_mode    = optional(string)
        docker_image = optional(object({
          basic_auth = optional(object({
            password = string
            username = string
          }))
          url = string
        }))
        driver_instance_pool_id = optional(string)
        driver_node_type_flexibility = optional(object({
          alternate_node_type_ids = optional(list(string))
          aws_context_id          = optional(string)
        }))
        driver_node_type_id          = optional(string)
        enable_elastic_disk          = optional(bool)
        enable_local_disk_encryption = optional(bool)
        gcp_attributes = optional(object({
          availability              = optional(string)
          boot_disk_size            = optional(number)
          confidential_compute_type = optional(string)
          first_on_demand           = optional(number)
          google_service_account    = optional(string)
          local_ssd_count           = optional(number)
          use_preemptible_executors = optional(bool)
          zone_id                   = optional(string)
        }))
        idempotency_token = optional(string)
        init_scripts = optional(list(object({
          abfss = optional(object({
            destination = string
          }))
          dbfs = optional(object({
            destination = string
          }))
          file = optional(object({
            destination = string
          }))
          gcs = optional(object({
            destination = string
          }))
          s3 = optional(object({
            canned_acl        = optional(string)
            destination       = string
            enable_encryption = optional(bool)
            encryption_type   = optional(string)
            endpoint          = optional(string)
            kms_key           = optional(string)
            region            = optional(string)
          }))
          volumes = optional(object({
            destination = string
          }))
          workspace = optional(object({
            destination = string
          }))
        })))
        instance_pool_id = optional(string)
        is_single_node   = optional(bool)
        kind             = optional(string)
        library = optional(list(object({
          cran = optional(object({
            package = string
            repo    = optional(string)
          }))
          egg = optional(string)
          jar = optional(string)
          maven = optional(object({
            coordinates = string
            exclusions  = optional(list(string))
            repo        = optional(string)
          }))
          provider_config = optional(object({
            workspace_id = optional(string)
          }))
          pypi = optional(object({
            package = string
            repo    = optional(string)
          }))
          requirements = optional(string)
          whl          = optional(string)
        })))
        node_type_id = optional(string)
        num_workers  = optional(number)
        policy_id    = optional(string)
        provider_config = optional(object({
          workspace_id = optional(string)
        }))
        remote_disk_throughput         = optional(number)
        runtime_engine                 = optional(string)
        single_user_name               = optional(string)
        spark_conf                     = optional(map(string))
        spark_env_vars                 = optional(map(string))
        spark_version                  = optional(string)
        ssh_public_keys                = optional(list(string))
        total_initial_remote_disk_size = optional(number)
        use_ml_runtime                 = optional(bool)
        worker_node_type_flexibility = optional(object({
          alternate_node_type_ids = optional(list(string))
          aws_context_id          = optional(string)
        }))
        workload_type = optional(object({
          clients = object({
            jobs      = optional(bool)
            notebooks = optional(bool)
          })
        }))
      }))
      ssh_public_keys = optional(list(string))
      start_time      = optional(number)
      state           = optional(string)
      state_message   = optional(string)
      terminated_time = optional(number)
      termination_reason = optional(object({
        code       = optional(string)
        parameters = optional(map(string))
        type       = optional(string)
      }))
      total_initial_remote_disk_size = optional(number)
      use_ml_runtime                 = optional(bool)
      worker_node_type_flexibility = optional(object({
        alternate_node_type_ids = optional(list(string))
        aws_context_id          = optional(string)
      }))
      workload_type = optional(object({
        clients = object({
          jobs      = optional(bool)
          notebooks = optional(bool)
        })
      }))
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cluster_lookup : (
        v.cluster_info == null || (v.cluster_info.spec == null || (v.cluster_info.spec.init_scripts == null || (length(v.cluster_info.spec.init_scripts) <= 10)))
      )
    ])
    error_message = "Each init_scripts list must contain at most 10 items"
  }
}

