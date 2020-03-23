view: products {
  sql_table_name: hive.ecommerce_db.products ;;
  drill_fields: [product_id]
  suggestions: no

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_category_id {
    type: number
    sql: ${TABLE}.product_category_id ;;
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }

  dimension: product_image {
    type: string
    sql: ${TABLE}.product_image ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_price {
    type: number
    sql: ${TABLE}.product_price ;;
  }

  measure: count {
    type: count
    drill_fields: [product_id, product_name]
  }
}
