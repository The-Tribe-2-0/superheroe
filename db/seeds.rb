puts 'Seeding...'

# Clear existing data
HeroPower.delete_all
Power.delete_all
Hero.delete_all

# Create powers
power1 = Power.create(name: "Super Strength", description: "Ability to exhibit extraordinary physical strength")
power2 = Power.create(name: "Flight", description: "Ability to fly or levitate")
power3 = Power.create(name: "Telekinesis", description: "Ability to move objects with the mind")

# Create heroes
hero1 = Hero.create(name: "Bruce Wayne", super_name: "Batman")
hero2 = Hero.create(name: "Clark Kent", super_name: "Superman")
hero3 = Hero.create(name: "Diana Prince", super_name: "Wonder Woman")

# Assign powers to heroes
HeroPower.create(hero_id: hero1.id, power_id: power1.id, strength: "Strong")
HeroPower.create(hero_id: hero2.id, power_id: power1.id, strength: "Strong")
HeroPower.create(hero_id: hero2.id, power_id: power2.id, strength: "Weak")
HeroPower.create(hero_id: hero3.id, power_id: power3.id, strength: "Average")

puts "Seeds file executed successfully!"