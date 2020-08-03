view: access_logs {
  sql_table_name: hive.ecommerce_db.access_logs ;;
  suggestions: no

  dimension: code1 {
    type: string
    sql: ${TABLE}.code1 ;;
  }

  dimension: code2 {
    type: string
    sql: ${TABLE}.code2 ;;
  }

  dimension: dash {
    type: string
    sql: ${TABLE}.dash ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}."date" ;;
  }

  dimension: http_version {
    type: string
    sql: ${TABLE}.http_version ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
