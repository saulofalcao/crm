module ActiveAdmin::ViewHelpers

	def tarefas_vencidas?
		!tarefas_vencidas.nil?
	end

	def tarefas_vencidas
		@tarefas_vencidas=Tarefa.where("vencimento < ? ", Date.today )
		return nil unless @tarefas_vencidas
	end

	def tarefas_recentes
		@tarefas_recentes=Tarefa.order("vencimento").limit(5)
	end
end