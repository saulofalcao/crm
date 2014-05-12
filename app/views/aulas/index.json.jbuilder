json.array!(@aulas) do |aula|
  json.extract! aula, :titulo, :descricao, :professor_id, :horario
  json.url aula_url(aula, format: :json)
end