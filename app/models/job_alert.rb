class JobAlert < ActiveRecord::Base
  # validates :email, presence: true, length: {maximum: 40}, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :email, length: {maximum: 40}, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  #validates :freqency, presence: true, length: {maximum: 40} 
  validates :freqency, length: {maximum: 40} 
  # validates :job_relate_title, presence: true, length: {maximum: 40} 
  validates :job_relate_title, length: {maximum: 40} 
end
