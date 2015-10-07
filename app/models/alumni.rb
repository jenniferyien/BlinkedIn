class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :projects
  has_many :endorsements
<<<<<<< HEAD
  accepts_nested_attributes_for :user, :endorsements
=======

  mount_uploader :avatar, AvatarUploader

  accepts_nested_attributes_for :user

>>>>>>> 1801c9f10a010777698f351d3287b0a2443aba3c
end
