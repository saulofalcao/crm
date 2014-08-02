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

require 'spec_helper'

describe Tarefa do
  pending "add some examples to (or delete) #{__FILE__}"
end
