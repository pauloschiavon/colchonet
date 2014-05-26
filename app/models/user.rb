class User < ActiveRecord::Base
  
  scope :confirmed, -> { where.not(confirmed_at: nil) }
  
  validates :full_name, :location, presence: true
  
  validates :email,     presence: true, 
                        format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, 
                        uniqueness: true                   
                        
  validates_length_of :bio, minimum: 30, 
                            allow_blank: false
  
  has_secure_password
  
  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end
  
  def confirm!
    return if confirmed?
    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end
  
  def confirmed?
    confirmed_at.present?
  end

  def self.authenticate(email, password)
    confirmed.
      find_by(email: email).
      try(:authenticate, password)
  end
end
