class QuestionsController < ApplicationController

  def index
    @questions = Question.all.sort { |a, b| b.updated_at <=> a.updated_at}
  end

  def new
  end

  def show
  end
  
end
