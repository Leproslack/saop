json.array!(@formquestions) do |formquestion|
  json.extract! formquestion, :id, :question_name, :form_id
  json.url formquestion_url(formquestion, format: :json)
end
