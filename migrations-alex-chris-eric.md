🍿 Challenge: Favorite Movies

As a developer, you are tasked with creating a new Rails application called favorite-movies to store data for your cohort. The application will start with just the structure of the database with a model called Movie. The Movie model will have an attribute for title that is a string.


👩‍💻 Developer Tasks

As a developer, I can add a category to the Movie model called category that is a string.


<!-- rails g model Movie category:string  -->


As a developer, I can add a category to the Movie model called rating that is a string.

<!-- rails g migration add_column_to_movies_list

class AddColumnToMoviesList < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :rating, :string
  end
end

 rails db:migrate  -->


As a developer, I can add a category to the Movie model called run_time that is a number.

<!-- rails generate migration add_column_to_movie_list_runtime

class AddColumnToMovieListRuntime < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :runtime, :float
  end
end

rails db:migrate -->

As a developer, I can add five entries to the database via the Rails console.

<!-- 
rails c
Movie.find(1).update(title:"Jason-X")
Movie.find(2).update(title:"Marley & Me")
Movie.find(3).update(title:"Expendables")
Movie.create(category:"Anime", rating:"E", runtime:1.30, title:"One Piece")
Movie.create(category:"Action", rating:"E", runtime:2.00, title:"Spider-Man") 
Movie.all
-->


As a developer, I can update the run_time column to be a string.




As a developer, I can update the values of the five existing database entries to include a unit of time on the run_time column. (Example: '165 minutes' or '1 hr, 45 minutes')



As a developer, I can rename the column category to be named genre.