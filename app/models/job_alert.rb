# == Schema Information
#
# Table name: job_alerts
#
#  id               :integer          not null, primary key
#  email            :string
#  freqency         :string
#  job_relate_title :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class JobAlert < ActiveRecord::Base
  # validates :email, presence: true, length: {maximum: 40}, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :email, length: {maximum: 40}, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  #validates :freqency, presence: true, length: {maximum: 40} 
  validates :freqency, length: {maximum: 40} 
  # validates :job_relate_title, presence: true, length: {maximum: 40} 
  validates :job_relate_title, length: {maximum: 40} 
end
