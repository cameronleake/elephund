require 'delayed_job'

Delayed::Worker.backend = :active_record

# Delayed::Worker.max_attempts = 5
# Delayed::Worker.delay_jobs = !Rails.env.test?