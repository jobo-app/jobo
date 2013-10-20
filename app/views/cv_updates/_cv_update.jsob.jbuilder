json.extract! cv_update, :id, :description, :asset
json.relative_created_at distance_of_time_in_words_to_now(cv_update.created_at) + " ago"
json.absolute_created_at cv_update.created_at.to_s(:short)
