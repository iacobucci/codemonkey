Technology.new(name: "ruby", approved: true).save
Technology.new(name: "rails", approved: true).save
Technology.new(name: "python", approved: true).save
Technology.new(name: "django", approved: true).save
Technology.new(name: "csharp", approved: true).save
Technology.new(name: "dotnet", approved: true).save
Technology.new(name: "javascript", approved: true).save
Technology.new(name: "react", approved: true).save
Technology.new(name: "angular", approved: true).save
Technology.new(name: "vue", approved: true).save
Technology.new(name: "php", approved: true).save
Technology.new(name: "laravel", approved: true).save

Technology.new(name: "java", approved: false).save
Technology.new(name: "cane", approved: false).save
Technology.new(name: "casa", rejected: true).save

# get realpath of this file
path = File.realpath(__FILE__)
# get directory of this file
dir = File.dirname(path)

mario = Codemonkey.new(username: "mario", password: "password", email: "mario@example.com")
mario.first_name = "Mario"
mario.last_name = "Rossi"
mario.bio = "I'm a codemonkey"
mario.technologies = [Technology.find_by(name: "ruby"), Technology.find_by(name: "rails")]
mario.save
mario.update_column(:propic, File.open(dir + "/assets/img/1.jpg", "rb").read)
mario.save

giuseppe = Codemonkey.new(username: "giuseppe", password: "password", email: "giuseppe@example.com")
giuseppe.first_name = "Giuseppe"
giuseppe.last_name = "Verdi"
giuseppe.bio = "I'm a codemonkey too"
giuseppe.technologies = [Technology.find_by(name: "python"), Technology.find_by(name: "django"), Technology.find_by(name: "php"), Technology.find_by(name: "laravel"), Technology.find_by(name: "csharp")]
giuseppe.save
giuseppe.update_column(:propic, File.open(dir + "/assets/img/2.jpg", "rb").read)
giuseppe.save

rita = Codemonkey.new(username: "rita", password: "password", email: "rita@example.com")
rita.first_name = "Rita"
rita.last_name = "Bianchi"
rita.bio = "I'm a codemonkey as well"
rita.technologies = [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]
rita.save
rita.update_column(:propic, File.open(dir + "/assets/img/3.jpg", "rb").read)
rita.save

john = Codemonkey.new(username: "john", password: "password", email: "john@example.com")
john.first_name = "John"
john.last_name = "Doe"
john.bio = "I'm a codemonkey anyway"
john.technologies = [Technology.find_by(name: "javascript"), Technology.find_by(name: "vue"), Technology.find_by(name: "angular")]
john.save
john.update_column(:propic, File.open(dir + "/assets/img/4.jpg", "rb").read)
john.save

jane = Codemonkey.new(username: "jane", password: "password", email: "jane@example.com")
jane.first_name = "Jane"
jane.last_name = "Doe"
jane.bio = "I'm a codemonkey nonetheless"
jane.technologies = [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]
jane.save
jane.update_column(:propic, File.open(dir + "/assets/img/5.jpg", "rb").read)
jane.save

claire = Codemonkey.new(username: "claire", password: "password", email: "claire@example.com")
claire.first_name = "Claire"
claire.last_name = "Smith"
claire.bio = "I'm a codemonkey at heart"
claire.technologies = [Technology.find_by(name: "php"), Technology.find_by(name: "laravel"), Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]
claire.save
claire.update_column(:propic, File.open(dir + "/assets/img/6.jpg", "rb").read)
claire.save

google = Company.new(username: "google", password: "password", email: "google@example.com")
google.name = "Google"
google.bio = "We're a company"
google.technologies = [Technology.find_by(name: "javascript"), Technology.find_by(name: "angular"), Technology.find_by(name: "react"), Technology.find_by(name: "vue")]
google.save
google.update_column(:propic, File.open(dir + "/assets/img/7.jpg", "rb").read)
google.save

microsoft = Company.new(username: "microsoft", password: "password", email: "microsoft@example.com")
microsoft.name = "Microsoft"
microsoft.bio = "We're a company too"
microsoft.technologies = [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet"), Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]
microsoft.save
microsoft.update_column(:propic, File.open(dir + "/assets/img/8.jpg", "rb").read)
microsoft.save

apple = Company.new(username: "apple", password: "password", email: "apple@example.com")
apple.name = "Apple"
apple.bio = "We're a company as well"
apple.technologies = [Technology.find_by(name: "javascript"), Technology.find_by(name: "react"), Technology.find_by(name: "vue")]
apple.save
apple.update_column(:propic, File.open(dir + "/assets/img/9.jpg", "rb").read)
apple.save

admin1 = Admin.new(username: "admin1", password: "password", email: "admin1@example.com")
admin1.save

admin2 = Admin.new(username: "admin2", password: "password", email: "admin2@example.com")
admin2.save

#accepted
project1 = google.new_project(codemonkey: mario, title: "Progetto 1")
project1.save
google.edit_project(project: project1, new_description: "descrizione di progetto 1", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
mario.accept_project(project: project1).save

#terminated
project2 = google.new_project(codemonkey: giuseppe, title: "Progetto 2")
project2.save
google.edit_project(project: project2, new_description: "descrizione di progetto 2", new_technologies: [Technology.find_by(name: "php"), Technology.find_by(name: "laravel")]).save
giuseppe.accept_project(project: project2).save
google.terminate_project(project: project2, rating: 3.5, comment: "commento di progetto 2").save

#accepted
project3 = microsoft.new_project(codemonkey: giuseppe, title: "Progetto 3")
project3.save
microsoft.edit_project(project: project3, new_description: "descrizione di progetto 3", new_technologies: [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]).save
giuseppe.accept_project(project: project3).save

#rejected
project4 = microsoft.new_project(codemonkey: rita, title: "Progetto 4")
project4.save
microsoft.edit_project(project: project4, new_description: "descrizione di progetto 4", new_technologies: [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]).save
rita.reject_project(project: project4).save

#suggested
project5 = apple.new_project(codemonkey: rita, title: "Progetto 5")
project5.save
apple.edit_project(project: project5, new_description: "descrizione di progetto 5", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save

#interrupted
project6 = apple.new_project(codemonkey: john, title: "Progetto 6")
project6.save
apple.edit_project(project: project6, new_description: "descrizione di progetto 6", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "vue")]).save
john.accept_project(project: project6).save
john.interrupt_project(project: project6, comment: "commento di progetto 6").save

#terminated
project7 = apple.new_project(codemonkey: jane, title: "Progetto 7")
project7.save
apple.edit_project(project: project7, new_description: "descrizione di progetto 7", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
jane.accept_project(project: project7).save
apple.terminate_project(project: project7, rating: 4, comment: "commento di progetto 7").save

#terminated
project8 = microsoft.new_project(codemonkey: jane, title: "Progetto 8")
project8.save
microsoft.edit_project(project: project8, new_description: "descrizione di progetto 8", new_technologies: [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]).save
jane.accept_project(project: project8).save
microsoft.terminate_project(project: project8, rating: 3, comment: "commento di progetto 8").save

#accepted
project9 = google.new_project(codemonkey: jane, title: "Progetto 9")
project9.save
google.edit_project(project: project9, new_description: "descrizione di progetto 9", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
jane.accept_project(project: project9).save

#rejected
project10 = google.new_project(codemonkey: jane, title: "Progetto 10")
project10.save
google.edit_project(project: project10, new_description: "descrizione di progetto 10", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
jane.reject_project(project: project10).save

#suggested
project11 = google.new_project(codemonkey: jane, title: "Progetto 11")
project11.save
google.edit_project(project: project11, new_description: "descrizione di progetto 11", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save

#interrupted
project12 = google.new_project(codemonkey: jane, title: "Progetto 12")
project12.save
google.edit_project(project: project12, new_description: "descrizione di progetto 12", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
jane.accept_project(project: project12).save
jane.interrupt_project(project: project12, comment: "commento di progetto 12").save

#terminated
project13 = google.new_project(codemonkey: claire, title: "Progetto 13")
project13.save
google.edit_project(project: project13, new_description: "descrizione di progetto 13", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
claire.accept_project(project: project13).save
google.terminate_project(project: project13, rating: 4, comment: "commento di progetto 13").save
