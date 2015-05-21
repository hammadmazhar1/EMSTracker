# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	User.create(username: "usaidm", password: "usaidm", password_confirmation: "usaidm", phoneno: "0900786001", rollno: "16110032", name: "Usaid Mandvia", gender: "Male", mfr: true)
	User.create(username: "hammadm", password: "hammadm", password_confirmation: "hammadm", phoneno: "03331310724", rollno: "16100032", name: "Hammad Mazhar", gender: "Male", mfr: true)
	User.create(username: "maham", password: "maham", password_confirmation: "maham", phoneno: "0900078601", rollno: "16100020", name: "Maha Munawar" , gender: "Female", mfr: true)
	User.create(username: "ash", password: "ash", password_confirmation: "ash", phoneno: "1234567890", rollno: "16100001", name: "Ash Ketchum" , gender: "Male", mfr: false)
	Location.create(user_name: "1", gps_latitude: "31.4718", gps_longitude: "74.4110", location: "SSE")