# == Schema Information
#
# Table name: clientes
#
#  id          :integer         not null, primary key
#  nome        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  email       :string(255)
#  rua         :string(255)
#  bairro      :string(255)
#  cep         :string(255)
#  complemento :string(255)
#  observacao  :text
#  telefone    :string(255)
#

require 'spec_helper'

describe Cliente do
  pending "add some examples to (or delete) #{__FILE__}"
end
