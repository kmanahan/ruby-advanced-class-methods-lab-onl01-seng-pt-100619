require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song 
    song
  end 
  

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    
    if self.find_by_name(name)
        self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end 

  def self.alphabetical
    self.all.sort_by {|song| song.name} 
  end
 
  def self.new_from_filename(data)
    # binding.pry
    row = data.split(" - ")
    
    singer = row[0]
    song = row[1]
    
    new = self.new
    new.artist_name = singer
    new.name = song.split(".")[0]
    new
  end
  
end
# #  def self.new_from_csv(csv_data)
#     # Split the CSV data into an array of individual rows.
#     rows = csv_data.split("\n")
#     # For each row, let's collect a Person instance based on the data
#     people = rows.collect do |row|
#       # Split the row into 3 parts, name, age, company, at the ", "
#       data = row.split(", ")
#       name = data[0]
#       age = data[1]
#       company = data[2]
 
#       # Make a new instance
#       person = self.new # self refers to the Person class. This is Person.new
#       # Set the properties on the person.
#       person.name = name
#       person.age = age
#       person.company = company
#       # Return the person to collect
#       person
#     end
#     # Return the array of newly created people.
#     people
#   end
# end
 
# csv_data = "Elon Musk, 45, Tesla
# Mark Zuckerberg, 32, Facebook
# Martha Stewart, 74, MSL"
 
# people = Person.new_from_csv(csv_data)
# people #=> [
#   #<Person @name="Elon Musk"...>,
#   #<Person @name="Mark Zuckerberg"...>,
#   # ...
# # ]
 
# new_csv_data = "Avi Flombaum, 31, Flatiron School
# Payal Kadakia, 30, ClassPass"
 
# people << Person.new_from_csv(new_csv_data)
# people.flatten
# people #=> [
# #<Person @name="Elon Musk"...>,
# #<Person @name="Mark Zuckerberg"...>
# #<Person @name="Martha Stewart"...>,
# #<Person @name="Avi Flombaum"...>,
# #<Person @name="Payal Kadakia"...>
# # ]
