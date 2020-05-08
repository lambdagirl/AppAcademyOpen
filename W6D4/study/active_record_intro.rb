##### Model classes and ActiveRecord::Base
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

# app/models/physician.rb
class Physician < ApplicationRecord
end



# ::find and ::all
# physicians table
Physician.all 
# lookup the Physician with primary key (id) 101
Physician.find(101)



# ::where queries
Physician.where('home_city = ?', "La Jolla")
# WHERE Rails = Magic
Physician.where(
  home_city:'La Jolla'
)
Physician.where(college: ['City College', 'Columbia', 'NYU'])
Physician.where(years_experience:(3..9))

######Updating and inserting rows

jonas = Physician.new

# set some fields
jonas.name = 'Jonas Salk'
jonas.college = 'City College'
jonas.home_city = 'La Jolla'

# save the record to the database
jonas.save!

 #save! will warn you if you fail to save the object
 #save will quietly return false (it returns true on success).

 #To save some steps of #save!, we can use #create! to create a new record and immediately save it to the db

 Physician.create!(
  jonas.name = 'Jonas Salk'
  jonas.college = 'City College'
  jonas.home_city = 'La Jolla'
 )


 #####Destroying Data
# destroy a record from the table
 physician.destory


######The Rails consoles
#will re-load all the model classes.
reload! 

rails console
rails c
rails dbconsole #access SQL console
