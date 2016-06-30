## Interview

### Installation

```
git clone https://github.com/adlerhsieh/interview.git
cd interview
bundle install
rake db:migrate
rake db:seed
```

### Test 1

Run: 

```
rake questions
```

which brings the user to an interactive console. Enter the returned value and see if it is correct.

Use `exit` to exit.

Use `skip` to skip a question.

### Test 2

Run: 

```
rake methods
```

which brings the user to another interactive console. Write methods in one line and fulfill the instructions.

Each submission triggers `rspec` to run tests against the submitted code. Make them pass to move on to the next method.

Use `exit` to exit.

Use `skip` to skip a method.


### Test 3

Start `rails server` and open root `/` in the browser.

1. The posts should display a default avatar, which is their authors' first character of their name. They are missing. Fix it.
2. Enter the post with `(Slow Post)` text. Its performance is far more slower than other posts. Don't modify the layout and improve its performance.
3. When creating a `Post`, the content is always blank. Make sure the content is correctly displayed in `posts#show`.
