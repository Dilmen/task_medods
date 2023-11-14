class CreateConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :consultation_requests do |t|
      t.string :patient_id
      t.text :text_query

      t.timestamps
    end
  end
end
