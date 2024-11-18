                                                                          --------------- Network Monitoring Dashboard -----------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Network Traffic",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(bytes_sent{interface=\"eth0\"})",
            "legendFormat": "Bytes Sent"
          },
          {
            "expr": "sum(bytes_recv{interface=\"eth0\"})",
            "legendFormat": "Bytes Received"
          }
        ]
      },
      {
        "title": "Top 5 Source IPs",
        "type": "table",
        "targets": [
          {
            "expr": "topk(5, sum(bytes_sent{src_ip=~\"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\"}) by (src_ip))"
          }
        ]
      },
      {
        "title": "Network Latency",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(network_latency)"
          }
        ]
      }
    ]
  }
}
                          ------------------------------------ Security Monitoring Dashboard ----------------------------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Failed Login Attempts",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(failed_login_attempts)"
          }
        ]
      },
      {
        "title": "Security Alerts",
        "type": "table",
        "targets": [
          {
            "expr": "security_alerts"
          }
        ]
      },
      {
        "title": "Vulnerability Scans",
        "type": "gauge",
        "targets": [
          {
            "expr": "count(vulnerabilities)"
          }
        ]
      }
    ]
  }
}

                                  -------------------------------------- Application Performance Monitoring Dashboard ----------------------------------------------

{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Response Time",
        "type": "graph",
        "targets": [
          {
            "expr": "avg(response_time)"
          }
        ]
      },
      {
        "title": "Error Rate",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(error_rate)"
          }
        ]
      },
      {
        "title": "Top 5 Slowest Endpoints",
        "type": "table",
        "targets": [
          {
            "expr": "topk(5, avg(response_time) by (endpoint))"
          }
        ]
      }
    ]
  }
}


                      ----------------------------- Cloud Infrastructure Monitoring Dashboard ------------------------------

{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Instance CPU Utilization",
        "type": "graph",
        "targets": [
          {
            "expr": "avg(instance_cpu_usage{instance_type=\"m5.large\"})"
          },
          {
            "expr": "avg(instance_cpu_usage{instance_type=\"t2.micro\"})"
          }
        ]
      },
      {
        "title": "Disk Space Usage",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(disk_used_percent)"
          }
        ]
      },
      {
        "title": "Network In/Out",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(network_in_bytes)"
          },
          {
            "expr": "sum(network_out_bytes)"
          }
        ]
      }
    ]
  }
}


                            ------------------------------ IoT Device Monitoring Dashboard ---------------------------

{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Device Temperature",
        "type": "graph",
        "targets": [
          {
            "expr": "avg(device_temperature{device_id=\"device1\"})"
          },
          {
            "expr": "avg(device_temperature{device_id=\"device2\"})"
          }
        ]
      },
      {
        "title": "Device Battery Level",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(device_battery_level)"
          }
        ]
      },
      {
        "title": "Device Error Rate",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(device_error_rate)"
          }
        ]
      }
    ]
  }
}


                                            ----------------------------------- Financial Monitoring Dashboard --------------------------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Daily Revenue",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(revenue)"
          }
        ]
      },
      {
        "title": "Customer Acquisition Cost (CAC)",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(cac)"
          }
        ]
      },
      {
        "title": "Customer Lifetime Value (CLTV)",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(cltv)"
          }
        ]
      }
    ]
  }
}

                    ------------------------------ E-commerce Monitoring Dashboard ----------------------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Sales Over Time",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(sales_amount)"
          }
        ]
      },
      {
        "title": "Top 5 Products by Sales",
        "type": "table",
        "targets": [
          {
            "expr": "topk(5, sum(sales_amount) by (product_name))"
          }
        ]
      },
      {
        "title": "Customer Conversion Rate",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(conversion_rate)"
          }
        ]
      }
    ]
  }
}

                  ---------------------- IT Help Desk Monitoring Dashboard ----------------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Incident Tickets Over Time",
        "type": "graph",
        "targets": [
          {
            "expr": "count(incident_tickets)"
          }
        ]
      },
      {
        "title": "Top 5 Incident Categories",
        "type": "table",
        "targets": [
          {
            "expr": "topk(5, count(incident_tickets) by (incident_category))"
          }
        ]
      },
      {
        "title": "Average Incident Resolution Time",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(incident_resolution_time)"
          }
        ]
      }
    ]
  }
}

                            ------------------------------------- Manufacturing Plant Monitoring Dashboard ----------------------------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Machine Uptime",
        "type": "graph",
        "targets": [
          {
            "expr": "avg(machine_uptime)"
          }
        ]
      },
      {
        "title": "Product Defects",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(product_defects)"
          }
        ]
      },
      {
        "title": "Energy Consumption",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(energy_consumption)"
          }
        ]
      }
    ]
  }
}
                                    -------------------------------------------------------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Login Failures",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(failed_login_attempts)"
          }
        ]
      },
      {
        "title": "Security Alerts",
        "type": "table",
        "targets": [
          {
            "expr": "security_alerts"
          }
        ]
      },
      {
        "title": "Malware Infections",
        "type": "gauge",
        "targets": [
          {
            "expr": "count(malware_infections)"
          }
        ]
      }
    ]
  }
}

                                      ------------------------------------------------------------------
{
  "dashboard": {
    // ... other dashboard properties
    "panels": [
      {
        "title": "Temperature and Humidity",
        "type": "graph",
        "targets": [
          {
            "expr": "avg(temperature)"
          },
          {
            "expr": "avg(humidity)"
          }
        ]
      },
      {
        "title": "Air Quality Index (AQI)",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(aqi)"
          }
        ]
      },
      {
        "title": "Noise Level",
        "type": "graph",
        "targets": [
          {
            "expr": "avg(noise_level)"
          }
        ]
      }
    ]
  }
}

                                        -------------------------------------------------------------------
{
  "dashboard": {
    // ... other dashboard properties (Supply)
    "panels": [
      {
        "title": "Inventory Levels",
        "type": "graph",
        "targets": [
          {
            "expr": "avg(inventory_level)"
          }
        ]
      },
      {
        "title": "Order Fulfillment Time",
        "type": "gauge",
        "targets": [
          {
            "expr": "avg(order_fulfillment_time)"
          }
        ]
      },
      {
        "title": "Shipping Delays",
        "type": "graph",
        "targets": [
          {
            "expr": "sum(shipping_delays)"
          }
        ]
      }
    ]
  }
}

                                              ----------------------------------------------------------------------
{
  "dashboard": {
  // ...... (Network)
    "id": null,
    "uid": "network_monitoring_dashboard",
    "title": "Network Monitoring Dashboard",
    "tags": ["network", "monitoring"],
    "timezone": "browser",
    "schemaVersion": 21,
    "version": 1,
    "refresh": "5m",
    "panels": [
      {
        "title": "Network Traffic",
        "type": "graph",
        "datasource": "Prometheus",
        "targets": [
          {
            "expr": "sum(rate(node_network_receive_bytes_total{instance=\"server1:9100\"}[$__interval]))",
            "legendFormat": "Server 1 Inbound"
          },
          {
            "expr": "sum(rate(node_network_transmit_bytes_total{instance=\"server1:9100\"}[$__interval]))",
            "legendFormat": "Server 1 Outbound"
          }
        ]
      },
      {
        "title": "Server CPU Usage",
        "type": "gauge",
        "datasource": "Prometheus",
        "targets": [
          {
            "expr": "avg(node_cpu_seconds_total{mode=\"system\"}{instance=\"server1:9100\"})"
          }
        ]
      },
      {
        "title": "Disk Usage",
        "type": "table",
        "datasource": "Prometheus",
        "targets": [
          {
            "expr": "node_filesystem_size_bytes{fstype=\"ext4\"} - node_filesystem_free_bytes{fstype=\"ext4\"}"
          }
        ]
      }
    ]
  },
  "folderId": 0,
  "overwrite": false
}

                                                  --------------------------------------------------------------

{
  "dashboard": { // ........... SYSTEM
    "id": null,
    "uid": "system_health_dashboard",
    "title": "System Health Dashboard",
    "tags": ["system", "health"],
    "timezone": "browser",
    "schemaVersion": 21,
    "version": 1,
    "refresh": "5m",
    "panels": [
      {
        "title": "System Load",
        "type": "graph",
        "datasource": "InfluxDB",
        "targets": [
          {
            "refId": "A",
            "measurement": "system",
            "field": "load1"
          }
        ]
      },
      {
        "title": "Memory Usage",
        "type": "gauge",
        "datasource": "InfluxDB",
        "targets": [
          {
            "refId": "A",
            "measurement": "system",
            "field": "memory_used_percent"
          }
        ]
      },
      {
        "title": "Disk I/O",
        "type": "table",
        "datasource": "InfluxDB",
        "targets": [
          {
            "refId": "A",
            "measurement": "disk_io",
            "field": "disk_read_bytes_per_second"
          },
          {
            "refId": "B",
            "measurement": "disk_io",
            "field": "disk_write_bytes_per_second"
          }
        ]
      }
    ]
  },
  "folderId": 0,
  "overwrite": false
}

                                              -------------------------------------------------------
{
  "dashboard": {
    "id": null,
    "uid": "security_monitoring_dashboard",
    "title": "Security Monitoring Dashboard",
    "tags": ["security", "monitoring"],
    "timezone": "browser",
    "schemaVersion": 21,
    "version": 1,
    "refresh": "5m",
    "panels": [
      {
        "title": "Failed Login Attempts",
        "type": "graph",
        "datasource": "Elasticsearch",
        "targets": [
          {
            "refId": "A",
            "metrics": [
              [
                "count",
                "failed_login_attempts"
              ]
            ],
            "groupBy": [
              {
                "type": "time",
                "params": ["$__interval"]
              }
            ]
          }
        ]
      },
      {
        "title": "Security Alerts",
        "type": "table",
        "datasource": "Elasticsearch",
        "targets": [
          {
            "refId": "A",
            "metrics": [
              [
                "count",
                "security_alerts"
              ]
            ],
            "groupBy": [
              {
                "type": "terms",
                "params": ["alert_type"]
              }
            ]
          }
        ]
      },
      {
        "title": "Vulnerability Scans",
        "type": "gauge",
        "datasource": "InfluxDB",
        "targets": [
          {
            "refId": "A",
            "measurement": "vulnerability_scans",
            "field": "vulnerability_count"
          }
        ]
      }
    ]
  },
  "folderId": 0,
  "overwrite": false
}
