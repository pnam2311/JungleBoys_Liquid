class RatingsController < ApplicationController
    def new
        @rating = Rating.new
    end
    
    def create
        @rating = Rating.new(post_params)
        # todo
        
        respond_to do |format|
            if @rating.save
                format.html { redirect_to @rating, notice: 'Rated successfully.' }
                format.js   { }
                format.json { render :show, status: :created, location: @rating }
            else
                format.html { render :new }
                format.json { render json: @rating.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        # @rating = Rating.find(:comment_id)
        @rating.update(post_params)
    end
    
    private
    
    def post_params
        params.require(:rating).permit(:id, :user_id, :comment_id, :room_id, :stars)
    end
end
