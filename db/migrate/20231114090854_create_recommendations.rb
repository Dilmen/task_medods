class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.string :consultation_request_id
      t.text :text_recommendation

      t.timestamps
    end
  end
end
