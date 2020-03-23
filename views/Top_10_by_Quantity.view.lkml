view: top_10_by_quantity {

  derived_table: {
    sql: -- 3. Top 10 Products by Quantity
      select
        p.product_name as Product,
        count(oi.order_item_quantity) as QuantityOrdered
      from
        ecommerce_db.order_items oi
        inner join ecommerce_db.products p on oi.order_item_product_id = p.product_id
      group by
        p.product_name
      order by
        QuantityOrdered desc limit 10
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: quantity_ordered {
    type: number
    sql: ${TABLE}.QuantityOrdered ;;
  }

  set: detail {
    fields: [product, quantity_ordered]
  }
}
