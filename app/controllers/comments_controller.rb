class CommentsController < ApplicationController

  def new
    @answer = Answer.find(params[:answer_id])
    render :new
  end

  def create
    @comment = Comment.new(response: params[:comment])
    @question = Question.find_by(id: params[:question_id])
    user = User.find(session[:user_id])
    if @comment.valid?
      @comment.save
      user.comments << @comment
      @question.comments << @comment
    end
    redirect "/questions/#{@question.id}"
  end

end
