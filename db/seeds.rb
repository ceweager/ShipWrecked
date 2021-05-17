# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroying all database items'
Connect.destroy_all
Postthread.destroy_all
Relationship.destroy_all
Milestone.destroy_all
Goal.destroy_all
Character.destroy_all

puts 'done destroying. Now creating new seeds'

username = User.find(1)
character = Character.new(name: "Daga", age: 33, gender: "male", birthday: "12th June",
                 sexuality: "bisexual", positive: "funny", negative: "sneaky",
                 overview: "Daga reluctantly took over after the previous kingpin was killed in one of the raids by the Capital. It wasn't a position he particularly fancied taking up, but in the lack of any other candidates he fancied working for, it was natural for him to slide into that role as the existing officer. Currently, he's keeping it quiet to avoid too many disturbances. As long as it changes nothing, his flies don't need to know that he's now the top of the pyramid.",
                 personality: 
                 "Is the second eldest of a number of siblings from a hodgepodge of different parents. Because they were pretty poor, he developed a habit of compulsive theft from a young age.

                 When he was 16 he got kicked out of the hovel he lived in. Ended up stealing to help himself survive. Got in of eavesdropping and stealing business facts for cash. It progressed from there. 
                 
                 Actively enjoys being as annoying as possible to people and will go out of his way to antagonise or poke if he find a weak spot to dig at. Is fond of giving people nicknames. Generally speaking, the more obnoxious or stuck up someone is, the more fun he has in poking them. It's a sport.
                 
                  Eats a mass amount of sweets. Truly, it's amazing he's not bigger than he is. When not chewing on one sweet or another, he's slurping juice or chewing gum",
                  history: 
                  "Daga reluctantly took over after the previous kingpin was killed in one of the raids by the Capital. It wasn't a position he particularly fancied taking up, but in the lack of any other candidates he fancied working for, it was natural for him to slide into that role as the existing officer. Currently, he's keeping it quiet to avoid too many disturbances. As long as it changes nothing, his flies don't need to know that he's now the top of the pyramid.
                  As the new leader of the information division, Daga has an oversight over the key decisions and activities the group participates in, including negotiations and managing where his little flies go buzz around. He considers this one of the key responsibilities, as having people in the correct location can make or break their work. He has something of a hands off approach when it comes to some investigations, as he thinks it is important for his people to have flexibility to go after a good snippet when they smell one, but all key sales and exchanges run through him. People in information are encouraged to get the good stuff through commissioning, meaning they get paid more the more valuable their information is seen to be. While Daga is meant to also manage the finances and other admin tasks, he tends to hand those tasks down to his officer and gives them a review once complete, leaving him to focus more on the matter of business. Any dealings with the other divisions are to go through either him or his officer (once assigned). Often, money is of less interest to him than the other things they can supply.",
                  other:" Has terrible fashion sense. he normally wears brightly coloured hawaiian shirts paired with even gaudier jackets and dark shades. The orange hair was also his choice",
                  character_pic: "https://i.imgur.com/WJazzl6.jpg")
character.user = username
character.save!
goal = Goal.new(goal_name: "none", character_id: character.id, goal_detail: "none")
goal.save
milestone = Milestone.new(milestone_name: "none", goal_id: goal.id, model_overview: "none", milestone_pic_url: "https://i.imgur.com/ygSdPaS.png")
milestone.save
postthread = Postthread.new(thread_name: "Shalalala", thread_status: "To Start", milestone_id: milestone.id, thread_detail: "Daga tries to woo Isana into hitting the sheets with him, after finding out about the necklace",
  thread_link: "none")
postthread.save
relation = Relationship.new(relation_name: "Isana", relation_status: "Mated",relation_detail: "Been mated for a year", character_id: character.id, relation_pic: "https://i.imgur.com/AkGWRXS.png")
relation.save
connect = Connect.new(relationship_id: relation.id, postthread_id: postthread.id)
connect.save

puts 'done creating seeds'
