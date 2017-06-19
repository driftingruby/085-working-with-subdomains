class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  skip_before_action :ensure_subdomain, only: [:new, :create]

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to root_path, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to root_path, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to root_url(subdomain: nil), notice: 'Blog was successfully destroyed.'
  end

  private
    def set_blog
      @blog = current_blog
    end

    def blog_params
      params.require(:blog).permit(:name, :subdomain)
    end
end
