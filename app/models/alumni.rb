class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :projects
  has_many :endorsements

  mount_uploader :avatar, AvatarUploader

  accepts_nested_attributes_for :user

end
