begin
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

  charlesbabbage = Codemonkey.new(username: "charlesbabbage", password: "password", email: "charlesbabbage@example.com")
  charlesbabbage.first_name = "Charles"
  charlesbabbage.last_name = "Babbage"
  charlesbabbage.bio = "I'm a codemonkey"
  charlesbabbage.technologies = [Technology.find_by(name: "ruby"), Technology.find_by(name: "rails")]
  charlesbabbage.save
  charlesbabbage.update_column(:propic, File.open(dir + "/assets/img/1.jpg", "rb").read)
  charlesbabbage.save

  georgeboole = Codemonkey.new(username: "georgeboole", password: "password", email: "georgeboole@example.com")
  georgeboole.first_name = "George"
  georgeboole.last_name = "Boole"
  georgeboole.bio = "I'm a codemonkey too"
  georgeboole.technologies = [Technology.find_by(name: "python"), Technology.find_by(name: "django"), Technology.find_by(name: "php"), Technology.find_by(name: "laravel"), Technology.find_by(name: "csharp")]
  georgeboole.save
  georgeboole.update_column(:propic, File.open(dir + "/assets/img/2.jpg", "rb").read)
  georgeboole.save

  alanturing = Codemonkey.new(username: "alanturing", password: "password", email: "alanturing@example.com")
  alanturing.first_name = "Alan"
  alanturing.last_name = "Turing"
  alanturing.bio = "I'm a codemonkey as well"
  alanturing.technologies = [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]
  alanturing.save
  alanturing.update_column(:propic, File.open(dir + "/assets/img/3.jpg", "rb").read)
  alanturing.save

  claudeshannon = Codemonkey.new(username: "claudeshannon", password: "password", email: "claudeshannon@example.com")
  claudeshannon.first_name = "Claude"
  claudeshannon.last_name = "Shannon"
  claudeshannon.bio = "I'm a codemonkey anyway"
  claudeshannon.technologies = [Technology.find_by(name: "javascript"), Technology.find_by(name: "vue"), Technology.find_by(name: "angular")]
  claudeshannon.save
  claudeshannon.update_column(:propic, File.open(dir + "/assets/img/4.jpg", "rb").read)
  claudeshannon.save

  johnvonneumann = Codemonkey.new(username: "johnvonneumann", password: "password", email: "johnvonneumann@example.com")
  johnvonneumann.first_name = "John"
  johnvonneumann.last_name = "Von Neumann"
  johnvonneumann.bio = "I'm a codemonkey nonetheless"
  johnvonneumann.technologies = [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]
  johnvonneumann.save
  johnvonneumann.update_column(:propic, File.open(dir + "/assets/img/5.jpg", "rb").read)
  johnvonneumann.save

  marvinminsky = Codemonkey.new(username: "marvinminsky", password: "password", email: "marvinminsky@example.com")
  marvinminsky.first_name = "Marvin"
  marvinminsky.last_name = "Minsky"
  marvinminsky.bio = "I'm a codemonkey at heart"
  marvinminsky.technologies = [Technology.find_by(name: "php"), Technology.find_by(name: "laravel"), Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]
  marvinminsky.save
  marvinminsky.update_column(:propic, File.open(dir + "/assets/img/6.jpg", "rb").read)
  marvinminsky.save

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
  project1 = google.new_project(codemonkey: charlesbabbage, title: "Progetto 1")
  project1.save
  google.edit_project(project: project1, new_description: "descrizione di progetto 1", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
  charlesbabbage.accept_project(project: project1).save

  #terminated
  project2 = google.new_project(codemonkey: georgeboole, title: "Progetto 2")
  project2.save
  google.edit_project(project: project2, new_description: "descrizione di progetto 2", new_technologies: [Technology.find_by(name: "php"), Technology.find_by(name: "laravel")]).save
  georgeboole.accept_project(project: project2).save
  google.terminate_project(project: project2, rating: 3.5, comment: "commento di progetto 2").save

  #accepted
  project3 = microsoft.new_project(codemonkey: georgeboole, title: "Progetto 3")
  project3.save
  microsoft.edit_project(project: project3, new_description: "descrizione di progetto 3", new_technologies: [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]).save
  georgeboole.accept_project(project: project3).save

  #rejected
  project4 = microsoft.new_project(codemonkey: alanturing, title: "Progetto 4")
  project4.save
  microsoft.edit_project(project: project4, new_description: "descrizione di progetto 4", new_technologies: [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]).save
  alanturing.reject_project(project: project4).save

  #suggested
  project5 = apple.new_project(codemonkey: alanturing, title: "Progetto 5")
  project5.save
  apple.edit_project(project: project5, new_description: "descrizione di progetto 5", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save

  #interrupted
  project6 = apple.new_project(codemonkey: claudeshannon, title: "Progetto 6")
  project6.save
  apple.edit_project(project: project6, new_description: "descrizione di progetto 6", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "vue")]).save
  claudeshannon.accept_project(project: project6).save
  claudeshannon.interrupt_project(project: project6, comment: "commento di progetto 6").save

  #terminated
  project7 = apple.new_project(codemonkey: johnvonneumann, title: "Progetto 7")
  project7.save
  apple.edit_project(project: project7, new_description: "descrizione di progetto 7", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
  johnvonneumann.accept_project(project: project7).save
  apple.terminate_project(project: project7, rating: 4, comment: "commento di progetto 7").save

  #terminated
  project8 = microsoft.new_project(codemonkey: johnvonneumann, title: "Progetto 8")
  project8.save
  microsoft.edit_project(project: project8, new_description: "descrizione di progetto 8", new_technologies: [Technology.find_by(name: "csharp"), Technology.find_by(name: "dotnet")]).save
  johnvonneumann.accept_project(project: project8).save
  microsoft.terminate_project(project: project8, rating: 3, comment: "commento di progetto 8").save

  #accepted
  project9 = google.new_project(codemonkey: johnvonneumann, title: "Progetto 9")
  project9.save
  google.edit_project(project: project9, new_description: "descrizione di progetto 9", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
  johnvonneumann.accept_project(project: project9).save

  #rejected
  project10 = google.new_project(codemonkey: johnvonneumann, title: "Progetto 10")
  project10.save
  google.edit_project(project: project10, new_description: "descrizione di progetto 10", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
  johnvonneumann.reject_project(project: project10).save

  #suggested
  project11 = google.new_project(codemonkey: johnvonneumann, title: "Progetto 11")
  project11.save
  google.edit_project(project: project11, new_description: "descrizione di progetto 11", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save

  #interrupted
  project12 = google.new_project(codemonkey: johnvonneumann, title: "Progetto 12")
  project12.save
  google.edit_project(project: project12, new_description: "descrizione di progetto 12", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
  johnvonneumann.accept_project(project: project12).save
  johnvonneumann.interrupt_project(project: project12, comment: "commento di progetto 12").save

  #terminated
  project13 = google.new_project(codemonkey: marvinminsky, title: "Progetto 13")
  project13.save
  google.edit_project(project: project13, new_description: "descrizione di progetto 13", new_technologies: [Technology.find_by(name: "javascript"), Technology.find_by(name: "react")]).save
  marvinminsky.accept_project(project: project13).save
  google.terminate_project(project: project13, rating: 4, comment: "commento di progetto 13").save
rescue => exception
  puts exception.message
end
