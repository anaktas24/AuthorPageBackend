# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
GuestbookEntry.create([
  { name: 'RetroFan', message: 'Love the 90s vibe!' },
  { name: 'PortalLad', message: 'Can’t wait for the book!' }
])

VisitorCount.create(count: 100)

Book.create(
  title: 'Through the Starlit Portal',
  description: 'A thrilling portal fantasy where Jet, Aria, and Kiyo uncover secrets in a magical world.',
  cover_url: 'https://via.placeholder.com/300x450',
  progress: 75
)