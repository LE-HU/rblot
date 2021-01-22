module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: %i[edit update destroy]

    def index
      @posts = current_author.posts
    end

    def new
      @post = current_author.posts.build
    end

    def edit
      @paragraph = @post.elements.build(element_type: 'paragraph')
    end

    def create
      @post = current_author.posts.build(post_params)

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private

    def set_post
      @post = current_author.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end
  end
end
