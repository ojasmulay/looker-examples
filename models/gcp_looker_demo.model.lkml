connection: "qubole_presto_gcp_demo"

# include all the views
include: "/views/**/*.view"

datagroup: gcp_looker_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gcp_looker_demo_default_datagroup



explore:Top_10_by_revenue  {}


explore: top_10_by_quantity  {}

explore: access_logs {}

explore: order_items {
  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_item_order_id} = ${orders.order_id} ;;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_item_product_id} = ${products.product_id} ;;
  }
  }
  explore:  top_10_by_views {
    join: Top_10_by_revenue {
      sql_on: ${top_10_by_views.product_name} = ${Top_10_by_revenue.product} ;;
      type: left_outer
      relationship: many_to_one
    }

    join: top_10_by_quantity {
      sql_on: ${top_10_by_views.product_name} = ${top_10_by_quantity.product} ;;
      type: left_outer
      relationship: many_to_one
    }

}
