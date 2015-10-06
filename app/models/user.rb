class User < ActiveRecord::Base
  has_many :endorsements

  mount_uploader :avatar, AvatarUploader


  # def full_name
  #       "#{first_name} #{last_name}"
  #
  # end

end
