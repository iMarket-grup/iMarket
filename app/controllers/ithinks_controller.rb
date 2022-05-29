class IthinksController < ApplicationController
  def index
    @arr = ['fa-clock', 'fa-comments', 'fa-user', 'fa-camera', 'fa-video','fa-city','fa-slash','fa-star']

    @ithink = Ithink.new 
    @ithinks = Ithink.all
    @colour = "%06x" % (rand * 0xffffff)
  end
  def create
    ithink  = Ithink.create!(ithink_params)
    redirect_to ithinks_path
  end

  def ithink_params
    params.require(:ithink).permit(:name, :surname, :content)
  end
end
