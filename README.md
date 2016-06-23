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

Enter `lib/interview` and complete all methods according to instructions.

Run specs and make sure all specs are passed before entering the next stage.

### Test 2

Run: 

`rake questions`

which brings you to an interactive console. Enter the returned value and see if it is correct.

Use `exit` to exit.

Use `skip` to skip a question.

### Test 3

Start `rails server` and open root `/` in the browser.

1. The posts should display a default avatar, which is their authors' first character of their name. They are missing. Please correct.
2. Enter the post with `(Slow Post)` text. Its performance is far more slower than other posts. Don't modify the content and improve its performance.
3. When creating a `Post`, the content is always blank. Make sure the content is correctly display in posts#show.
