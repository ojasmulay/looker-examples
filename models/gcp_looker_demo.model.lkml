connection: "ranga-looker-demo"

# include all the views
include: "/views/**/*.view"

datagroup: gcp_looker_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gcp_looker_demo_default_datagroup

explore: tpcds {}
