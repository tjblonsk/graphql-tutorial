class CreateActorsMovies < ActiveRecord::Migration
  def change
    create_table :actors_movies do |t|
      t.belongs_to :actor, index: true
      t.belongs_to :movie, index: true
    end
  end
end
