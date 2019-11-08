class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string :job_title
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :country
      t.string :city
      t.string :address
      t.string :postal_code
      t.string :driving_license
      t.string :nationality
      t.string :place_of_birth
      t.string :date_of_birth
      t.text :professional_summary

      t.timestamps
    end
  end
end
