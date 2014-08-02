class Tarefa < ActiveRecord::Base
	# belongs_to :tarefavel, polymorphic: true
	belongs_to :cliente
end
