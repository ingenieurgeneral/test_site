class Lesson < ActiveRecord::Base
	belongs_to :deck
	has_many :lessonrelationships, dependent: :destroy
	has_many :learners, through: :cardrelationships, source: :user
	validates :deck_id, presence: true
	validates :content, presence: true
	validates :title, presence: true
end
