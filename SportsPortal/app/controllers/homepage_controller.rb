class HomepageController < ApplicationController
  def home
    @eventgroups=Eventgroup.all

    @matches=Match.all

    @results=Match.all
  end
end
