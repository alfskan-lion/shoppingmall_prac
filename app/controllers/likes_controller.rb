class LikesController < ApplicationController
    before_action :authenticate_user!, only: [ :toggle_like]
    def toggle_like
        # post = Post.find(params[:id])
        # like = Like.new
        liked = Like.find_by(user_id: current_user.id, post_id: params[:id])
        if liked.nil?
            #Like.create(user_id: current_user.id, post_id: params[:id])
            temp = params[:id]
            like = Like.new
            like.post_id = params[:id]
            like.user_id = current_user.id
            like.save
        else
            liked.destroy
        end
        redirect_to request.referrer
    end
end
