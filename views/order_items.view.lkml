view: order_items {
  sql_table_name: ecommerce_db.order_items ;;

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_item_order_id {
    type: number
    sql: ${TABLE}.order_item_order_id ;;
  }

  dimension: order_item_product_id {
    type: number
    sql: ${TABLE}.order_item_product_id ;;
  }

  dimension: order_item_quantity {
    type: number
    sql: ${TABLE}.order_item_quantity ;;
  }

  dimension: order_item_subtotal {
    type: number
    sql: ${TABLE}.order_item_subtotal ;;
    value_format_name: usd
  }

  dimension: order_item_product_price {
    type: number
    sql: ${TABLE}.order_item_product_price ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${order_item_subtotal} ;;
    value_format_name: usd
  }

  measure: total_quantity {
    type: sum
    sql: ${order_item_quantity} ;;
  }

  set: detail {
    fields: [
      order_item_id,
      order_item_order_id,
      order_item_product_id,
      order_item_quantity,
      order_item_subtotal,
      order_item_product_price
    ]
  }
}
