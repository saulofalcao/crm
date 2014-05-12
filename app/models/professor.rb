# == Schema Information
#
# Table name: professors
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Professor < ActiveRecord::Base
	has_many :aulas
end
