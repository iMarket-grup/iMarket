class IthinksController < ApplicationController
  before_action :authenticate_user!
  def index
    @arr = ['fa-clock', 'fa-comments', 'fa-user', 'fa-camera', 'fa-video','fa-city','fa-slash','fa-star']
    @now = Time.now
    @ithink = Ithink.new 
    @ithinks = Ithink.all
    @colour = "%06x" % (rand * 0xffffff)
  end
  def create
    ithink  = Ithink.create!(ithink_params)
    redirect_to ithinks_path
  end
  def show
    @ithink = Ithink.find(params[:id])
  end

  def ithink_params
    params.require(:ithink).permit(:name, :surname, :content)
  end
end
