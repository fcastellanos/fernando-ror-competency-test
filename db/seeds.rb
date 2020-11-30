# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(
    first_name: 'John',
    last_name: 'Admin',
    email: 'john@admins.com',
    password: 'letme1n',
    password_confirmation: 'letme1n',
    roles: 'admin'
)

editor = User.create(
    first_name: 'Herman',
    last_name: 'Editor',
    email: 'herman@editor.com',
    password: 'letme1n',
    password_confirmation: 'letme1n',
    roles: 'editor'
)

editor2 = User.create(
    first_name: 'John',
    last_name: 'Doe',
    email: 'john@editor.com',
    password: 'letme1n',
    password_confirmation: 'letme1n',
    roles: 'editor'
)

user = User.create(
    first_name: 'Ulices',
    last_name: 'User',
    email: 'ulices@user.com',
    password: 'letme1n',
    password_confirmation: 'letme1n'
)

articles = Article.create([
    {
        category: 'ruby',
        title: 'Intro',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor
    },
    {
        category: 'ruby',
        title: 'Data Types',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor
    },
    {
        category: 'ruby',
        title: 'Flow Control',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor
    },
    {
        category: 'ruby',
        title: 'Intermediate',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor
    },
    {
        category: 'rails',
        title: 'Intro',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor
    },
    {
        category: 'rails',
        title: 'Active Record',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor2
    },
    {
        category: 'rails',
        title: 'Routing',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor2
    },
    {
        category: 'rails',
        title: 'Intermediate',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor2
    },
    {
        category: 'serverless',
        title: 'Intro',
        content: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
        user: editor2
    },
])
