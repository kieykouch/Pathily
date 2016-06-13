class CreateJobAlerts < ActiveRecord::Migration
  def change
    create_table :job_alerts do |t|
      t.string :email
      t.string :freqency
      t.string :job_relate_title
      t.timestamps null: false
    end
  end
end
