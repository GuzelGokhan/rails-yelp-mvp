class ReviewsController < ApplicationController
    before_action :set_restaurant
    def new
       @review = @restaurant.reviews.build
    end

   def create
       @review = Review.new(review_params)
       @review.restaurant = @restaurant
       if @review.save
         flash[:success] = "Object successfully created"
         redirect_to restaurant_path(@restaurant)
       else
         flash[:error] = "Something went wrong"
         render 'new'
       end
   end
   

    private

    def set_restaurant
       @restaurant = Restaurant.find(params[:restaurant_id])
    end
    
    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
