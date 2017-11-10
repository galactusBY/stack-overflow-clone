class AnswersController < ApplicationController

  def create
    user = User.find(session[:user_id])
    if request.xhr?
      @answer = Answer.new(description: params[:answer])
      @question = Question.find_by(id: params[:question_id])
      if @answer.valid?
        @answer.save
        user.answers << @answer
        @question.answers << @answer
      end

      render :_show, :layout => false

    else
      @answer = Answer.new(description: params[:answer])
      @question = Question.find_by(id: params[:question_id])
      if @answer.valid?
        @answer.save
        user.answers << @answer
        @question.answers << @answer
      end
      redirect "/questions/#{@question.id}"
    end
  end

end
