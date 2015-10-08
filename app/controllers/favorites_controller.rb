class Favorite < ActiveRecord::Base
  after_create :send_favorite_emails

    private

  def send_favorite_emails
    user.favorites.each do |favorite|
      EmployerMailer.initial_contact(favorite.user, self).deliver_now
    end
  end
end
