# == Schema Information
#
# Table name: oportunidades
#
#  id              :integer         not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  cliente_id      :integer
#  tipo_servico_id :integer
#  ativa           :
#

class Oportunidade < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # def self.garantias_vencidas
  	# primeiro devemos pegar os clientes que tem garantias vencidas
  	# Cliente.find
  # end

  # def self.todas
  # 	Cliente.find_each do |cliente|

  # 	end

  # 	end
  # end
  # 
  validates_uniqueness_of :tipo_servico_id, scope: :cliente_id

  belongs_to  :cliente
  belongs_to  :tipo_servico

  scope :ativas, where(ativa: true)
  scope :inativas, where(ativa: false)
  
  # default_scope where(ativa: true)

  def self.encontra_servicos_futuros(cliente)
    # Cliente.find_each do |cliente|
      garantias_vencidas = []
      Servico.garantias_vencidas(cliente)
      # tipos_servicos = []
      # garantias_vencidas.each do |s|
        # puts s.tipo_servico_executados

        # .each do |tipo_servico_executado|
          # tipo_servico = tipo_servico_executado.tipo_servico
          # tipos_servicos << tipo_servico unless tipos_servicos.include?(tipo_servico)
        # end
      # end

      # servicos_futuros = cliente.servicos.find_each("data_execucao >= ?",Date.today)
    # end
  return garantias_vencidas

  end


end
