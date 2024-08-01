rj_conditions = {
  "0" = {
    account_id=4439970
    type="static"
    name = "foo12"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM SystemSample SELECT average(cpuPercent) WHERE `entityName` = 'LAPTOP-E7LT54DH'"
    thresholdC=5
    threshold_durationC=300
    thresholdW                     = 3
    threshold_durationW            = 600
    
  }



  "1" = {
    account_id=4439970
    type="static"
    name = "foo1"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM NetworkSample SELECT average(transmitBytesPerSecond) WHERE `entityName` = 'LAPTOP-E7LT54DH'"
    thresholdC=300
    threshold_durationC=300
    thresholdW                     = 400
    threshold_durationW            = 600
    
    
  }

  "2" = {
    account_id=4439970
    type="static"
    name = "foo123"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM SystemSample SELECT average(memoryUsedPercent) WHERE `entityName` = 'LAPTOP-E7LT54DH'"
    thresholdC=73
    threshold_durationC=300
    thresholdW                     = 74
    threshold_durationW            = 600
    
    
  }


    "3" = {
    account_id=4439970
    type="static"
    name = "web-transactions"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM Metric SELECT sum(apm.service.overview.web * 1000) WHERE appName='Relicstraunts'"
    thresholdC=500
    threshold_durationC=300
    thresholdW                     = 1000
    threshold_durationW            = 600
    
    
  }

  "4" = {
    account_id=4439970
    type="static"
    name = "apdex_score"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM Metric SELECT apdex(apm.service.apdex) WHERE appName='Relicstraunts'"
    thresholdC=0.15
    threshold_durationC=300
    thresholdW                     = 0.25
    threshold_durationW            = 600
    
    
  }

  "5" = {
    account_id=4439970
    type="static"
    name = "throughput_alert"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM Metric SELECT rate(count(apm.service.transaction.duration), 1 minute) WHERE appName='Relicstraunts'"
    thresholdC=5
    threshold_durationC=300
    thresholdW                     = 10
    threshold_durationW            = 600
    
    
  }

    "5" = {
    account_id=4439970
    type="static"
    name = "throughput_alert"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM Metric SELECT rate(count(apm.service.transaction.duration), 1 minute) WHERE appName='Relicstraunts'"
    thresholdC=5
    threshold_durationC=300
    thresholdW                     = 10
    threshold_durationW            = 600
    
    
  }

    "6" = {
    account_id=4439970
    type="static"
    name = "slowest_lcp"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM PageViewTiming SELECT percentile(largestContentfulPaint, 75) WHERE appName='frontend-browser'"
    thresholdC=5
    threshold_durationC=300
    thresholdW                     = 10
    threshold_durationW            = 600
    
    
  }

    "7" = {
    account_id=4439970
    type="static"
    name = "longest_inp"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM PageViewTiming SELECT percentile(interactionToNextPaint, 75) WHERE appName='frontend-browser'"
    thresholdC=0.2
    threshold_durationC=300
    thresholdW                     = 0.8
    threshold_durationW            = 600
    
    
  }

    "8" = {
    account_id=4439970
    type="baseline"
    name = "pageview_load_time"
    violation_time_limit_seconds=3600
    fill_option="static"
    fill_value= 1.0
    aggregation_window=60
    aggregation_method="event_flow"
    aggregation_delay=120
    expiration_duration=120
    slide_by=30
    query = "FROM PageView SELECT average(queueDuration) WHERE appName='frontend-browser'"
    thresholdC=1.2
    threshold_durationC=300
    thresholdW                     = 1.5
    threshold_durationW            = 600
    
    
  }
}


