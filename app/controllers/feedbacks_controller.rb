class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])

    if @feedback.save
      redirect_to new_feedback_path, :notice => 'Thank you. Your message was successfully sent!'
    else
      render :new
    end
  end
end
