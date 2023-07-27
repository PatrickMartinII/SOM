class QuizSubmissionsController < ApplicationController
  before_action :find_quiz_submission, only: [:show, :create]

  def create
    @quiz = Quiz.find(params[:quiz_id])
    user_answers = {}
    correct_answers = 0

    params.each do |key, value|
      if key.start_with?('question_')
        question_id = key.split('_').last.to_i
        selected_answer = value.to_i
        user_answers[question_id.to_s] = selected_answer
        question = Question.find(question_id)

        if question.correct_answer == selected_answer
          correct_answers += 1
        end
      end
    end

    score = (correct_answers.to_f / @quiz.questions.count) * 100
    quiz_submission = QuizSubmission.create(
      quiz: @quiz
      user: current_user
      score: score,
      user_answers: user_answers
    )

    redirect_to quiz_submission_path(@quiz, quiz_submission)
  end

  def show
    @quiz = @quiz_submission.quiz
  end

  private

  def find_quiz_submission
    @quiz_submission = QuizSubmission.find(params[:id])
  end

  def quiz_submission_params
    params.require(:quiz_submission).permit(:quiz_id, :user_id, :score, user_answers: {})
  end
end
