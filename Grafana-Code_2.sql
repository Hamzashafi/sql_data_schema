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
