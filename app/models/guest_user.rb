# == Schema Information
#
# Table name: guest_users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class GuestUser < ActiveRecord::Base
  def name
    "Guest"
  end
end
