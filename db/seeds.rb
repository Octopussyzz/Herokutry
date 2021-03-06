User.destroy_all
Gossip.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('gossips')

50.times do |i|
	user = User.create!(
    first_name: Faker::Superhero.prefix,
    last_name: Faker::BackToTheFuture.character,
    username: Faker::DragonBall.character,
    email: Faker::Internet.email,
    age: rand(12..120),
    city: Faker::StarWars.planet,
    description: Faker::StrangerThings.quote)
  print '.'
end
puts '=== User DB created ==='

50.times do |j|
	gossip = Gossip.create!(
    user_id: User.all.sample.id,
    title: Faker::Pokemon.move,
    content: Faker::StarWars.wookiee_sentence)
	print '.'
end
puts '=== Gossip DB created ==='
