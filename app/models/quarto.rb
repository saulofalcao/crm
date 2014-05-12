# == Schema Information
#
# Table name: quartos
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Quarto < ActiveRecord::Base
	has_many :reservas
	#self.joins(:reservas).where("? == start_date",start_date)
end
