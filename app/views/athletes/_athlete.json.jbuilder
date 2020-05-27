json.extract! athlete, :id, :name, :age, :email, :coach_id, :program_id, :created_at, :updated_at
json.url athlete_url(athlete, format: :json)
