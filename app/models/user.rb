class User < ActiveRecord::Base
  has_one :person, :dependent => destroy
end
