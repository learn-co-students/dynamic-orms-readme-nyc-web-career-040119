require 'sqlite3'


DB = {:conn => SQLite3::Database.new("db/songs.db")}#creates the database
DB[:conn].execute("DROP TABLE IF EXISTS songs")#drops "songs" to avoid error

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

DB[:conn].execute(sql)#create songs table
DB[:conn].results_as_hash = true #when a SELECT statement is run, it returns a hash with column names as keys rather than an array
