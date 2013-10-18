class ActiveRecord::Base
  class_attribute :shared_connection

  def self.connection
    self.shared_connection || retrieve_connection
  end
end
