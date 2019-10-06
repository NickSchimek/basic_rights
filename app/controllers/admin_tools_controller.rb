class AdminToolsController < ApplicationController
  def show
    @organization = Organization.new
    authorize :AdminTool
  end
end
