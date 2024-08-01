resource "newrelic_alert_policy" "test-tt1" {
  name = "raj"
  incident_preference = "PER_CONDITION"
}

resource "newrelic_nrql_alert_condition" "foo123" {
  for_each = var.rj_conditions
  account_id                     = 4439970
  policy_id                      = newrelic_alert_policy.test-tt1.id
  type                           = each.value.type
  name                           = each.value.name
  # description                    = "Alert when transactions are taking too long"
  # runbook_url                  = "https://www.example.com"
  enabled                        = true
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = each.value.slide_by

  # baseline type only
  baseline_direction = "upper_only"

  nrql {

     query = each.value.query

  }

  critical {
    operator              = "above"
    threshold             = each.value.thresholdC
    threshold_duration    = each.value.threshold_durationC
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = each.value.thresholdW
    threshold_duration    = each.value.threshold_durationW
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_notification_destination" "foo" {
  account_id = "4439970"
  name = "email-example"
  type = "EMAIL"

  property {
    key = "email"
    value = "raj0572.be20@chitkara.edu.in"
  }
}

resource "newrelic_notification_channel" "foo1" {
  account_id = "4439970"
  name = "email-example"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.foo.id
  product = "IINT"

  property {
    key = "payload"
    value = "{}"
    label="Payload Template"
  }
}

resource "newrelic_workflow" "foo-workflow" {
  name = "workflow-example"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter-name"
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator = "EXACTLY_MATCHES"
      values = [ newrelic_alert_policy.test-tt1.id]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.foo1.id
  }
}



resource "newrelic_alert_muting_rule" "muting_rule" {
    name = "Example Muting Rule"
    enabled = true
    description = "muting rule test."
    condition {
      conditions {
            attribute   = "accountId"
            operator    = "EQUALS"
            values      = ["APM"]
        }
        # conditions {
        #     attribute   = "targetId"
        #     operator    = "EQUALS"
        #     values      = ["Muted"]
        # }
      operator = "AND"
    }
    schedule {
      start_time = "2024-08-01T15:30:00"
      end_time = "2024-08-01T16:30:00"
      time_zone = "Asia/Kolkata"
      repeat = "WEEKLY"
      weekly_repeat_days = ["THURSDAY"]
      repeat_count = 42
    }
}