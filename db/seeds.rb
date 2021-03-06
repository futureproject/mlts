# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
change_agents = ChangeAgent.create([
  {name: 'John Smith', title: 'Change', location: 'Chicago', link: 'https://www.youtube.com/channel/UCnkPlILzmiAkaTjgdOmeBSg', quote: 'Pellentesque consequat sit amet sapien vel pretium. Vivamus in lobortis mi. Praesent tincidunt pulvinar felis, eu pellentesque justo finibus gravida. Sed a arcu est. Pellentesque egestas tristique mi, vel iaculis velit. Morbi a lobortis est. '},
  {name: 'Anne MLTS', title: 'Agent', location: 'New York', link: 'https://www.youtube.com/channel/UCnkPlILzmiAkaTjgdOmeBSg', quote: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quam nulla, vestibulum sed ante et, vulputate consectetur ante. Sed in ipsum ante. Ut sodales volutpat dictum. Nam iaculis nulla a accumsan tristique. Mauris molestie consequat odio.'},
  {name: 'Most Likely', title: 'Quarterback', location: 'Chicago', link: 'https://www.youtube.com/channel/UCnkPlILzmiAkaTjgdOmeBSg', quote: 'Integer condimentum augue ut lectus hendrerit scelerisque. Vivamus purus tortor, bibendum sed egestas sodales, ultrices eu mauris. Praesent ac porttitor sem, eu interdum ex. Nulla facilisi. Duis id tincidunt ipsum, a ullamcorper magna. '},
  {name: 'Josh MLTS', title: 'Evangelist', location: 'Hawaii', link: 'https://www.youtube.com/channel/UCnkPlILzmiAkaTjgdOmeBSg', quote: 'Integer condimentum augue ut lectus hendrerit scelerisque. Vivamus purus tortor, bibendum sed egestas sodales, ultrices eu mauris. Praesent ac porttitor sem, eu interdum ex. Nulla facilisi. Duis id tincidunt ipsum, a ullamcorper magna. Donec tortor quam.'},
  {name: 'John Smith', title: 'Changemaker', location: 'Los Angeles', link: 'https://www.youtube.com/channel/UCnkPlILzmiAkaTjgdOmeBSg', quote: 'Pellentesque consequat sit amet sapien vel pretium. Vivamus in lobortis mi. Praesent tincidunt pulvinar felis, eu pellentesque justo finibus gravida. Sed a arcu est.'}
])
