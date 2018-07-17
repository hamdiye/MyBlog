class PostsController < ApplicationController

  def index
    @post = Post.order('id desc').limit(8)

  end

  def new
    @post= Post.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end



  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end




def show
  @post= Post.find(params[:id])

end

def edit
  @post= Post.find(params[:id])

end



def update
  @post= Post.find(params[:id])

  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'

  end

end

def destroy
  @post= Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

  private
  def post_params
    params.require(:post).permit(:title,:content, :category_id)

  end
end
