## For Interviewees

### Installation

```
git clone https://github.com/adlerhsieh/interview.git
cd interview
bundle install
rake db:migrate
rake db:seed
```

### Test 1: Answer the Returned Values

Run: 

```
rake questions
```

which brings the user to an interactive console. Enter the returned value and see if it is correct.

Use `exit` to exit.

Use `skip` to skip a question.

### Test 2: Fulfill the Specs

Run: 

```
rake methods
```

which brings the user to another interactive console. Write methods in one line and fulfill the instructions.

Each submission triggers `rspec` to run tests against the submitted code. Make them pass to move on to the next method.

Use `exit` to exit.

Use `skip` to skip a method.


### Test 3: Debugging Rails

Start `rails server` and open root `/` in the browser.

1. The posts should display a default avatar, which is their authors' first character of their name. They are missing. Fix it.
2. Enter the post with `(Slow Post)` text. Its performance is far more slower than other posts. Don't modify the layout and improve its performance.
3. When creating a `Post`, the content is always blank. Make sure the content is correctly displayed in `posts#show`.

## For Interviewers

Questions and methods are customizable in `lib` directories. They follow a simple set of rules.

### Questions

Add files in `lib/questions` directory. Name the file `0`, `1`, `2` and so on. Every file will be process in order of their filename. 

Do not add too many blank lines around the code. They will be displayed too.

Example:

```
a = 'foo'
b = 'bar'

a + b
```

And name the file as `lib/questions/0.rb`, which will be processed as the first question to the interviewee.

### Methods

#### Code

Like in the previous section, add files in `lib/questions` directory. Name the file `0`, `1`, `2` and so on. Every file will be process in order of their filename. 

The specifications are:

1. Use `# method` to separate instructions and code.
2. Use `# code` to indicate which part the interviewees' code are inserted.
3. You can either comment out instructions or not. They will only be displayed but not evaluated.

Example:

```ruby
# Create a method that returns the sum of x and y.

# Example: 
#
#     plus(1, 1)
#     # => 2
#     plus(2, 3)
#     # => 5
#     plus(5, 5)
#     # => 10

# method
def plus(x, y)
  # code
end
```

#### Spec

Also, this project uses `RSpec` as test framework. You need to add specs in `spec/lib/methods` in order to make sure interviewees' methods fulfill a specific standard.

Example:

```ruby
describe '#plus' do
  it { expect(plus(1, 1)).to eq 2 }
  it { expect(plus(2, 3)).to eq 5 }
  it { expect(plus(5, 5)).to eq 10 }
end
```
