view: orders {
  sql_table_name: hive.ecommerce_db.orders ;;
  drill_fields: [order_id]
  suggestions: no

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_customer_id {
    type: number
    sql: ${TABLE}.order_customer_id ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id]
  }
}
