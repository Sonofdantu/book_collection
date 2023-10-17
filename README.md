# README #

# # Introduction # #
Our team is creating an application for the Ismaili Muslim Student Association. This application will enable the president to have an overview of the officers and members of the organization with the ability to add and subtract points and see how many points they each have as well as a ranking of each to see who has the most points. In addition, officers and members will also be able to see their own rankings to see how they are performing each week.

# # Requirements # # 
This code has been run and tested on:
* Ruby - 3.1.2
* Rails - 7.0.3
* Ruby Gems - Listed in ‘Gemfile’
* PostgreSQL - 16.0.0
* Docker - (Latest Container)

# # External Deps # #
* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

# # Installation # #
Download this code repository by using Git:
‘git clone https://github.com/Sonofdantu/book_collection.git’

# # Tests # #
‘rspec spec/’
You can run all the test cases by running. This will run both unit and integration tests.
‘rspec .’

# # Execute Code # #
Run the following code in Powershell if using windows or the terminal using Linux/Mac
  `cd book_collection`
docker run -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 paulinewade/csce431:latest	
`cd rails_app`
Install the app
 `bundle install && rails webpacker:install && rails db:create && db:migrate`
Run the app
 `rails server --binding:0.0.0.0`
The application can be seen using a browser and navigating to http://localhost:3000/

# # Enviromental Variables/Files # #
We have environment variables setup for Authentication. The tutorial can be found here: https://medium.com/craft-academy/encrypted-credentials-in-ruby-on-rails-9db1f36d8570
The tutorial above will help you understand now we encrypted the admin page's username and password!

# # Deployment # #
The user can choose to follow the below tutorial or we can transfer the app to the users heroku account
Setup a Heroku account: https://signup.heroku.com/
From the heroku dashboard select `New` -> `Create New Pipline`
Name the pipeline, and link the respective git repo to the pipline
Our application does not need any extra options, so select `Enable Review Apps` right away
Click `New app` under review apps, and link your test branch from your repo
Under staging app, select `Create new app` and link your main branch from your repo

# # CI/CD # #
For continuous development, we set up Heroku to automatically deploy our apps when their respective github branches are updated.
  `Review app: test branch`
  `Production app: main branch`
For continuous integration, we set up a Github action to run our specs, security checks, linter, etc. after every push or pull-request. This allows us to automatically ensure that our code is working as intended.

# # Support # #
Contact our product owner at skeylon@tamu.edu for any questions and we will get back to you ASAP.

