class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :index
  end

  def new
    render :new
  end

  def create
    @question = Question.new(title: params[:title], description: params[:question])
    user = User.find(session[:user_id])
    if @question.valid?
      @question.save
      user.questions << @question
    end
    redirect :index
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answers  = @question.answers
    @answers = @answers.sort do |a, b|
      (b.votes.reduce(0) { |sum, vote| sum += vote.shaka }) <=> (a.votes.reduce(0) {|sum, vote| sum += vote.shaka })
    end
    @comments = @question.comments
    render :show
  end

end
