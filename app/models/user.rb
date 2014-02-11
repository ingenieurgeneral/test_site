class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	has_many :authored_decks, class_name: 'Deck', foreign_key: 'author_id', dependent: :destroy
	has_many :deckrelationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_decks, through: :deckrelationships, source: :followed_deck

	has_many :cardrelationships, dependent: :destroy
	has_many :lessons, -> { where("cardrelationships.card_type = 'lesson'") }, through: :cardrelationships, foreign_key: "card_id"  
	has_many :flashcards, -> { where("cardrelationships.card_type = 'flashcard'") }, through: :cardrelationships, foreign_key: "card_id"
	has_many :questionnaires, -> { where("cardrelationships.card_type = 'questionnaire'") }, through: :cardrelationships, foreign_key: "card_id"  

	before_save { self.email = email.downcase }
	validates :first_name, length: { maximum: 50 }
	validates :last_name, length: { maximum: 50}
	validates :language, presence: true, inclusion: { in: Conf.langs }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true, format:     { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	def following?(some_deck)
		deckrelationships.find_by(followed_deck_id: some_deck.id)
	end

	def follow!(some_deck)
		myrel = deckrelationships.create!(followed_deck_id: some_deck.id)
		myrel.followed_deck.lessons.each do |card|
			cardrelationships.create!(card_id: card.id) do |c|
				c.score = 0
			end
		end
		myrel.followed_deck.flashcards.each do |card|
			cardrelationships.create!(card_id: card.id) do |c|
				c.score = 0
			end
		end
		myrel.followed_deck.questionnaires.each do |card|
			cardrelationships.create!(card_id: card.id) do |c|
				c.score = 0
			end
		end
	end

	def unfollow!(some_deck)
		deckrelationships.find_by(followed_deck_id: some_deck.id).destroy!
	end

	def fullname
		"#{first_name} #{last_name}"
	end
end
