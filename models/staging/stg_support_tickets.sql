select
    ticket_id,
    account_id,
    submitted_at as submission_date,
    closed_at as resolution_date,
    resolution_time_hours,
    priority,
    first_response_time_minutes,
    round(first_response_time_minutes/60, 2) as first_response_time_hours,
    satisfaction_score,
    escalation_flag
from {{ source('ravenstack', 'support_tickets') }}