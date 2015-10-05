class DesiredSkill < ActiveRecord::Base
  belongs_to :employer
  belongs_to :skill
end
