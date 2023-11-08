<!-- As a developer, you are tasked with creating a new Rails application called favorite-movies to store data for your cohort. The application will start with just the structure of the database with a model called Movie. The Movie model will have an attribute for title that is a string. -->

<!-- rails generate model Movie title:string  -->

<!-- # As a developer, I can add a category to the Movie model called category that is a string.

class AddCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :category, :string
  end
end

# As a developer, I can add a category to the Movie model called rating that is a string.

class AddRating < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :rating, :string
  end
end


# As a developer, I can add a category to the Movie model called run_time that is a number.

class AddRunTime < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :run_time, :integer
  end
end


# As a developer, I can add five entries to the database via the Rails console.

Movie.create category:'horror', title:'the conjuring', rating:'B', 
run_time:2 

Movie.create category:'comedy', title:'scary movie', rating:'A', ru
n_time:2 

Movie.create category:'romance', title:'the titanic', rating:'A', r
un_time:4 

Movie.create category:'sci-fi', title:'end game', rating:'A', run_t
ime:3 

 Movie.create category:'action', title:'taken', rating:'B', run_time
:2 


# As a developer, I can update the run_time column to be a string.

rails generate migration update_run_time_to_string

class UpdateRunTimeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :run_time, :string
  end
end

rails db:migrate


# As a developer, I can update the values of the five existing database entries to include a unit of time on the run_time column. (Example: '165 minutes' or '1 hr, 45 minutes')

the_conjering = Movie.find(1)
the_conjering.update run_time:'1 hr, 52 min'

scary_movie = Movie.find(2)
scary_movie.update run_time:'1hr, 28min'

the_titanic = Movie.find(3)
the_titanic.update run_time:'3hr, 14min'

 end_game = Movie.find(4)
 end_game.update run_time:'3hr, 2min'

 taken = Movie.find(5)
 taken.update run_time:'1hr, 33min'

# As a developer, I can rename the column category to be named genre. -->

<!-- rails generate migration rename_category_to_genre -->

<!-- class RenameCategoryToGenre < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :category, :genre
  end
end -->