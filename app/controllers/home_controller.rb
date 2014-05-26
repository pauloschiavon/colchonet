class HomeController < ApplicationController
  def index
    @rooms = Room.take(3).map do |room|
      RoomPresenter.new(room, self, false)
    end
  end
end