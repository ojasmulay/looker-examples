view: orders_temp {
  sql_table_name: hive.ecommerce_db.orders_temp ;;
  suggestions: no

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: salesperson_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.salesperson_id ;;
  }

  measure: count {
    type: count
    drill_fields: [salesperson.id, salesperson.name]
  }
}
