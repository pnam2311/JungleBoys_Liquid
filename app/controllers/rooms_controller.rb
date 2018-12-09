class RoomsController < ApplicationController
    def index
        
    end
    
    def new
       @room = Room.new 
    end
    
    def create
        @room = Room.new(post_params)
        if @room.save
            redirect_to room_path(@room)
        else
            flash[:error] = "Can't create room."
        end
    end
    
    def show
        @room = Room.find(params[:id])
        @comments = @room.comments.order(id: :desc)
        @comment = Comment.new
        @rating = Rating.new
        @is_bookmarked = @room.is_bookmarked(current_user)
    end

    def edit
        @room = Room.find(params[:id])
    end

    def search
        @q = Room.ransack(params[:q])
      	@rooms = @q.result.page(params[:page]).per 12
    end
    
    def update
        @room = Room.find(params[:id])
        if @room.update(post_params)
            redirect_to room_path(@room)
            flash[:notice] = "Updated successfully." 
        else
            redirect_to edit_room_path(@room)
            flash[:error] = "Update error." 
        end
    end

    private
    
    def post_params
      params.required(:room).permit(:room_name, :user_id, :room_info, :province, :address, :cost_per_night,
                        :type_of_room, :num_of_bedrooms, :num_of_beds,
                        :num_of_guests, :num_of_baths, :amentities, {pictures: []}, 
                        :contact_host)
    end
    
    def get_params 
      params.permit(:room_name, :address, :cost_per_night,
                        :type_of_room)
    end

end
