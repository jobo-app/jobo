json.extract! job_update, :id, :description, :type
json.asset_url job_update.asset.url if job_update.asset.present?
json.relative_created_at distance_of_time_in_words_to_now(job_update.created_at) + " ago"
json.absolute_created_at job_update.created_at.to_s(:short)
