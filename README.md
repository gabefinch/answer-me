AnswerMe, a Stack Overflow clone
======================================
Try it out [here](https://vast-shore-5799.herokuapp.com/users/1).

by Gabe Finch & Mike Goren

This is a simple Ruby/Rails Stack Overflow clone.

Installation
------------

Install answer-me by first cloning the repository.  
```
$ git clone http://github.com/gabefinch/answer-me.git
```

Start the database:
```
$ postgres
```

Create the databases, tables, and test environment by running the following:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ rake db:seed
```

Start the rails server:
```
$ rails s
```

In your web browser, go to http://localhost:3000

License
-------

GNU GPL v2. Copyright 2015
