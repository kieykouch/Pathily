class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :capitalize_names

  def capitalize_names
    self.first_name = first_name.camelcase
    self.last_name = last_name.camelcase
  end
end
