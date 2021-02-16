view: cars {
  sql_table_name: views.cars ;;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: ao_owner_id {
    type: number
    sql: ${TABLE}."ao_owner_id" ;;
  }

  dimension: car_type {
    type: string
    sql: ${TABLE}."car_type" ;;
  }

  dimension: engine_size {
    type: number
    # required_access_grants: [is_a_customer]
    sql: ${TABLE}."engine_size" ;;
  }

  dimension: engine_type {
    type: string
    sql: ${TABLE}."engine_type" ;;
  }

  dimension: units_shipped {
    type: number
    sql: ${TABLE}."units_shipped" ;;
  }

  measure: total_units_shipped {
    type: sum
    sql: ${units_shipped} ;;
    drill_fields: [engine_type,engine_size,organization._eqkey ]
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
