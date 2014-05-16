# == Schema Information
#
# Table name: aulas
#
#  id           :integer         not null, primary key
#  titulo       :string(255)
#  descricao    :text
#  professor_id :integer
#  horario      :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Aula < ActiveRecord::Base
	belongs_to :professor
end
