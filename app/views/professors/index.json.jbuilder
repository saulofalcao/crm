json.array!(@professors) do |professor|
  json.extract! professor, :nome
  json.url professor_url(professor, format: :json)
end