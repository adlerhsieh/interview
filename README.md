# Interview

This project serves to evaluate developers' proficiency in Ruby & Rails. 

## How Does It Help?

Interviees are expected to clone this project and enter its interactive console for two types of tests:

1. Read a piece of code, and name the returned value by evaluating the code.
2. Read the specifications, and write a method to fulfill the specs.

Also, start the `rails server` if the they are expected to debug several Rails problems. Interviers can sit by the interviewees to see how they handle the problems.

The interactive console looks like this:

![](http://i.imgur.com/yRox8fB.gif)

## Ready for the Interview?

### Installation

Clone:

```
git clone https://github.com/adlerhsieh/interview.git
cd interview
```

Setup:

```
bundle install
```

### Part 1: Name the Returned Value

Run: 

```
rake questions
```

which brings you to an interactive console. You will see several pieces of code. Input the returned values for each code piece. Type `Exception` if you expect an exception.

Other commands:

1. Use `exit` to exit.
2. Use `skip` to skip a question.

### Part 2: Write a Method

Run: 

```
rake methods
```

which brings you to another interactive console. Write methods in one line and fulfill the instructions.

Each submission triggers `rspec` to run tests against the submitted code. Make them pass to move on to the next method.

Other commands:

1. Use `exit` to exit.
2. Use `skip` to skip a method.

### Part 3: Debugging Rails

Setting up db is necessary for this part. Run:

```
rake db:migrate
rake db:seed
```

Start `rails server` and open root `/` in the browser. The interviewee should solve these problems:

1. The posts should display a default avatar, which is their authors' first character of their name. They are missing. Fix it.
2. Enter the post with `(Slow Post)` text. It reveals the performance issue for this app. Don't modify the layout and improve its performance.
3. When creating a `Post` with the `New post` button, the `content` is always blank. Make sure the content is correctly displayed in `posts#show`.

### Part 4: Rails feature requests

Intended for more senior candidates after debugging part 3. These are time consuming, so approach is more important than implementation. Encourage dialogue while discussing different approaches.

1. Allow authors to optionally tag new posts.
2. Paginate posts with an option size no less than 10 and no greater than 100 per page.
3. Filter blog posts by author, date created, tags, and title.
4. Full text search posts, comments, and user names

## Other Interview Stuff

1. [Some common Interview Questions](https://github.com/adlerhsieh/interview/blob/master/lib/README.md)
2. The whole test takes about 1.5 hour based on my experience. It is suggested that interviers only assign necessary tests.

## Customization

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

If the filename is `lib/questions/0.rb`, it will be processed as the first question.

### Methods

#### Code

Add files in `lib/questions` directory.The specifications are:

1. Name the file `0`, `1`, `2` and so on. Every file will be process in order of their filename. 
2. Each file is written with 2 parts: `instruction` and `method`. `Instruction` describes the purpose of this method, and `method` is for the interviewee to understand where the code is inserted.
2. Use `# method` to separate instructions and method.
3. Use `# code` to indicate which part the interviewees' code are inserted.
4. You can either comment out instructions or not. They will not be evaluated.

Example:

```ruby
# Create a method that returns the sum of x and y.
# 
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

Also, this project implements `RSpec` as the test framework. You need to add specs in `spec/lib/methods` in order to make sure interviewees' methods fulfill a specific standard.

Please add `require 'interview_helper'` at the beginning of every spec file.

Example:

```ruby
require 'interview_helper'

describe '#plus' do
  it { expect(plus(1, 1)).to eq 2 }
  it { expect(plus(2, 3)).to eq 5 }
  it { expect(plus(5, 5)).to eq 10 }
end
```

### Pull requests and issues are welcome

