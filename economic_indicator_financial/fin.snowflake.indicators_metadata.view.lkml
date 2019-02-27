view: sf_indicators_metadata {
  sql_table_name: DATABLOCKS.finance.FRED_metadata ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: indicator_name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: column_names {
    hidden: yes
    type: string
    sql: ${TABLE}.column_names ;;
  }

  dimension: indicator_source {
    type: string
    sql: ${TABLE}.database_code ;;
  }

  dimension: database_id {
    hidden: yes
    type: number
    sql: ${TABLE}.database_id ;;
  }

  dimension: dataset_code {
    hidden: yes
    type: string
    sql: ${TABLE}.dataset_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: frequency {
    type: string
    sql: ${TABLE}.frequency ;;
  }

  dimension_group: newest_available {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.newest_available_date ;;
  }

  dimension_group: oldest_available {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.oldest_available_date ;;
  }

  dimension: premium {
    hidden: yes
    type: yesno
    sql: ${TABLE}.premium ;;
  }

  dimension_group: refreshed {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.refreshed_at ;;
  }

  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }
}
