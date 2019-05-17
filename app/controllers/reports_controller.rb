class ReportsController < ApplicationController
  def index
  end

  def show
    @pvs = Pv.all
  end
end
