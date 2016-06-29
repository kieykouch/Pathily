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

require 'test_helper'

class JobAlertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
