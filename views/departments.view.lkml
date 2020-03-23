view: departments {
  sql_table_name: hive.ecommerce_db.departments ;;
  drill_fields: [department_id]
  suggestions: no

  dimension: department_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension: department_name {
    type: string
    sql: ${TABLE}.department_name ;;
  }

  measure: count {
    type: count
    drill_fields: [department_id, department_name]
  }
}
