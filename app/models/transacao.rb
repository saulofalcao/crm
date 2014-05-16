# == Schema Information
#
# Table name: transacaos
#
#  id         :integer         not null, primary key
#  valor      :float
#  nome       :string(255)
#  descricao  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Transacao < ActiveRecord::Base
end
