# Usage:

```
$ ruby my_app.rb
```

# Heroku Sinatra MVC

I love Sinatra for writing quick and easy web apps in a snap. I also
love MVC for keeping code clear, organized, and easily testable.

This is a template Sinatra app with some MVC-oriented configurations and
testing built in.

See [the homepage](http://os.alfajango.com/heroku-sinatra-mvc/) for more details.

## Models

Models are located in `config/data.rb`. For small apps, it's usually
convenient enough to just put all models into that file. Though it's
easy to separate each model into its own file. See the file for example
model structure.

Depending on the database and ORM adapter being used, you may need
migrations. Migrations can be found in `config/migrations.rb`. See the
file for example migrations.

This app uses Postgresql for production (to work easily on
Heroku), with Sequel ORM, which is similar to ActiveRecord, for those
familiar with Rails.

## Controller

Sinatra conveniently combines the controller functionality in with the
routing. This is all in the usual `my_app.rb` file.

## Views

Each view has its own file in the `views` directory. This app uses haml
for templating, though this can easily be switched out with erb or
whatever you want.

## Assets

Images, JavaScripts, and CSS are located together in the `public`
directory.

## Testing

This app is configured to use RSpec for testing, with tests located in
the `spec` directory.

## Getting Started

There is no installation script or magic involved. Just fork this
project and start coding.

You might consider adding this fork as a git remote to easily pull down
and merge updates with your app:

```bash
git remote add template git://github.com/JangoSteve/heroku-sinatra-app.git
```

Once the app is cloned, run `bundle install`, and then you can run the
specs with `bundle exec rspec spec/`.

## Sample App

For a sample app using this template, see [The Aceys](https://github.com/JangoSteve/Aceys).

--------------------------------------------------------------------

# Here is a sample/template sinatra application ready for deployment to [Heroku](http://heroku.com).

* Create an acount in seconds at [Heroku](http://heroku.com/signup).
* Install the gem `sudo gem install heroku`.
* If you do not have an SSH key
you'll need to [generate
one](http://heroku.com/docs/index.html#_setting_up_ssh_public_keys)
and [tell Heroku about
it](http://heroku.com/docs/index.html#_manage_keys_on_heroku)
* Clone this repo `git clone git://github.com/sinatra/heroku-sinatra-app [appname]`
* `cd /path/to/project`
* `heroku create [optional-app-name]` (You can rename your app with `heroku rename`)
* `git push heroku master`
