json.array!(@jobs) do |job|
  json.extract! job, :company_name, :position_title, :communications
  json.url job_url(job, format: :json)
end
