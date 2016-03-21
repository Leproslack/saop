json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer_rate, :answer_comment
  json.url answer_url(answer, format: :json)
end
