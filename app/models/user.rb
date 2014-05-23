class User < ActiveRecord::Base
  
  validates :full_name, :location, presence: true
  
  validates :email,     presence: true, 
                        format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, 
                        uniqueness: true                   
                        
  validates_length_of :bio, minimum: 30, 
                            allow_blank: false
  
  has_secure_password
end
