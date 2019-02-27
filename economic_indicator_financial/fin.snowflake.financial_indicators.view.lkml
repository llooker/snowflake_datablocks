view: sf_financial_indicators {
  derived_table: {
    sql_trigger_value: select count(*) ;;
    sql:
      SELECT *
      , lag(date) OVER(partition by dataset_code order by date asc) as next_indicator_date
      from DATABLOCKS.finance.FRED_data
      where dataset_code in ('GDP', 'GDPC1', 'GDPPOT','CPIAUCSL', 'CPILFESL', 'GDPDEF', 'BASE','M1', 'M2', 'M1V', 'M2V', 'DFF','DTB3','DGS5','DGS10','DGS30','T5YIE','T10YIE','T5YIFR','TEDRATE','DPRIME', 'UNRATE','NROU','NROUST','CIVPART','EMRATIO','UNEMPLOY','PAYEMS','MANEMP','ICSA','IC4WSA', 'MEHOINUSA672N','DSPIC96','PCE','PCEDG','PSAVERT','RRSFS','DSPI', 'INDPRO','TCU','HOUST','GPDI','CP','STLFSI','DCOILWTICO','USSLIND','DTWEXM','DTWEXB', 'GFDEBTN','GFDEGDQ188S','EXCSRESNW','TOTCI');;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql:  ${dataset_code} + ${TABLE}.date ;;
  }

  dimension: dataset_code {
    label: "Indicator ID"
    type: string
    sql: ${TABLE}.dataset_code ;;
  }

  dimension: category {
    type: string
    case: {
      when: {
        sql: ${dataset_code} in ('GDP', 'GDPC1', 'GDPPOT') ;;
        label: "Economic Growth"
      }
      when: {
        sql: ${dataset_code} in ('CPIAUCSL', 'CPILFESL', 'GDPDEF') ;;
        label: "Prices and Inflation"
      }
      when: {
        sql: ${dataset_code} in ('BASE','M1', 'M2', 'M1V', 'M2V') ;;
        label: "Money Supply"
      }
      when: {
        sql: ${dataset_code} in ('DFF','DTB3','DGS5','DGS10','DGS30','T5YIE','T10YIE','T5YIFR','TEDRATE','DPRIME') ;;
        label: "Interest Rates"
      }
      when: {
        sql: ${dataset_code} in ('UNRATE','NROU','NROUST','CIVPART','EMRATIO','UNEMPLOY','PAYEMS','MANEMP','ICSA','IC4WSA') ;;
        label: "Employment"
      }
      when: {
        sql: ${dataset_code} in ('MEHOINUSA672N','DSPIC96','PCE','PCEDG','PSAVERT','RRSFS','DSPI') ;;
        label: "Income and Expenditures"
      }
      when: {
        sql: ${dataset_code} in ('INDPRO','TCU','HOUST','GPDI','CP','STLFSI','DCOILWTICO','USSLIND','DTWEXM','DTWEXB') ;;
        label: "Other Economic Indicators"
      }
      when: {
        sql: ${dataset_code} in ('GFDEBTN','GFDEGDQ188S','EXCSRESNW','TOTCI') ;;
        label: "Debt"
      }
      # Other Categories
      else: "Other Indicator"
    }
  }

  dimension_group: indicator {
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

  dimension_group: next_indicator {
    view_label: "Indicator Details"
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
    sql: ${TABLE}.next_indicator_date ;;
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
    hidden: yes
    type: count
    drill_fields: []
  }
}
