view: sf_financial_indicators_all{
  sql_table_name: DATABLOCKS.finance.FRED_data ;;

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql:  ${dataset_code} + ${TABLE}.date ;;
  }

  dimension: dataset_code {
    type: string
    sql: ${TABLE}.dataset_code ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: total_value {
    type: sum
    sql: ${value} ;;
    value_format_name: usd
  }

  measure: average_value {
    type: average
    sql: ${value} ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
