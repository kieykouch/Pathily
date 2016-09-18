# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook, :linkedin, :google_oauth2]


  before_save :capitalize_names
  before_save :remove_password_confirmation

  def capitalize_names
    self.first_name = first_name.camelcase
    self.last_name = last_name.camelcase
  end

  def remove_password_confirmation
	self.password_confirmation = password	
  end

  def self.from_omniauth(auth)
      
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.password_confirmation = user.password
      end
  end
  
  def self.from_omniauth_facebook(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.first_name = auth.info.name.split(" ")[0]
          user.last_name = auth.info.name.split(" ")[1]
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.password_confirmation = user.password
      end
  end
  
  def self.from_omniauth_gmail(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.password_confirmation = user.password
      end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new (session["devise.user_attributes"]) do |user|
          user.attributes = params
          user.valid?
      end
    else
        super
    end

  end

  def password_required?
      super && provider.blank?
  end

end
