connection: "qubole_presto_gcp_demo"

# include all the views
include: "/views/**/*.view"

datagroup: gcp_looker_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gcp_looker_demo_default_datagroup



explore:Top_10_by_revenue  {}

explore:  top_10_by_views  {}

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
