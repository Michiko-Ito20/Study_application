class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet.id
    comment.save
    redirect_to tweet_path(tweet.id)
  end

  private
    def comment_params 
  #def destroy
      params.require(:comment).permit(:body)
    end
end
