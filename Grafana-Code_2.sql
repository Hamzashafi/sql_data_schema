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
