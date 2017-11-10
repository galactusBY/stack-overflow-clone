class VotesController < ApplicationController

  def create
    question_id = params[:question_id]
    if session[:user_id]
      user_id = session[:user_id]
      ### voting on answers
      if params[:answer_id]
        if request.xhr?
          content_type "application/json"
          answer_id = params[:answer_id]
          vote = Vote.find_or_create_by(user_id: user_id, voteable_id: answer_id, voteable_type: params[:voteable_type])
          vote.update(shaka: params[:shaka].to_i)
          Answer.find(answer_id).votes.reduce(0) {|sum, vote| sum += vote.shaka }.to_json
        else
          answer_id = params[:answer_id]
          vote = Vote.find_or_create_by(user_id: user_id, voteable_id: answer_id, voteable_type: params[:voteable_type])
          vote.update(shaka: params[:shaka].to_i)
          redirect "/questions/#{question_id}"
        end
      else
        ### voting on questions
        if request.xhr?
          content_type "application/json"
          vote = Vote.find_or_create_by(user_id: user_id, voteable_id: question_id, voteable_type: params[:voteable_type])
          vote.update(shaka: params[:shaka].to_i)
          Question.find(question_id).votes.reduce(0) {|sum, vote| sum += vote.shaka }.to_json
        else
          vote = Vote.find_or_create_by(user_id: user_id, voteable_id: question_id, voteable_type: params[:voteable_type])
          vote.update(shaka: params[:shaka].to_i)
          redirect "/questions/#{question_id}"
        end
      end
    end
  end

end
