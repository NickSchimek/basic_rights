class AdminToolsController < ApplicationController
  def show
    authorize :AdminTool
  end
end
