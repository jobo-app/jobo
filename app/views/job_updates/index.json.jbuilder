json.array!(@job_updates) do |job_update|
	json.partial! job_update
end
