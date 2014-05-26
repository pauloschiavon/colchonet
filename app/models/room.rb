class Room < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  
  scope :most_recent, -> { order('created_at DESC') }
  
  validates :title, :location, :description, presence: true
  
  validates_length_of :description, minimum: 30, 
                      allow_blank: false
  
  def complete_name
    "#{title}, #{location}"
  end
end
