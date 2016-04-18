class FactoidsController < ApplicationController
  include HTTParty

  def show
    @fact = Adapters::FactoidClient.grab_fact
    render :json => @fact
  end

end
