class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @comment.rating.build
    end
    
    def create
        @comment = Comment.new(post_params)
        
        respond_to do |format|
            if @comment.save
                format.html { redirect_to @comment, notice: 'Comment được tạo thành công' }
                format.js   { }
            else
                format.html { render :new }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit 
        @comment = Comment.find(params[:id])
        respond_to do |format|
            
            format.js {}
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        respond_to do |format|
            if @comment.destroy
                format.html { redirect_to room_path(@comment.room_id) }
                format.js   { }
            end
        end
    end
    
    def update
        @comment = Comment.find(params[:id])
        # @comment.rating.update(params[:rating_attributes])

        respond_to do |format|
            if @comment.update(post_params)
                format.html { redirect_to room_path(@comment.room_id) }
                format.js   { }     
            end
        end
    end
    
    def cancel
        @comment = Comment.find(params[:id])
        respond_to do |format|
            format.js {}
        end
    end
    
    private
    def post_params
        params.require(:comment).permit(:room_id, :parent_id, :user_id, :text_content,
            rating_attributes: [:id, :room_id, :comment_id, :stars])
    end
    
end
