<!-- 🍿 Challenge: Favorite Movies
As a developer, you are tasked with creating a new Rails application called favorite-movies to store data for your cohort. The application will start with just the structure of the database with a model called Movie. The Movie model will have an attribute for title that is a string. -->
rails new favorite-movies -d postgresql -T
rails db:create
rails g model Movie title:string
rails db:migrate

<!-- 👩‍💻 Developer Tasks
As a developer, I can add a category to the Movie model called category that is a string. -->
rails g migration add_column_category_to_favorite_movies
    - add_column :movies, :category, :string

rails db:migrate

<!-- As a developer, I can add a category to the Movie model called rating that is a string. -->
rails g migration add_column_rating_to_favorite_movies
    - add_column :movies, :rating, :string

rails db:migrate

<!-- As a developer, I can add a category to the Movie model called run_time that is a number. -->
rails g migration add_column_run_time_to_favorite_movies
    - add_column :movies, :run_time, :integer

rails db:migrate

<!-- As a developer, I can add five entries to the database via the Rails console. -->
rails c

     Movie.create title: "Act of Valor", category: "War", rating: "R", r
un_time: 111
     Movie.create title: "Frozen", category: "Family", rating: "PG", run
_time: 102
    Movie.create title: "The Dark Knight", category: "Drama/Action", ra
ting: "PG-13", run_time: 152
    Movie.create title: "Five Nights at Freddy's", category: "Horror/Ad
aptation", rating: "PG-13", run_time: 110
    Movie.create title: "Barbie", category: "Comedy/Fantasy", rating: "
PG-13", run_time: 114

    exit

<!-- As a developer, I can update the run_time column to be a string. -->
rails g migration change_data_type_of_run_time_to_string
    - change_column :movies, :run_time, :string

rails db:migrate

<!-- As a developer, I can update the values of the five existing database entries to include a unit of time on the run_time column. (Example: '165 minutes' or '1 hr, 45 minutes') -->
rails c

    Movie.find(1).update run_time:"1 hr, 51 minutes"
    Movie.find(2).update run_time:"1 hr, 42 minutes"
    Movie.find(3).update run_time:"2 hr, 32 minutes"
    Movie.find(4).update run_time:"1 hr, 50 minutes"
    Movie.find(5).update run_time:"1 hr, 54 minutes"

    exit

<!-- As a developer, I can rename the column category to be named genre. -->
rails g migration change_name_of_category_to_genre
    - rename_column :movies, :category, :genre

rails db:migrate