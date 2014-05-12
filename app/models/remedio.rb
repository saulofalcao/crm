# == Schema Information
#
# Table name: remedios
#
#  id         :integer         not null, primary key
#  descricao  :string(255)
#  quantidade :integer
#  created_at :datetime
#  updated_at :datetime
#

class Remedio < ActiveRecord::Base
end
