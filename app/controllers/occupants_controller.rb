class OccupantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @occupants = User.all
  end
end
