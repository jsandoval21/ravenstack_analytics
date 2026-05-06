select 
    account_id as "Account ID",
    account_name as "Account Name",
    industry as "Industry",
    country as "Country",
    signup_date as "Signup Date",
    referral_source as "Referral Source",
    start_date as "Subscription Start Date",
    plan_tier as "Plan Tier",
    monthly_recurring_revenue as "Monthly Recurring Revenue",
    annual_recurring_revenue as "Annual Recurring Revenue",
    total_refund_amount as "Total Refund Amount",
    (annual_recurring_revenue - total_refund_amount) as "Net Annual Revenue",
    round((annual_recurring_revenue - total_refund_amount) / 12, 2) as "Net Monthly Revenue"
from {{ ref('int_revenue') }}