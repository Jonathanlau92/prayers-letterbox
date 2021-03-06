# Prayer LetterBox

An application to bring brothers and sisters in Christ together in prayers.
Features of the app:

1. Share a prayer requests
2. Pray for someone

## Development Details

To test email sending on localhost,

On your terminal, do `gem install mailcatcher`

Run `mailcatcher` to activate it!

Go to https://localhost:1080 to check the received mail

[mailcatcher link](https://mailcatcher.me/)

## Production Details (Heroku)

This app deploys on Heroku.

To setup Heroku CLI: [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

Add git remote to existing Heroku app: [Add git remote](https://devcenter.heroku.com/articles/git#creating-a-heroku-remote)

Rename your remote in this convention: (heroku -> Production Env), (staging -> Staging Env)

See existing remote using `git remote -v`

Push your changes to Heroku using `git push heroku master` (to production in this case), where heroku is the name of your remote

If there are changes to the database, migrate it by running `heroku run rails db:migrate --app <APP_NAME>`

To run rails command on Heroku, do `heroku run <RAILS_COMMANDS> --app <APP_NAME>`

## Logo-style:

Logo PLB Color: #2680e0

Logo prayer letterbox font style: ADAMCG PRO

Logo PLB font style: LOBSTER 13

Logo is credited to: [Logomaker The Hoth](https://logomaker.thehoth.com/)

