view: customers {
  sql_table_name: hive.ecommerce_db.customers ;;
  drill_fields: [customer_id]
  suggestions: no

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}.customer_city ;;
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_fname {
    type: string
    sql: ${TABLE}.customer_fname ;;
  }

  dimension: customer_lname {
    type: string
    sql: ${TABLE}.customer_lname ;;
  }

  dimension: customer_password {
    type: string
    sql: ${TABLE}.customer_password ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  dimension: customer_street {
    type: string
    sql: ${TABLE}.customer_street ;;
  }

  dimension: customer_zipcode {
    type: string
    sql: ${TABLE}.customer_zipcode ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id, customer_fname, customer_lname]
  }
}
