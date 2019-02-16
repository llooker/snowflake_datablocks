view: sf_forex_historical_real {
  derived_table: {
    sql: SELECT
        cast(forex.exchange_date as timestamp) AS forex_exchange_date,
        forex.AUD_USD  AS AUD_USD,
        forex.CHF_JPY  AS CHF_JPY,
        forex.EUR_CHF  AS EUR_CHF,
        forex.EUR_GBP  AS EUR_GBP,
        forex.EUR_JPY  AS EUR_JPY,
        forex.EUR_USD  AS EUR_USD,
        forex.GBP_CHF  AS GBP_CHF,
        forex.GBP_JPY  AS GBP_JPY,
        forex.GBP_USD  AS GBP_USD,
        forex.NZD_USD  AS NZD_USD,
        forex.USD_CAD  AS USD_CAD,
        forex.USD_CHF  AS USD_CHF,
        forex.USD_JPY  AS USD_JPY
      FROM DATABLOCKS.exchangerate.forex  AS forex
      UNION ALL
      SELECT
        cast(forex_real.exchange_date as timestamp) AS forex_exchange_date,
        1/(forex_real.AUD*(1/forex_real.USD))  AS AUD_USD,
        1/(forex_real.CHF*(1/forex_real.JPY))  AS CHF_JPY ,
        forex_real.CHF  AS EUR_CHF,
        forex_real.GBP AS EUR_GBP,
        forex_real.JPY  AS EUR_JPY,
        forex_real.USD  AS EUR_USD,
        forex_real.CHF*(1/forex_real.GBP)  AS GBP_CHF,
        forex_real.JPY*(1/forex_real.GBP)  AS GBP_JPY,
        forex_real.USD*(1/forex_real.GBP)  AS GBP_USD,
        1/(forex_real.NZD*(1/forex_real.USD))  AS NZD_USD,
        forex_real.CAD *(1/forex_real.USD) AS USD_CAD,
        forex_real.CHF *(1/forex_real.USD) AS USD_CHF,
        forex_real.JPY *(1/forex_real.USD) AS USD_JPY
      FROM DATABLOCKS.exchangerate.forex_real  AS forex_real
       ;;
    datagroup_trigger: default
  }

  dimension_group: forex_exchange {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.forex_exchange_date ;;
  }

  dimension: aud_usd {
    label: "AUD/USD"
    description: "1 Australian Dollar = X US Dollars"
    value_format_name: decimal_4
    type:  number
    sql: ${TABLE}.AUD_USD ;;
    hidden: yes
  }

  dimension: chf_jpy {
    label: "CHF/JPY"
    description: "1 Swiss Franc = X Japanese Yen"
    type:  number
    sql: ${TABLE}.CHF_JPY ;;
    hidden: yes
  }

  dimension: eur_chf {
    label: "EUR/CHF"
    description: "1 Euro = X Swiss Francs"
    type:  number
    sql: ${TABLE}.EUR_CHF ;;
    hidden: yes
  }

  dimension: eur_gbp {
    label: "EUR/GBP"
    description: "1 Euro = X Great British Pounds"
    type:  number
    sql: ${TABLE}.EUR_GBP ;;
    hidden: yes
  }

  dimension: eur_jpy {
    label: "EUR/JPY"
    description: "1 Euro = X Japanese Yen"
    type:  number
    sql: ${TABLE}.EUR_JPY ;;
    hidden: yes
  }

  dimension: eur_usd {
    label: "EUR/USD"
    description: "1 Euro = X US Dollars"
    type:  number
    sql: ${TABLE}.EUR_USD ;;
    hidden: yes
  }

  dimension: gbp_chf {
    label: "GBP/CHF"
    description: "1 Great British Pound = X Swiss Francs"
    type:  number
    sql: ${TABLE}.GBP_CHF ;;
    hidden: yes
  }

  dimension: gbp_jpy {
    label: "GBP/JPY"
    description: "1 Great British Pound = X Japanese Yen"
    type:  number
    sql: ${TABLE}.GBP_JPY ;;
    hidden: yes
  }

  dimension: gbp_usd {
    label: "GBP/USD"
    description: "1 Great British Pound = X US dollars"
    type:  number
    sql: ${TABLE}.GBP_USD ;;
    hidden: yes
  }

  dimension: nzd_usd {
    label: "NZD/USD"
    description: "1 New Zealand Dollar = X US dollars"
    type:  number
    sql: ${TABLE}.NZD_USD ;;
    hidden: yes
  }

  dimension: usd_cad {
    label: "USD/CAD"
    description: "1 US dollar = X Canadian dollars"
    type:  number
    sql: ${TABLE}.USD_CAD ;;
    hidden: yes
  }

  dimension: usd_chf {
    label: "USD/CHF"
    description: "1 US dollar = X Swiss Francs"
    type:  number
    sql: ${TABLE}.USD_CHF ;;
    hidden: yes
  }

  dimension: usd_jpy {
    label: "USD/JPY"
    description: "1 US dollar = X Japanese Yen"
    type:  number
    sql: ${TABLE}.USD_JPY ;;
    hidden: yes
  }

  ################################### measures to plot on graph ###################################

  measure: audusd {
    label: "AUD/USD"
    description: "1 Australian Dollar = X US Dollars"
    value_format_name: decimal_4
    type:  max
    sql: ${aud_usd} ;;
  }

  measure: chfjpy {
    label: "CHF/JPY"
    description: "1 Swiss Franc = X Japanese Yen"
    type:  max
    sql: ${chf_jpy};;
  }

  measure: eurchf {
    label: "EUR/CHF"
    description: "1 Euro = X Swiss Francs"
    type:  max
    sql: ${eur_chf} ;;
  }

  measure: eurgbp {
    label: "EUR/GBP"
    description: "1 Euro = X Great British Pounds"
    type:  max
    sql: ${eur_gbp} ;;
  }

  measure: eurjpy {
    label: "EUR/JPY"
    description: "1 Euro = X Japanese Yen"
    type:  max
    sql: ${eur_jpy};;
  }

  measure: eurusd {
    label: "EUR/USD"
    description: "1 Euro = X US Dollars"
    type:  max
    sql: ${eur_usd} ;;
  }

  measure: gbpchf {
    label: "GBP/CHF"
    description: "1 Great British Pound = X Swiss Francs"
    type:  max
    sql: ${gbp_chf};;
  }

  measure: gbpjpy {
    label: "GBP/JPY"
    description: "1 Great British Pound = X Japanese Yen"
    type:  max
    sql: ${gbp_jpy} ;;
  }

  measure: gbpusd {
    label: "GBP/USD"
    description: "1 Great British Pound = X US dollars"
    type:  max
    sql: ${gbp_usd} ;;
  }

  measure: nzdusd {
    label: "NZD/USD"
    description: "1 New Zealand Dollar = X US dollars"
    type:  max
    sql: ${nzd_usd};;
  }

  measure: usdcad {
    label: "USD/CAD"
    description: "1 US dollar = X Canadian dollars"
    type:  max
    sql: ${usd_cad} ;;
  }

  measure: usdchf {
    label: "USD/CHF"
    description: "1 US dollar = X Swiss Francs"
    type:  number
    sql: ${usd_chf} ;;
  }

  measure: usdjpy {
    label: "USD/JPY"
    description: "1 US dollar = X Japanese Yen"
    type: max
    sql: ${usd_jpy} ;;
  }

}
