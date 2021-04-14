# Knowledge base app

## Getting started

- `git clone https://github.com/abeidahmed/cuddly-octo-enigma.git`
- `bundle install` and `yarn install`
- Setup your db: `rails db:create db:migrate`. You may need to setup the `database.yml` file
- Run `rails s` and `ruby ./bin/webpack-dev-server` to start the server
- Visit `localhost:3000`

## Tech stack used

- Rails
- Stimulus
- TailwindCSS
- PostgreSQL

## Why I didn't use redis to store the suggestions

This project is hosted at Heroku (free version) and when I tried to install
the `heroku redis`, it asked me to verify my Credit Card. I would have
verified it without any issue, but I do not have one.

## Main feature (Live intelligent search)

I debounced the `user input` so as to not hit the database for every
keystroke. However, this solution is not full-proof. For example: You wanted to
query `how are you?`, but you type `how are` and wait for one second and then
you type `you?` to complete the sentence. Now you have two suggestions:

- `how are` and,
- `how are you?`

As you can see, the first suggestion is pretty baseless as it does not provide
any context whatsoever.

### Solution

In the backend, I run a simple sentence checker which intelligently checks
for the previous sentence (`how are`) and the incoming sentence (`how are you?`)
and then decides which one to keep and which one to discard.

It also works for typos:

- `Howis my friend?`
- `How is my friend?`

The last one is stored to the db in this case.

## Contact

- GitHub: [@abeidahmed](https://github.com/abeidahmed)
- Twitter: [@iamhawaabi](https://twitter.com/iamhawaabi)
- LinkedIn: [Abeid Ahmed](https://www.linkedin.com/in/abeidahmed/)
