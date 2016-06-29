class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :capitalize_names
  before_save :remove_password_confirmation

  def capitalize_names
    self.first_name = first_name.camelcase
    self.last_name = last_name.camelcase
  end

  def remove_password_confirmation
	self.password_confirmation = password	
  end
end
