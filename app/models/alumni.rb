class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :projects
  has_many :endorsements

  accepts_nested_attributes_for :endorsements, :projects

  has_many :skills, through: :endorsements

  mount_uploader :avatar, AvatarUploader
<<<<<<< HEAD
  mount_uploader :resume, ResumeUploader
  accepts_nested_attributes_for :user
=======
>>>>>>> 989c5946df5e69d6156be5aa152037406aeb699b
end
