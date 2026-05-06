select 
    usage_id,
    subscription_id,
    usage_date,
    feature_name,
    usage_count,
    usage_duration_secs,
    round(usage_duration_secs/60, 2) as usage_duration_mins,
    round(usage_duration_secs/3600, 2) as usage_duration_hours,
    error_count,
    is_beta_feature
from {{ source('ravenstack', 'feature_usage') }}