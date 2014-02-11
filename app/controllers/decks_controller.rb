class DecksController < ApplicationController
	def new
		@deck = current_user.authored_decks.new
		@deck.language = current_user.language
	end

	def create
		@deck = current_user.authored_decks.new(deck_params)
		if @deck.save
			redirect_to new_deck_lesson_path(@deck)
			#redirect_to new_deck_card_path(@deck), notice: 'Deck successfully created.'
		else
			render action: 'new'
		end
	end

	def edit
	end

	def update
		if @deck.update(deck_params)
			redirect_to @deck, notice: 'Deck was successfully updated.'
		else
			render action: 'edit'
		end
	end

	def index
		@search = current_user.authored_decks.search params[:q]
		@decks = @search.result
	end
private
	def deck_params
		if !current_user.admin?
			params.require(:deck).permit(:title, :description, :rating, :price, :language, :country, :level, :subject, :chapter, :difficulty)
		else
			params.require(:deck).permit(:title, :description, :rating, :price, :language, :country, :level, :subject, :chapter, :difficulty, :is_published, :is_featured)
		end
	end
end
