# In essence this monkey patch forces AR to use the same database
# connection in all the threads.
# This is needed in feature specs because the server and the spec
# run at different threads. Without this patch, there would be no
# way to interact with the database within a spec.

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
