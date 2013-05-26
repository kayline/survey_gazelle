# user = User.create(username: "molly")
# holly = User.create(username: "holly")
# survey = Survey.create(title: "politics")
# question = Question.create(question: "are you a bastard")
# choice1 = Choice.create(choice: "yes")
# choice2 = Choice.create(choice: "no")
# answer = Answer.create
# choice1.answers << answer
# choice1.save
# holly.answers << answer
# holly.save

# user.surveys << survey
# user.save
# survey.questions << question
# survey.save
# question.choices << [choice1, choice2]
# question.save

another_question = Question.create(question: "what has it got in its pocketses")
opt1 = Choice.create(choice: "lint")
opt2 = Choice.create(choice: "crumbs")
opt3= Choice.create(choice: "oh hey, the One Ring of Sauron")
another_question.choices << [opt1, opt2, opt3]
another_question.save

survey = Survey.last
survey.questions << another_question
survey.save
