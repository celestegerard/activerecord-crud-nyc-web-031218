# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end
require  'pry'

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(title: "The Sting", release_date: 1973, director: "George Roy Hill", lead: "Paul Newman", in_theaters: false)
end

# args = { title: "The Room", release_date: 2003 }
# movie = can_be_created_in_a_block(args)
#
# expect(movie.title).to eq("The Room")
# expect(movie.release_date).to eq(2003)
# can_be_created_in_a_block()

# args = {
#   title: "Shrek",
# release_date: 1990
# # }
# can_be_created_in_a_block(args)


def can_be_created_in_a_block(args = {title: "Home Alone", release_date: 1990})
  # Movie.create(title: args[:title], release_date: args[:release_date])
  #   # binding.pry
  Movie.new do |m|
    m.title = args[:title]
    m.release_date = args[:release_date]
  end

end
# can_be_created_in_a_block({title: "The Room", release_date: 2003})
# binding.pry

def can_get_the_first_item_in_the_database
  Movie.first.title
end

def can_get_the_last_item_in_the_database
  Movie.last.title
end

def can_get_size_of_the_database
  Movie.all.length
end

def can_find_the_first_item_from_the_database_using_id
  Movie.first.title
end

def can_find_by_multiple_attributes
Movie.where({ title: "Title", release_date: 2000, director: "Me" }).flatten[0]
end

def can_find_using_where_clause_and_be_sorted
Movie.order(release_date: :desc).where(release_date: (2003..2018))
  # For this test return all movies released after 2002 and ordered by
  # release date descending
end

def can_be_found_updated_and_saved
  # Update the title "Awesome Flick" to "Even Awesomer Flick"
  Movie.create(title: "Awesome Flick")
  awesome_flick = Movie.find_by(title: "Awesome Flick")
  awesome_flick.update(title: "Even Awesomer Flick")
  awesome_flick.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  wat_movie = Movie.find_by(title: "Wat?")
  wat_movie.update(title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
    Movie.update_all(title: "A Movie")
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  kick = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  kick.destroy
end

def can_destroy_all_items_at_once
  kicko = 10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all
end
