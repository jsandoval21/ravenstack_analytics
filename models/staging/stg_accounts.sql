select 
    ACCOUNT_ID,
    ACCOUNT_NAME,
    INDUSTRY,
    COUNTRY,
    SIGNUP_DATE,
    REFERRAL_SOURCE,
    PLAN_TIER,
    IS_TRIAL,
    CHURN_FLAG
from {{ source('ravenstack', 'accounts') }}
where ACCOUNT_ID is not null