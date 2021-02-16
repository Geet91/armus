view: organization {
  sql_table_name: meta.organization ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: _eqkey {
    type: number
    sql: ${TABLE}."_eqkey" ;;
  }

  dimension: _optlock {
    type: number
    sql: ${TABLE}."_optlock" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: shortname {
    type: string
    sql: ${TABLE}."shortname" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, shortname]
  }
}
