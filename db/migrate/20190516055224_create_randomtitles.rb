class CreateRandomtitles < ActiveRecord::Migration[5.2]
  def change
    create_table :randomtitles do |t|
      t.string :title

      t.timestamps
    end
  end
end
