# Test FitsApp

FitsApp 48h RoR web test. Best of luck!

Create a small web app with Ruby on Rails.
Below is some further information:

*There are two clients: users and trainers.
Each of these has the ability to log into the website through authentication.
Once signed in, they can see in the front page and the button ‘chat' showing up.
Clicking on chat you see all the messages in which the logged client is involved.
Then, you can click over ‘New chat’ and you are given a form to send a new message.
In the form you have to select the receiver (either a user or a trainer).
Editing and deleting messages isn’t allowed.
You can create an admin user if you want to make these operations.*

You can have as many columns and tables in the database as you want and you can have more features. Feel free to lay out the front page as you prefer. It doesn’t have to be pretty. Focus especially on the back-end so that things work and the front-end doesn’t need to be at a production level: use a bit of bootstrap or any other tool you know/like.


## Versions

```
$ ruby -v
ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32]
```

```
$ rails --version
Rails 5.0.1
```

Developed on Windows OS


## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ ruby bin\bundle install --without production
```

Next, migrate the database:

```
$ ruby bin\rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ ruby bin\rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ ruby bin\rails server
```

visualize page on: [http://localhost:3000/](http://localhost:3000/)
