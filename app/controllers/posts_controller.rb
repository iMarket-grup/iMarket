
class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_admin?, except: [:index, :show]
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

    @comment = Comment.new
    @comments = @post.comments    
    @now = Time.now
    @rate= Rate.new

  end

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post Başarıyla Oluşturuldu"

      redirect_to admins_path
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :new
    end
  end
  def add_cart
    @post = Post.find(params[:id])

      current_user.current_cart.posts << @post

    redirect_to posts_path, notice: 'Ürün Sepete Eklendi'
  end
  
  
  def post_params
    params.require(:post).permit(:title, :content, :image, :cost, category_ids: [])
  end
  def is_admin?
    redirect_to(root_path) if current_user.user?
  end
end
