# Contains Historical Forex Dates Up To 2017-09-17
view: sf_finance_forex {
  sql_table_name: DATABLOCKS.exchangerate.forex ;;

  dimension_group: exchange {
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
    sql: ${TABLE}.exchange_date ;;
  }

  dimension: aud_usd {
    type: number
    sql: ${TABLE}.AUD_USD ;;
  }

  dimension: chf_jpy {
    type: number
    sql: ${TABLE}.CHF_JPY ;;
  }

  dimension: eur_chf {
    type: number
    sql: ${TABLE}.EUR_CHF ;;
  }

  dimension: eur_gbp {
    type: number
    sql: ${TABLE}.EUR_GBP ;;
  }

  dimension: eur_jpy {
    type: number
    sql: ${TABLE}.EUR_JPY ;;
  }

  dimension: eur_usd {
    type: number
    sql: ${TABLE}.EUR_USD ;;
  }

  dimension: gbp_chf {
    type: number
    sql: ${TABLE}.GBP_CHF ;;
  }

  dimension: gbp_jpy {
    type: number
    sql: ${TABLE}.GBP_JPY ;;
  }

  dimension: gbp_usd {
    type: number
    sql: ${TABLE}.GBP_USD ;;
  }

  dimension: nzd_usd {
    type: number
    sql: ${TABLE}.NZD_USD ;;
  }

  dimension: usd_cad {
    type: number
    sql: ${TABLE}.USD_CAD ;;
  }

  dimension: usd_chf {
    type: number
    sql: ${TABLE}.USD_CHF ;;
  }

  dimension: usd_jpy {
    type: number
    sql: ${TABLE}.USD_JPY ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
