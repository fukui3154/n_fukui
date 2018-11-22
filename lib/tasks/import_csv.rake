#1~6がraketaskのグループ分けをするためのもの　「名前空間」
require 'csv'
namespace :import_csv do
  #desc=rakeTaskの説明
  desc "CSVデータをインポートするタスク"
  #以下３行がTASKの名前
  task users: :environment do

    path = File.join Rails.root,"db/csv_data/csv_data.csv"

    list = []

    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row["name"],
        age: row["age"],
        address: row["address"]
        }
    end
      puts "インポート処理を開始".red

    begin
      User.transaction do
                  #createメソッドでデータベースにデータ保存　
                  #！マークがないとうまくいかなくてもエラーが出ない

        User.create!(list)
      end

       puts "インポート成功！".green
      #↓例外処理 = エラーが出ても途中で処理を止めない
      rescue => e
       puts "インポート失敗".red
      end
    #models > import_csv.rb との繋がり

  end
end
