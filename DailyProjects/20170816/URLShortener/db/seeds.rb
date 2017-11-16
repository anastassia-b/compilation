User.delete_all
user2 = User.create!(email: "example@gmail.com")
user1 = User.create!(email: "email.anastassia@gmail.com")

ShortUrl.delete_all
url1 = ShortUrl.create_from_long!(user1, 'www.wikipedia.com')
url2 = ShortUrl.create_from_long!(user1, 'www.stackoverflow.com')
url3 = ShortUrl.create_from_long!(user2, 'www.google.com')
url4 = ShortUrl.create_from_long!(user1, 'www.google.com')
url5 = ShortUrl.create_from_long!(user2, 'www.pinterest.com')

Visit.delete_all
Visit.record_visit!(user1, url1)
Visit.record_visit!(user1, url2)
Visit.record_visit!(user1, url3)
Visit.record_visit!(user1, url3)
Visit.record_visit!(user1, url4)
Visit.record_visit!(user2, url1)
Visit.record_visit!(user2, url5)
Visit.record_visit!(user2, url4)
