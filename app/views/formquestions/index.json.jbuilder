json.array!(@formquestions) do |formquestion|
  json.extract! formquestion, :id, :question_build, :formbuilder_id
  json.url formquestion_url(formquestion, format: :json)
end
