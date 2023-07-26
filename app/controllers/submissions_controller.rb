class SubmissionsController < ApplicationController
  before_action :find_submission, only: [:show, :create]

  def create
    @quiz = Quiz.find(params[:quiz_id])
    user_answers = {}
    correct_answers = 0

    params.each do |key, value|
      if key.start_with?('question_')
        question_id = key.split('_').last.to_i
        selected_answer = value.to_i
        user_answers[question_id.to.s] = selected_answer
        question = Question.find(question_id)

        if question.correct_answer == selected_answer
          correct_answers += 1
        end
      end
    end

    score = (correct_answers.to_f / @quiz.questions.count) * 100
    submission = Submission.create(
      quiz: @quiz
      user: current_user
      score:
      user_answers:
      )
    redirect_to submission_path(@quiz, submission)
  end

  def show
    @quiz = @submission.quiz
  end

  private

  def find_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:quiz_id, :user_id, :score, user_answers: {})
  end
end
