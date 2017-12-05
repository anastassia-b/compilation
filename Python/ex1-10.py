# print ("Hello World!")
print ("Hey python, It's been a little while")
print ("Love, Anastassia") # like in ruby, comments can be anywhere.
print ()
print ("testing")

# Math is the same too
print (1 + 2)
print (7.0 / 4.0)
print (7 / 4) #Oh, they're both 1.75! Huh. Thanks, python v 3.
print (7 % 4)

cars = 100

print ("There are", cars, "cars")
print ("Hey %s you." % "there")

my_name = "Anastassia"
my_age = 23
my_height = 5.9

print ("My name is %s" % my_name)
print ("My age is %d and my height is %d, is %s, is %r" % (my_age, my_height, my_height, my_height))
# Hm, %d printed only "5" instead of "5.9"


#ex6.py

x = "There are %d types of people." % 10
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s." % (binary, do_not)

print (x)
print (y)

print ("I said: %r." % x) #includes quotes
print ("I also said: '%s'." % y)
print ("I also said: %s." % y) #doesn't include inner quotes

hilarious = False
joke_evaluation = "Isn't it funny? %r"

print(joke_evaluation % hilarious)

left = "This is the left side"
right = "... of a string with a right side."

print (left + right)

#ex7.py

print ("." * 20)
end1 = "H"
end2 = "e"
end3 = "l"
end4 = "l"
end5 = "o"

print (end1 + end2, print (end3 + end4 + end5)) #oh interesting
#llo prints first
#Then "He None". cool.

#ex8.py

formatter = "%r %r %r %r"

print (formatter % (1, 2, 3, 4))

days = "\tMon Tue Wed Thur Fri Sat Sun"
months = "\nJan\nFeb\nMarch\nApril\n"

print ("Here are the days: ", days)
print ("And the months: ", months)

while True:
    for i in ["/", "-", "|", "\\", "|"]:
        print ("%s\r" % i, end='')
