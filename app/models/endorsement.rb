class Endorsement < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  belongs_to :alumni
end
