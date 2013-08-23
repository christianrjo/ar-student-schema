require_relative '../../db/config'

class Student < ActiveRecord::Base


  validates :email, uniqueness: true, format: { with: /\A\w+[\.|\w*]*@.*\.{1}\w{2,}[\.\w{2,}]?/ }

  validates :age, numericality: {:greater_than_or_equal_to => 5}

  validates :phone, format: { with: /\A\(?\d{3}\)?(|\s|\-)?\d{3}(\-|\s)?\d{4}((\s)?x\d{4})?/ }

  def name

    first_name + " " + last_name

  end

  def age

    now = Date.today

    age = now.year - birthday.year -  ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)

    age
  end
end
