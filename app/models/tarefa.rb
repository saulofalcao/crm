# == Schema Information
#
# Table name: tarefas
#
#  id             :integer         not null, primary key
#  vencimento     :datetime
#  titulo         :string(255)
#  tarefavel_id   :integer
#  tarefavel_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  tarefas        :string(255)
#  cliente_id     :integer
#

class Tarefa < ActiveRecord::Base
	# belongs_to :tarefavel, polymorphic: true
	belongs_to :cliente
	# after_touch :depois

	
	# def depois
	# 	self.vencimento = vencimento.strftime("%d-%m-%Y")
	# end
end
