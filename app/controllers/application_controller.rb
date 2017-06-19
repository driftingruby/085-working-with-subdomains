class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_subdomain

  def current_blog
    @current_blog ||= Blog.find_by(subdomain: request.subdomain)
  end
  helper_method :current_blog

  private

  def ensure_subdomain
    redirect_to root_url(subdomain: :www) unless current_blog.present?
  end
end
