include: "snowflake.*.view.lkml"

datagroup: default {
  max_cache_age: "48 hours"
  sql_trigger: select count(*) from exchangerate.forex_real ;;
}

explore: forex {
  from: sf_forex_historical_real {}
  persist_with: default
  label: "Exchange Rates"
}
