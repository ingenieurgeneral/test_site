class RenameLessonToCardId < ActiveRecord::Migration
	def up
		rename_column :cardrelationships, :lesson_id, :card_id
	end
	def down
		rename_column :cardrelationships, :card_id, :lesson_id
	end
end
