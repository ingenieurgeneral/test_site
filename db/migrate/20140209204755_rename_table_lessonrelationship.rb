class RenameTableLessonrelationship < ActiveRecord::Migration
	def up
		rename_table :lessonrelationships, :cardrelationships
	end
	def down
		rename_table :cardrelationships, :lessonrelationships
	end
end
