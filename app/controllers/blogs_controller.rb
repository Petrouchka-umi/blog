class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(3)
    if params[:tag_name]
      @blogs = Blog.tagged_with("#{params[:tag_name]}")
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    # @parent = @blog.category
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    binding.pry
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

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
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

  # DELETE /blogs/1
  # DELETE /blogs/1.json
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :image, :category_id, :tag_list).merge(user_id: current_user.admin)
    end
end
