class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :destroy]
    before_action :authenticate_user!, only: [ :new, :edit, :create, :update, :destroy ]
    
    def index
    end
    
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        # @comment.memo = comment_params["memo"] # 123
        @comment.post_id = params[:post_id]
        #@comment.memo = params[:comment][:memo]
        respond_to do |format|
          if @comment.save
            format.html { redirect_to request.referrer, notice: 'Commnet was successfully created.' }
            format.json { render :referrer, status: :created, location: @comment }
          else
            @data = comment_params['memo']
            format.html { redirect_to request.referrer, notice: @data }
            format.json { render json: @commnet.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def destroy
       #@post = Post.find(params[:post_id])
       #@comments = @post.comments
       #@comment = @comments.find(params[:id])
       @comment.destroy
       
       redirect_to request.referrer
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
       @post = Post.find(params[:post_id])
       @comments = @post.comments
       @comment = @comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      # params.require(:comment).permit(:post_id, :memo) # {'memo' => '123'}
      params.require(:comment).permit(:memo) # {'memo' => '123'}
    end
end
