class CreateSearchSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :search_suggestions, id: :uuid do |t|
      t.string :term, null: false, default: ""
      t.integer :popularity
      t.references :project, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :search_suggestions, :term
    add_index :search_suggestions, %i[project_id term], unique: true
  end
end
