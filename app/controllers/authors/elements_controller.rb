module Authors
  class ElementsController < AuthorsController
    before_action :set_post # on all actions
    before_action :set_element, only: %i[update destroy]

    def create
      @element = @post.elements.build(element_params)

      notice = if @element.save
                 nil
               else
                 @element.errors.full_messages.join('. ') << '.'
               end

      redirect_to edit_post_path(@post), notice: notice
    end

    def update
      @element.update(element_params)
      redirect_to edit_post_path(@element.post)
    end

    def destroy
      @element.destroy
      redirect_to posts_url, notice: 'Element was successfully destroyed.'
    end

    private

    def set_post
      @post = current_author.posts.find(params[:post_id])
    end

    def set_element
      @element = Element.find(params[:id])
    end

    def element_params
      params.require(:element).permit(:element_type, :content)
    end
  end
end
