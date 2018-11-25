class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, :with => :render_not_found

  private
  def render_not_found
    render_error_page_for(404)
  end

  def render_error_page_for(code)
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/#{code}.html", :status => code, :layout => false }
    end
  end
end
