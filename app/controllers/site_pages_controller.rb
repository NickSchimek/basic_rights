class SitePagesController < ApplicationController
  def home
    @needs = Need.all.where(active: true).order(:resource).includes(:organization)
    @surplus = Surplu.all.where(active: true).order(:resource).includes(:organization)
  end

  def about
  end

  def contact
  end
end
