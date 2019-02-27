view: sf_indicators_metadata_codes {
  sql_table_name: DATABLOCKS.finance.FRED_metadata_codes ;;

  dimension: dataset_code {
    primary_key: yes
    hidden: yes
    type: string
    sql: REGEXP_REPLACE(${TABLE}.dataset_code, 'FRED/', '') ;;
  }

  dimension: indicator_name {
    view_label: "Indicator"
    type: string
    sql: ${TABLE}.description ;;
  }
}
