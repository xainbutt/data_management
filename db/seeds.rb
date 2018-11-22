# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  5.times do
    UserFile.create(first_name: 'Zain', last_name: 'Butt', program: 'program',
                  fee: 55, discount: 4, address: 'some address', ssn: 'test ssn', placement_date: Date.current.in_time_zone,
                  dob: Date.current.in_time_zone, payment_status_color: 'yellow')
  end