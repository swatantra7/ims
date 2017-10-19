class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.timestamps
    end
    add_attachment :documents, :document_list
  end
end
