SELECT 
    subscription_id,
    account_id,
    start_date,
    end_date,
    plan_tier,
    seats,
    mrr_amount as monthly_recurring_revenue,
    arr_amount as annual_recurring_revenue,
    is_trial,
    upgrade_flag,
    downgrade_flag,
    churn_flag,
    billing_frequency,
    auto_renew_flag
FROM  {{ source('ravenstack', 'subscriptions') }}
