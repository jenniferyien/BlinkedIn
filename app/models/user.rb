class User < ActiveRecord::Base
  has_many :endorsements
  mount_uploader :avatar, AvatarUploader
end
