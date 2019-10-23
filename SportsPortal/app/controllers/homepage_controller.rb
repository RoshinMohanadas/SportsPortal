class HomepageController < ApplicationController
  def home
    @eventgroups=Eventgroup.all

    @matches=Match.all

    @results=Match.all
  end

  def about
   # @eventgroups=Eventgroup.all

    @matches=Match.all

    @results=Match.all
  end

  def gallery
    #@events=Event.all
    #@eventgroups=Eventgroup.all
    @images=Image.all
  end
end
