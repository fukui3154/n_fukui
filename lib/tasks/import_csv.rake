namespace :import_csv do
  desc "CSVデータをインポートするタスク"
  task users: :environment do
    ImportCsv.import('db/csv_data/csv_data.csv')
  end
end
