view: sf_finance_forex_real {
  sql_table_name: DATABLOCKS.exchangerate.forex_real ;;

  dimension: aud {
    type: number
    sql: ${TABLE}.AUD ;;
  }

  dimension: base_currency {
    type: string
    sql: ${TABLE}.base_currency ;;
  }

  dimension: bgn {
    type: number
    sql: ${TABLE}.BGN ;;
  }

  dimension: brl {
    type: number
    sql: ${TABLE}.BRL ;;
  }

  dimension: cad {
    type: number
    sql: ${TABLE}.CAD ;;
  }

  dimension: chf {
    type: number
    sql: ${TABLE}.CHF ;;
  }

  dimension: cny {
    type: number
    sql: ${TABLE}.CNY ;;
  }

  dimension: czk {
    type: number
    sql: ${TABLE}.CZK ;;
  }

  dimension: dkk {
    type: number
    sql: ${TABLE}.DKK ;;
  }

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

  dimension: gbp {
    type: number
    sql: ${TABLE}.GBP ;;
  }

  dimension: hkd {
    type: number
    sql: ${TABLE}.HKD ;;
  }

  dimension: hrk {
    type: number
    sql: ${TABLE}.HRK ;;
  }

  dimension: huf {
    type: number
    sql: ${TABLE}.HUF ;;
  }

  dimension: idr {
    type: number
    sql: ${TABLE}.IDR ;;
  }

  dimension: ils {
    type: number
    sql: ${TABLE}.ILS ;;
  }

  dimension: inr {
    type: number
    sql: ${TABLE}.INR ;;
  }

  dimension: jpy {
    type: number
    sql: ${TABLE}.JPY ;;
  }

  dimension: krw {
    type: number
    sql: ${TABLE}.KRW ;;
  }

  dimension: mxn {
    type: number
    sql: ${TABLE}.MXN ;;
  }

  dimension: myr {
    type: number
    sql: ${TABLE}.MYR ;;
  }

  dimension: nok {
    type: number
    sql: ${TABLE}.NOK ;;
  }

  dimension: nzd {
    type: number
    sql: ${TABLE}.NZD ;;
  }

  dimension: php {
    type: number
    sql: ${TABLE}.PHP ;;
  }

  dimension: pln {
    type: number
    sql: ${TABLE}.PLN ;;
  }

  dimension: ron {
    type: number
    sql: ${TABLE}.RON ;;
  }

  dimension: rub {
    type: number
    sql: ${TABLE}.RUB ;;
  }

  dimension: sek {
    type: number
    sql: ${TABLE}.SEK ;;
  }

  dimension: sgd {
    type: number
    sql: ${TABLE}.SGD ;;
  }

  dimension: thb {
    type: number
    sql: ${TABLE}.THB ;;
  }

  dimension: try {
    type: number
    sql: ${TABLE}.TRY ;;
  }

  dimension: usd {
    type: number
    sql: ${TABLE}.USD ;;
  }

  dimension: zar {
    type: number
    sql: ${TABLE}.ZAR ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
