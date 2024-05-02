-- Table structure for table `director_activity_log`
{
  "dashboard": {
    "id": null,
    "uid": "eixpCcDKz",
    "title": "Director Activity Log Dashboard",
    "tags": [],
    "timezone": "browser",
    "schemaVersion": 21,
    "version": 0,
    "refresh": "10s",
    "time": {
      "from": "now-6h",
      "to": "now"
    },
    "panels": [
      {
        "gridPos": {
          "x": 0,
          "y": 0,
          "w": 12,
          "h": 8
        },
        "id": 1,
        "title": "Activity Log Overview",
        "type": "table",
        "datasource": "YourDataSource",
        "targets": [
          {
            "refId": "A",
            "rawSql": "SELECT * FROM director_activity_log"
          }
        ],
        "styles": [
          {
            "dateFormat": "YYYY-MM-DD HH:mm:ss",
            "type": "date"
          }
        ],
        "transformations": [
          {
            "id": "stringToUpperCase",
            "options": {}
          }
        ],
        "pageSize": null,
        "scroll": true,
        "showHeader": true,
        "sort": {
          "col": 0,
          "desc": true
        }
      }
    ],
    "timepicker": {
      "refresh_intervals": [
        "5s",
        "10s",
        "30s",
        "1m",
        "5m",
        "15m",
        "30m",
        "1h",
        "2h",
        "1d"
      ],
      "time_options": [
        "5m",
        "15m",
        "1h",
        "6h",
        "12h",
        "24h",
        "2d",
        "7d",
        "30d"
      ]
    },
    "annotations": {
      "list": []
    },
    "refresh": "1m",
    "schemaVersion": 26,
    "version": 8
  },
  "folderId": 0,
  "overwrite": false
}

                                              ---------------------

{
  "id": 16,
  "gridPos": {
    "x": 0,
    "y": 8,
    "w": 12,
    "h": 8
  },
  "type": "bargauge",
  "title": "Value Stream: Cars ",
  "datasource": {
    "uid": "FOyCtpJIk",
    "type": "mysql"
  },
  "pluginVersion": "9.0.0",
  "targets": [
    {
      "datasource": {
        "uid": "FOyCtpJIk",
        "type": "mysql"
      },
      "refId": "A",
      "hide": false,
      "format": "table",
      "timeColumn": "age",
      "metricColumn": "first_name",
      "group": [
        {
          "type": "column",
          "params": [
            "first_name"
          ]
        }
      ],
      "where": [
        {
          "type": "macro",
          "name": "$__unixEpochFilter",
          "params": []
        }
      ],
      "select": [
        [
          {
            "type": "column",
            "params": [
              "customer_id"
            ]
          },
          {
            "type": "aggregate",
            "params": [
              "avg"
            ]
          },
          {
            "type": "alias",
            "params": [
              "customer_id"
            ]
          }
        ]
      ],
      "rawQuery": true,
      "rawSql": "SELECT * FROM cars ORDER BY make, value ASC;",
      "table": "customers",
      "timeColumnType": "int"
    }
  ],
  "options": {
    "reduceOptions": {
      "values": false,
      "calcs": [
        "sum"
      ],
      "fields": ""
    },
    "orientation": "auto",
    "displayMode": "gradient",
    "showUnfilled": true,
    "minVizWidth": 0,
    "minVizHeight": 10
  },
  "fieldConfig": {
    "defaults": {
      "mappings": [],
      "thresholds": {
        "mode": "absolute",
        "steps": [
          {
            "color": "green",
            "value": null
          },
          {
            "color": "red",
            "value": 80
          }
        ]
      },
      "color": {
        "mode": "continuous-BlPu"
      },
      "unit": "conngm3"
    },
    "overrides": []
  }
}


                                                      -------------------

                                                query data about flights
{
  "annotations": {
    "list": []
  },
  "dashboard": {
    "rows": [
      {
        "panels": [
          {
            "title": "Flights by Departure Airport",
            "type": "graph",
            "span": 4,
            "targets": [
              {
                "alias": "New York (JFK)",
                "expr": "flights{airport='JFK'}",
                "refId": "A",
                "legendFormat": "{{ airport }}",
                "metric": "count"
              },
              {
                "alias": "Los Angeles (LAX)",
                "expr": "flights{airport='LAX'}",
                "refId": "B",
                "legendFormat": "{{ airport }}",
                "metric": "count"
              },
              {
                "alias": "Chicago (ORD)",
                "expr": "flights{airport='ORD'}",
                "refId": "C",
                "legendFormat": "{{ airport }}",
                "metric": "count"
              }
            ],
            "xaxis": {
              "show": true,
              "mode": "time",
              "name": "Time"
            },
            "yaxis": {
              "show": true,
              "label": "Number of Flights",
              "mode": "number"
            }
          },
          {
            "title": "Average Flight Delay by Destination",
            "type": "gauge",
            "span": 4,
            "targets": [
              {
                "expr": "avg(delay_minutes{destination='Miami'})",
                "refId": "A",
                "displayName": "Miami (MIA)"
              },
              {
                "expr": "avg(delay_minutes{destination='San Francisco'})",
                "refId": "B",
                "displayName": "San Francisco (SFO)"
              },
              {
                "expr": "avg(delay_minutes{destination='Seattle'})",
                "refId": "C",
                "displayName": "Seattle (SEA)"
              }
            ],
            "gauge": {
              "minValue": 0,
              "maxValue": 120,
              "showNeedle": true,
              "maxValueColor": "red",
              "minValueColor": "green"
            },
            "valueFontSize": 30
          }
        ]
      },
      {
        "panels": [
          {
            "title": "Passenger Count by Booking Class",
            "type": "pie",
            "span": 8,
            "targets": [
              {
                "expr": "sum(passengers{class='Economy'})",
                "refId": "A",
                "legendFormat": "Economy"
              },
              {
                "expr": "sum(passengers{class='Business'})",
                "refId": "B",
                "legendFormat": "Business"
              },
              {
                "expr": "sum(passengers{class='First'})",
                "refId": "C",
                "legendFormat": "First"
              }
            ],
            "legend": {
              "sort": "desc",
              "side": "right"
            }
          }
        ]
      }
    ],
    "title": "Flight Statistics Dashboard (Intermediate Level)"
  },
  "templating": {
    "list": []
  },
  "variables": []
}

                                                  ------------------
                                       Query data about Server health and application performance

{
  "annotations": {
    "list": []
  },
  "dashboard": {
    "rows": [
      {
        "panels": [
          {
            "title": "Server Health Overview",
            "type": "singlestat",
            "span": 4,
            "targets": [
              {
                "expr": "avg(uptime{server!='db-replica'})",
                "refId": "A",
                "metric": "avg"
              }
            ],
            "valueFontSize": 50,
            "valueName": "Average Server Uptime",
            "gauge": {
              "minValue": 0,
              "maxValue": 86400,
              "showNeedle": true,
              "maxValueColor": "red",
              "minValueColor": "green"
            }
          },
          {
            "title": "CPU Usage by Server Group",
            "type": "bar",
            "span": 8,
            "stack": false,
            "targets": [
              {
                "expr": "avg(cpu_usage{server_group='web'})",
                "refId": "A",
                "legendFormat": "Web Servers"
              },
              {
                "expr": "avg(cpu_usage{server_group='app'})",
                "refId": "B",
                "legendFormat": "App Servers"
              },
              {
                "expr": "avg(cpu_usage{server_group='db'})",
                "refId": "C",
                "legendFormat": "Database Server"
              }
            ],
            "xaxis": {
              "show": true,
              "mode": "short",
              "name": "Server Group"
            },
            "yaxis": {
              "show": true,
              "label": "CPU Usage (%)",
              "mode": "percent"
            }
          }
        ]
      },
      {
        "panels": [
          {
            "title": "API Request Latency Distribution",
            "type": "histogram",
            "span": 8,
            "targets": [
              {
                "expr": "histogram_quantile(0.95, api_request_latency{endpoint='/orders'})",
                "refId": "A",
                "legendFormat": "95th Percentile"
              },
              {
                "expr": "histogram_quantile(0.5, api_request_latency{endpoint='/orders'})",
                "refId": "B",
                "legendFormat": "Median"
              }
            ],
            "xaxis": {
              "show": true,
              "mode": "time",
              "name": "Time"
            },
            "yaxis": {
              "show": true,
              "label": "Latency (ms)",
              "mode": "number"
            }
          }
        ]
      }
    ],
    "title": "Server Monitoring Dashboard (Intermediate Level)"
  },
  "templating": {
    "list": []
  },
  "variables": []
}
