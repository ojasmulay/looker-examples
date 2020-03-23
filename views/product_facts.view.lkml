view: product_facts {
  derived_table: {
    sql: select
              oi.order_item_product_id,
              sum(oi.order_item_subtotal) as revenue
          from
              ecommerce_hive_db.order_items oi
              inner join ecommerce_hive_db.orders o on oi.order_item_order_id = o.order_id
          where
              o.order_status <> 'CANCELED'
            and o.order_status <> 'SUSPECTED_FRAUD'
          group by
              order_item_product_id
 ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_item_product_id {
    type: number
    sql: ${TABLE}.order_item_product_id ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  set: detail {
    fields: [order_item_product_id, revenue]
  }
}
