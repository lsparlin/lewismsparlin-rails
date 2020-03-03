class ErrorsController < ApplicationController

  def not_found 
    render :not_found, :status => 404
  end

end
