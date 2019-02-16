include: "snowflake.*.view*"

explore: sf_financial_indicators {
  view_label: "Indicator"
  join: sf_indicators_metadata_codes {
    view_label: "Indicator Details"
    type: left_outer
    sql_on: ${sf_financial_indicators.dataset_code} = ${sf_indicators_metadata_codes.dataset_code} ;;
    relationship: one_to_one
  }
  join: sf_indicators_metadata {
    view_label: "Indicator Details"
    type: left_outer
    sql_on: ${sf_financial_indicators.dataset_code} = ${sf_indicators_metadata.dataset_code} ;;
    relationship: many_to_one
  }

  join: sf_indicator_yoy_facts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sf_indicator_yoy_facts.dataset_code} = ${sf_financial_indicators.dataset_code}
      and ${sf_financial_indicators.indicator_year} = ${sf_indicator_yoy_facts.indicator_year}  ;;
  }
}
