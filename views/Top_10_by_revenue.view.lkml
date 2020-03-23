view: Top_10_by_revenue {
  derived_table: {
    sql: -- 2. Top 10 Products by Revenue
      select
        p.product_name as Product,
        r.revenue as TotalRevenue
      from
        ecommerce_db.products p
        inner join (
            select
              oi.order_item_product_id,
              sum(oi.order_item_subtotal) as revenue
          from
              ecommerce_db.order_items oi
              inner join ecommerce_db.orders o on oi.order_item_order_id = o.order_id
          where
              o.order_status <> 'CANCELED'
            and o.order_status <> 'SUSPECTED_FRAUD'
          group by
              order_item_product_id) r on p.product_id = r.order_item_product_id
      order by TotalRevenue desc limit 10
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

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.TotalRevenue ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [product, total_revenue]
  }
}
