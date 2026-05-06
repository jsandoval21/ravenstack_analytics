with account_info as (
    select account_id,
        account_name,
        industry,
        country,
        signup_date,
        referral_source,
    from {{ ref('stg_accounts') }}
),

subscriptions as (
    select subscription_id,
        account_id,
        start_date,
        end_date,
        plan_tier,
        seats,
        monthly_recurring_revenue,
        annual_recurring_revenue,
        rank() over (partition by account_id order by start_date desc) as subscription_rank
    from {{ ref('stg_subscriptions') }}
),

churn_events as (
    select account_id,
        sum(refund_amount_usd) as total_refund_amount
    from {{ ref('stg_churn_events') }}
    group by account_id
)

select ar.account_id,
    ar.account_name,
    ar.industry,
    ar.country,
    ar.signup_date,
    ar.referral_source,
    s.plan_tier,
    s.monthly_recurring_revenue,
    s.annual_recurring_revenue,
    coalesce(ce.total_refund_amount, 0) as total_refund_amount
from account_info ar
left join subscriptions s using (account_id)
left join churn_events ce on ar.account_id = ce.account_id and s.subscription_rank = 1
