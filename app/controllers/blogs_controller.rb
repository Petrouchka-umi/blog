class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: '記事が投稿されました' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: '記事が更新されました' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: '記事が削除されました' }
      format.json { head :no_content }
    end
  end

  def search
    @blogs = Blog.search(params[:title_key]).order("created_at DESC").page(params[:page]).per(10)
  end

  def tags
    if params[:tag_name]
      @blog_tags = Blog.tagged_with("#{params[:tag_name]}")
    else params[:tag]
      @blog_tags = Blog.tagged_with("#{params[:tag]}")
    end
  end

  def tag_list
    @tags = ActsAsTaggableOn::Tag.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :image, :category_id, :tag_list).merge(user_id: current_user.id)
    end
end
