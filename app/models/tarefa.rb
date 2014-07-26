class Tarefa < ActiveRecord::Base
	belongs_to :tarefavel, polymorphic: true
end
