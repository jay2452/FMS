class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   def self.import(file)
     spreadsheet = open_spreadsheet(file)   # => defined in ApplicationRecord.rb file
     header = spreadsheet.row 1
     (2..spreadsheet.last_row).each do |i|
       row = Hash[[header, spreadsheet.row(i)].transpose]
       # if row["code"].empty? == false
         # subject = find_by_code(row["code"])
       # else
       search_user = User.find_by_email(row["roll"].to_s + "@ksom.ac.in")
      if search_user == nil
        search_user = User.new
        search_user.name = row["name"]
        search_user.roll = row["roll"]
        search_user.email = row["roll"].to_s + "@ksom.ac.in"
        search_user.password = "123456789"
        search_user.save!
      end

      if search_user != nil
        search_user.name = row["name"]
        search_user.roll = row["roll"]
        search_user.email = row["roll"].to_s + "@ksom.ac.in"
        search_user.password = "123456789"
        search_user.save!
      end # => end of if
    end # => end of do
  end # => end of def
end # => end of class
