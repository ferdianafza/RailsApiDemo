class User < ApplicationRecord
  # paginates_per 5

  has_many :posts

  validates :name, presence: true

  has_one_attached :avatar

  before_create -> {self.token = (generate_token)}

  private

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({token: token})
    end
  end
end
