class OccupantsController < ApplicationController
  def index
    @occupants = User.all
  end
end
