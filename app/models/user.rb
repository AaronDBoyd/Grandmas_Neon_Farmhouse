class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
# end

  validate :password_complexity
  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[a-z])(?=.*?[0-9]).{6,20}$/

    errors.add :password, 'Complexity requirement not met. Length should be 6-20 characters and include: 1 lowercase and 1 digit'
  end
end