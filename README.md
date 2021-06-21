# Dromedaria
This project is a marketplace that connects brazilian artists to fans. The artist can sell custom videos (offered to the public in categories such as birthday parties) and use a dashboard to manage the whole experience. As a consumer, you can order videos (better than an autograph, don't you think?)!.

## Getting started
1) Make sure that you have git properly set up in your machine and you have access to Github
2) Open the terminal and clone this project to your machine

```
git clone https://github.com/belisabettega/dromedarial
```

3) Install a package manager, such as Homebrew (if you use mac)
4) Use rbenv to install the right Ruby version. You can find info about rbenv [here](https://github.com/rbenv/rbenv)
5) You'll also need to have Ruby installed in your machine and running the 2.6.6 version by default
```
rbenv install 2.6.6
rbenv global 2.6.6
```
6) Install Rails 6.0.3.7 (never do sudo gem install rails even if the terminal tells you so)
```
gem install rails -v 6.0
```
7) If you don't have bundler and yarn installed, you need to install [NVM - version 14.15.0](https://github.com/nvm-sh/nvm) and then
```
gem install bundler
npm install --global yarn
```
8) After that, run the following commands to make all the dependencies available to your application
```
bundle install
yarn install
```
9) At last, you just need to create the development database, and run the rails server on yout local host
```
rails db:create db:migrate
rails s
```
10) You'll be able to open the application by coping the following link to your browser
```
http://localhost:3000/
```
## Licensing
[MIT License](https://choosealicense.com/licenses/mit/#)

Copyright (c) 2021 Dromedaria
