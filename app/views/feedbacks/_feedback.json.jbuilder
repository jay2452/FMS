json.extract! feedback, :id, :criteria, :rating, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)