view: top_10_by_views {

  derived_table: {
    sql: -- 1. Top 10 Products by Views
      select
        regexp_replace(REVERSE(split(REVERSE(url), '/')[1]),'%20',' ') as Product_Name,
        count(*) as Views
      from
        ecommerce_db.access_logs
      where
        url like '%/product/%'
      group by
        url
      order by
        Views desc
      limit 10
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.Views ;;
  }

  set: detail {
    fields: [product_name, views]
  }
}
