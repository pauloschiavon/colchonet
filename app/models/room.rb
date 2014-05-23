class Room < ActiveRecord::Base
  
  validates :title, :location, :description, presence: true
  
  validates_length_of :description, minimum: 30, 
                      allow_blank: false
  
  def complete_name
    "#{title}, #{location}"
  end
end
