class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :pomodoro_length, :rest_length, :password, :password_confirmation, :remember_me
  has_many :pomodorass

  def username
    "#{first_name} #{last_name}".blank? ? email : "#{first_name} #{last_name}"
  end

end
