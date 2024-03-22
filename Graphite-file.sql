-- Table structure for table `director_activity_log`
--

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

                                              -------------------------------------------------------

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
