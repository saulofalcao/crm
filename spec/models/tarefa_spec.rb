# == Schema Information
#
# Table name: tarefas
#
#  id         :integer         not null, primary key
#  vencimento :datetime
#  titulo     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  cliente_id :integer
#

require 'spec_helper'

describe Tarefa do
  pending "add some examples to (or delete) #{__FILE__}"
end
