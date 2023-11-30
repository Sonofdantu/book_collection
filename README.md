[[[ Requirements ]]]

- Ubuntu
  - Distributor ID: Debian
  - Description: Debian GNU/Linux 11 (bullseye)
  - Release: 11
  - Codename: bullseye
- Docker version 24.0.5, build ced0996
- Heroku v22
- Heroku CLI version 7.60.2
- Node v16.15.0
- ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
- Rails 7.0.8
- RSpec 3.12
  - rspec-core 3.12.2
  - rspec-expectations 3.12.3
  - rspec-mocks 3.12.6
  - rspec-rails 6.0.3
  - rspec-support 3.12.1
- psql (PostgreSQL) 13.7 (Debian 13.7-0+deb11u1)
- omniauth (~> 1.9.1)
- rubocop v1.57.0
- brakeman 6.0.1
- simplecov (0.21.2)
- Jira
- VSCode v1.84

[[[ External Dependencies ]]]

- Download Docker at: https://www.docker.com/products/docker-desktop/
- Download Heroku CLI at: https://devcenter.heroku.com/articles/heroku-cli
- Download Git at: https://github.com/git-guides/install-git
- Download Git Desktop at: https://desktop.github.com/


[[[ Installation ]]]

- Install Docker

  - Windows
    - https://docs.docker.com/desktop/windows/install/
    - It can be installed with wsl2 and hyper-v backend. (If hyper-v has not been enabled and no previous version of wsl has been installed, we recommend using wsl2)
    - Install WSL at https://docs.microsoft.com/en-us/windows/wsl/install-win10
      - If upgrading wsl then use `wsl --set-default-version 2` (do with caution as there may be side effects)
      - If WSL2 missing go to https://aka.ms/wsl2kernel
      - Due to a bug in Docker Desktop 4.1.x-WINDOWS (start screen hang indefinitely), use docker desktop 4.0.1
    - Add windows directory if multiple partitions.

  - Mac
    - https://docs.docker.com/desktop/mac/install/

  - Ubuntu
    - https://docs.docker.com/engine/install/ubuntu/

- Download docker image

  - Make sure Docker is running
  - Run in the terminal (if windows, powershell), (for those running in WSL, add “sudo” in front of if permission denied):
    - docker pull paulinewade/csce431:latest

- Run docker image

  - Windows and Linux
    - Create a directory, for example `app`
      - mkdir app
    - Move to that directory
      - cd app
    - Mount and run the docker image for ubuntu (add “sudo” in front of if permission denied for all the following commands):
      - docker run -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 paulinewade/csce431:latest
      - For windows replace $(pwd) -> ${PWD}.  See below:
      - docker run -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 paulinewade/csce431:latest

  - Mac
    - If you are using a Mac with M1 chip you need to use the following command instead:
    - docker run -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 --platform linux/amd64 paulinewade/csce431:latest


end Mac M1 Instructions

[[[ Tests ]]]

- An rspec test suite is available and can be run using:
	
	‘rspec /spec’

- You can also run all the test cases using ‘rspec .’ to run all integration and unit tests.

[[[ Execute ]]]

- First, when outside of the docker run the following command (preferably in a place where you want to): “docker start -ai whatever_name” to start up the docker.
- Second (the rest of these steps are inside the docker), if the application isn’t there, clone it using “git clone https://github/link_to_the_page”, otherwise use cd (change directory) to enter the root directory of the application, and make sure to do a “git pull” to update it to the most recent version.
- If it is the first time in the docker AND on a MAC, make sure to enter the file in the directory “test_app/config/environments/development.rb” and comment out line #72 for EventFileUpdateChecker. 
- Then run “bundle install” to install all the gems, and also if it is the first time on docker run “rails webpacker:install”.
- Now run “rails db:create” in the terminal. This will create the psql database used to store entries, if not already created. If created this step can be skipped.
- Now run “rails db:migrate” to migrate the database to the current version if a new one was created. It is always safe to do this.
- Lasty run “rails server --binding=0.0.0.0” to start the server, wait a second, and open in the browser, “https://localhost:3000” and you should see the application!
- To stop the running application use Ctrl + C, and to exit the docker container type “exit”.

[[[ Environment Variables ]]]

  DATABASE_URL = postgres://gnmhpylhparegc:9e3359814cc8b223819ee91a64ea3eca48678fb0918e332b19c1f77897b4fcfd@ec2-44-215-211-215.compute-1.amazonaws.com:5432/detesfleurjhho
  GOOGLE_OAUTH_CLIENT_ID = 603956607345-g030aj497718bvvg4kvfmobkdjb7te5o.apps.googleusercontent.com
  GOOGLE_OAUTH_CLIENT_SECRET = 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
  LANG = en_US.UTF-8
  RACK_ENV = production
  RAILS_ENV = production
  RAILS_LOG_TO_STDOUT = enabled
  RAILS_SERVE_STATIC_FILES = enabled
  SECRET_KEY_BASE = c4b23b36d286b840852261483fdbdda401ca0146fafece71d8b50f97c0ec57d1496fd58ec58b5e910463c3c1ab520da5bb691849090c062890999d14b3a6a2f7

[[[ Deployment ]]]

- Deployment is done through Heroku using their app staging pipeline, how this is done in our workflow is detailed in the CI/CD section below
- To create a staging area, create a new pipeline after creating a Heroku account. Then in the creation of it, choose a name, along with a connected GitHub repository (would have to connect GitHub to Heroku as well for this to work)for the pipeline. After this, the pipeline should be created. 
- Next you’ll want to enable review apps, in this do NOT check anything off and select “Enable Review Apps”.
- Now you should have the ability to create a new review app. This can be done by selecting a new review app, followed by selecting the branch wanted for the application. 
- For a staging app, you simply choose to create the application by selecting a name, and then after choosing that name, you can go into the settings and select the branch you want to attach to it along with allowing for automatic deployments for whenever that branch is changed. This application can be moved to the production stage when it looks good!
- Besides this, after creating a new app via review OR staging, go into the settings and add all of the environment variables along with adding the link of the homepage of the application to Google Cloud so that the authenticator can recognize the link.
- Add Heroku Postgres to the application under Resources in the settings to have a cloud-hosted database.

[[[ CI/CD ]]]

- Integration
  - Whenever code is pushed to any branch on GitHub, it is ran through GitHub Actions
  - GitHub Actions automatically runs rspec tests, brakeman, simplecov, and rubocop, rejecting any branches which don’t pass the tests
- Deployment
  - Whenever code is pushed to the test branch, it is automatically deployed on our test app within Heroku
  - The test app is where we test that all features are deployed correctly
  - After they are deployed correctly, we merge test to main, and then the code is deployed into a staging app
  - In the staging app we do a final round of testing, to make sure everything is as bug-free as possible for the customer
  - Once the staging app is rigorously tested, it is moved to production and given to the customer

[[[ Support ]]]

- Please email skeylon@tamu.edu for any questions and he will respond ASAP to solve your issue. 
