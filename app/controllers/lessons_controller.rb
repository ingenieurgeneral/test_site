class LessonsController < ApplicationController
	before_action :set_deck
	before_action :set_lesson, only: [:show, :edit, :update, :destroy]

	def index
		@lessons = @deck.lessons.order(:created_at).page(params[:page])
	end

	def new
		@lesson = @deck.lessons.new
	end

	def create
		@lesson = @deck.lessons.new lesson_params
		if @lesson.save
			redirect_to my_deck_lessons_path(@deck), notice: 'Lesson was successfully created'
		else
			render :new
		end
	end

	private
	def set_deck
	@deck = current_user.authored_decks.find params[:deck_id]
	end

	def set_lesson
	@lesson = @deck.lessons.find params[:id]
	end

	def lesson_params
	params[:lesson].permit(:body)
	end
end
