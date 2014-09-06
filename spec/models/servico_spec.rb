# == Schema Information
#
# Table name: servicos
#
#  id              :integer         not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  valor_orcamento :float
#  cliente_id      :integer
#  observacao      :text
#  data_execucao   :date
#  data_garantia   :date
#

require 'spec_helper'

describe Servico do
  pending "add some examples to (or delete) #{__FILE__}"
end
