class QuestionnairesController < ApplicationController
	before_action :set_deck
	before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

	def index
		@questionnaires = @deck.questionnaires.order(:created_at).page(params[:page])
	end

	def new
		@questionnaire = @deck.questionnaires.new
	end

	def create
		@questionnaire = @deck.questionnaires.new questionnaire_params
		if @questionnaire.save
			redirect_to my_deck_questionnaires_path(@deck), notice: 'questionnaire was successfully created'
		else
			render :new
		end
	end

	private
	def set_deck
	@deck = current_user.authored_decks.find params[:deck_id]
	end

	def set_questionnaire
	@questionnaire = @deck.questionnaires.find params[:id]
	end

	def questionnaire_params
	params[:questionnaire].permit(:body)
	end
end
