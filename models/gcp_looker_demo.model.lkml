connection: "qubole_presto_gcp_demo"

# include all the views
include: "/views/**/*.view"

datagroup: gcp_looker_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gcp_looker_demo_default_datagroup

explore: access_logs {}

explore:Top_10_by_revenue  {}

explore:  top_10_by_views  {}

explore: top_10_by_quantity  {}

explore: order_items {}

explore: orders {}

explore: products {}

explore: product_facts {}