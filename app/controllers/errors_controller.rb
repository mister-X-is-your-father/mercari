class ErrorsController < ApplicationController
  def not_found
    render 'errors/error_404'
  end
end