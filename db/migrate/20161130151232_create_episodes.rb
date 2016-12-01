class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.references :podcast, foreign_key: true

      t.timestamps
    end
    add_foreign_key :episodes, :podcast
  end
end
