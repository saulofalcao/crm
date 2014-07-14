# == Schema Information
#
# Table name: servicos
#
#  id         :integer         not null, primary key
#  tipo       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Servico < ActiveRecord::Base
end
