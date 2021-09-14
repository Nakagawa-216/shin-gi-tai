# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {
      email: 'a@a',
      name: 'テスト太郎',
      password: '111111'
    },
    {
      email: 'b@b',
      name: 'テスト二郎',
      password: '111111'
    }
  ]
)

categories = Category.create!(
  [
    {
      name: 'meditation'
    },
    {
      name: 'stretching'
    },
    {
      name: 'work_out'
    }
  ]
)

activity_points = ActivityPoint.create!(
  [
    { 
      user_id: 1,
      category_id: 1,
      activity_point: 10
    },
    { 
      user_id: 1,
      category_id: 1,
      activity_point: 10
    },
    {
      user_id: 1,
      category_id: 2,
      activity_point: 10
    },
    {
      user_id: 1,
      category_id: 3,
      activity_point: 10
    }
  ]
)