class GuestUser < ActiveRecord::Base
  def name
    "Guest"
  end
end
