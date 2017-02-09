## eventful API mock assessment Mod3

###To run this app:

#### Run through the standard Rails setup.

```
$ bundle install
$ rake db:{create,migrate}
$ rails s
```

#### Navigate to `http://localhost:3000`

Enter a zipcode, and you should see 16 events near that zipcode sorted by popularity.

#### Next Steps

Pull out ugly controller function to service with Event.rb and EventFinder.rb

see branch add_service to see how far I got
