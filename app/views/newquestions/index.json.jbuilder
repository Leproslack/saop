json.array!(@newquestions) do |newquestion|
  json.extract! newquestion, :id, :new_question_name, :newcategory_id
  json.url newquestion_url(newquestion, newcategoryat: :json)
end
