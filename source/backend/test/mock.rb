User.all.map(&:delete)

Technology.new(name: "ruby", approved: true).save
Technology.new(name: "rails", approved: true).save
Technology.new(name: "python", approved: true).save
Technology.new(name: "django", approved: true).save

mario = Codemonkey.new(username: "mario", password: "password", email: "mario@example.com")
mario.first_name = "Mario"
mario.last_name = "Rossi"
mario.bio = "I'm a codemonkey"
mario.technologies = [Technology.find_by(name: "ruby"), Technology.find_by(name: "rails")]
mario.save

giuseppe = Codemonkey.new(username: "giuseppe", password: "password", email: "giuseppe@example.com")
giuseppe.first_name = "Giuseppe"
giuseppe.last_name = "Verdi"
mario.bio = "I'm a codemonkey too"
giuseppe.technologies = [Technology.find_by(name: "python"), Technology.find_by(name: "django")]
giuseppe.save

google = Company.new(username: "google", password: "password", email: "google@example.com")
google.save
apple = Company.new(username: "apple", password: "password", email: "apple@example.com")
apple.save
microsoft = Company.new(username: "microsoft", password: "password", email: "microsoft@example.com")
microsoft.save
