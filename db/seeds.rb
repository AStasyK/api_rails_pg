# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.delete_all
Company.reset_pk_sequence #with gem reset sequence
Company.create!(
    [
        {name: 'Microsoft', location: 'Silicon Valley'},
        {name: 'Yandex', location: 'Russia'}
    ]
)

Job.delete_all
Job.reset_pk_sequence #with gem reset sequence
Job.create!(
    [
        {name: 'Financial Manager', place: 'Finance', company_id: 1},
        {name: 'Product Manager', place: 'IT', company_id: 1},
        {name: 'Programmer', place: 'IT', company_id: 2},
        {name: 'Front-end developer', place: 'IT', company_id: 2}
    ]
)