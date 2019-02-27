view: sf_indicator_yoy_facts {
  derived_table: {
    sql_trigger_value: select count(*) ;;
    sql:
      select dataset_code
      , date
      , value as start_value
      , lag(value) OVER( partition by dataset_code order by date asc) as last_year_start_value
      from
      (
        select *,
        rank() over (partition by dataset_code, EXTRACT(YEAR FROM CAST(date AS TIMESTAMP)) ORDER BY date asc) as row_number
        from DATABLOCKS.finance.FRED_data
      )
      where dataset_code in ('GDP', 'GDPC1', 'GDPPOT','CPIAUCSL', 'CPILFESL', 'GDPDEF', 'BASE','M1', 'M2', 'M1V', 'M2V', 'DFF','DTB3','DGS5','DGS10','DGS30','T5YIE','T10YIE','T5YIFR','TEDRATE','DPRIME', 'UNRATE','NROU','NROUST','CIVPART','EMRATIO','UNEMPLOY','PAYEMS','MANEMP','ICSA','IC4WSA', 'MEHOINUSA672N','DSPIC96','PCE','PCEDG','PSAVERT','RRSFS','DSPI', 'INDPRO','TCU','HOUST','GPDI','CP','STLFSI','DCOILWTICO','USSLIND','DTWEXM','DTWEXB', 'GFDEBTN','GFDEGDQ188S','EXCSRESNW','TOTCI')
      and row_number = 1
      order by date asc
    ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql:  concat(${dataset_code}, CAST(${TABLE}.date AS STRING)) ;;
  }

  dimension: dataset_code {
    label: "Indicator ID"
    type: string
    sql: ${TABLE}.dataset_code ;;
  }

  dimension_group: indicator {
    type: time
    timeframes: [date, month, quarter, year]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  measure: start_value {
    type: sum
    sql: ${TABLE}.start_value ;;
  }

  measure: last_year_start_value {
    type: sum
    sql: ${TABLE}.last_year_start_value ;;
  }

  measure: indicator_growth_yoy {
    type: number
    value_format_name: percent_2
    sql: ((${start_value}-${last_year_start_value})/NULLIF(${last_year_start_value}, 0)) ;;
  }

  set: detail {
    fields: [dataset_code, indicator_date, start_value, last_year_start_value]
  }
}
