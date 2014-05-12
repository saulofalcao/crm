# == Schema Information
#
# Table name: reservas
#
#  id         :integer         not null, primary key
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#  quarto_id  :integer
#

class Reserva < ActiveRecord::Base
 # validate :uniqueness_of_date_range
  belongs_to :quarto
  validates :start_date, :end_date, presence: true
  #validates_date :start_date, :on_or_after => :today
  #validate :first_found_room
  #private
  # def first_found_room
  # 	errors.add("Sem quartos disponiveis") unless 
  # 		Quarto.joins(:reservas).where("? == start_date",
  # 						start_date).count != 0
  # 	end

  # private
  # def uniqueness_of_date_range
  # 	# if Reserva.where("? >= start_date AND ? <= end_date",
  # 	# 				start_date, start_date).count == 0
  #  #  	errors.add(:start_date, "is not available")
  #  #  elsif Reserva.where("? >= start_date AND ? <= end_date",
  #  #                  end_date, end_date).count == 0
  #  #  	errors.add(:end_date, "is not available")
  #  #  end

  # end
  # def self.available(start_dt, end_dt, des_type=0, limit=0, offset=0 )
  def self.available(start_date, end_date)
    ####################################################
    # given the parameters specified find all spaces not
    # already reserved that fit the spec
    # If start date of reservation is today make sure
    # the space is available.
    ####################################################

    conditions = "where "
    all_spaces = find_by_sql("SELECT * FROM quartos #{conditions}
            id NOT IN (SELECT quarto_id FROM reservas
            WHERE end_date > \'#{start_date}\'
            AND start_date < \'#{end_date}\') LIMIT 1")

  #   ActiveRecord::Base.logger.debug "des_type is #{des_type.to_i}"
  #   unless des_type.to_i == 0
  #     if start_dt == currentDate
  # conditions += "sitetype_id = #{des_type.to_i} and unavailable = 0 and "
  #     else
  # conditions += "sitetype_id = #{des_type.to_i} and "
  #     end
  #   else
  #     if start_dt == currentDate
  # conditions += "unavailable = 0 and "
  #     end
  #   end
  #   if limit > 0
  #     limit_cond = "limit #{limit}"
  #     if offset > 0
  # limit_cond += ", #{offset}"
  #     end
  #   end

    # all_spaces = find_by_sql("SELECT * FROM quartos #{conditions}
    #         id NOT IN (SELECT quarto_id FROM reservas
    #         WHERE archived = 0 
    #         AND enddate > \'#{start_dt}\'
    #         AND startdate < \'#{end_dt}\')
    #         ORDER BY position ASC ")

    
  end


end
