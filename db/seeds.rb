# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faculty.destroy_all
Faculty.create! emp_id: "", name: "Prof. Nimai Charan Swain"
Faculty.create! emp_id: "2616", name: "Prof. Bandana Dash"
Faculty.create! emp_id: "1148", name: "Prof. R.N Subudhi"
Faculty.create! emp_id: "3495", name: "Prof. Brajballav Kar"
Faculty.create! emp_id: "1528", name: "Prof. B.C.M Patnaik"
Faculty.create! emp_id: "228", name: "Prof. Ipseeta Satapathy"
Faculty.create! emp_id: "1236", name: "Prof. Jitendra Mohanty"
Faculty.create! emp_id: "2101", name: "Prof. J.R Hota"
Faculty.create! emp_id: "2238", name: "Prof. Ashutosh Kar"
Faculty.create! emp_id: "1749", name: "Prof. Arvind Tripathy"
Faculty.create! emp_id: "4493", name: "Prof. Ipsita Nayak"
Faculty.create! emp_id: "", name: "Prof. Shyam Sundar Rajaram"
Faculty.create! emp_id: "2495", name: "Prof. Surya Mishra"
Faculty.create! emp_id: "2856", name: "Prof. Kumar Mohanty"

Faculty.create! emp_id: "1198", name: "Prof. Ashok K Sar"
Faculty.create! emp_id: "2934", name: "Prof. Subrat Sarangi"
Faculty.create! emp_id: "1208", name: "Prof. Suvakanata Mohanty"
Faculty.create! emp_id: "3946", name: "Prof. Joydeep Biswas"
Faculty.create! emp_id: "", name: "Prof. Manoranjan Bhuyan"
Faculty.create! emp_id: "", name: "Prof. Lingaraj Mahapatra"
Faculty.create! emp_id: "2910", name: "Prof. Debi Prasad Das"
Faculty.create! emp_id: "2943", name: "Prof. Jogendra Behera"
Faculty.create! emp_id: "4014", name: "Prof. Saroj Routray"
Faculty.create! emp_id: "3341", name: "Prof. Sugato Tripathy"
Faculty.create! emp_id: "2935", name: "Prof. Sumita Mishra"
Faculty.create! emp_id: "1894", name: "Prof. P R Sahoo"
Faculty.create! emp_id: "1198", name: "Prof. Ashok K Sar"
Faculty.create! emp_id: "", name: "Prof. Mohar Banerjee Biswas"
Faculty.create! emp_id: "691", name: "Prof. Kaushik Sahu"
Faculty.create! emp_id: "4484", name: "Prof. Subhra Pattnaik"
Faculty.create! emp_id: "4480", name: "Prof. Manvinder Singh"
Faculty.create! emp_id: "4314", name: "Prof. Arun Patra"
Faculty.create! emp_id: "4014", name: "Prof. Shradha Padhi"
Faculty.create! emp_id: "4490", name: "Prof. Manoj Jena"

Program.destroy_all
Program.create! nane: "MBA"
Program.create! nane: "BBA"
Program.create! nane: "DMBA"


Semester.destroy_all
(1..6).each do |i|
  Semester.create! number: i
end


Section.destroy_all
('A'..'J').each { |chr| Section.create! name: chr }
