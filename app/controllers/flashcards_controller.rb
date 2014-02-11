class FlashcardsController < ApplicationController
	before_action :set_deck
	before_action :set_flashcard, only: [:show, :edit, :update, :destroy]

	def index
		@flashcards = @deck.flashcards.order(:created_at).page(params[:page])
	end

	def new
		@flashcard = @deck.flashcards.new
	end

	def create
		@flashcard = @deck.flashcards.new flashcard_params
		if @flashcard.save
			redirect_to my_deck_flashcards_path(@deck), notice: 'flashcard was successfully created'
		else
			render :new
		end
	end

	private
	def set_deck
	@deck = current_user.authored_decks.find params[:deck_id]
	end

	def set_flashcard
	@flashcard = @deck.flashcards.find params[:id]
	end

	def flashcard_params
	params[:flashcard].permit(:body)
	end
end
