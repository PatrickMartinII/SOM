json.extract! question, :id, :content, :question_type, :quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
