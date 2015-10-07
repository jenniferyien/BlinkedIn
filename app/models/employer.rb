class Employer < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :desired_skills
  mount_uploader :avatar, AvatarUploader
end
