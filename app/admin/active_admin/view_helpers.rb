module ActiveAdmin::ViewHelpers

	def tarefas_vencidas?
		!tarefas_vencidas.nil?
	end

	def tarefas_vencidas
		@tarefas_vencidas=Tarefa.where("vencimento < ? ", Date.today )
		return nil unless @tarefas_vencidas
	end
end