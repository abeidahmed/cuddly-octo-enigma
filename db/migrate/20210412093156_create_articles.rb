class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title, null: false, default: ""
      t.references :project, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
