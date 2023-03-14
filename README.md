# Bank tech test

## Specification

This is a simple bank program, created with Ruby, that allows the users to do deposits and withdrawals.
It also allow the users to see their account statments (Transaction date, transaction amount and total balance) with transactions in reverse chronological order.

It is possible to interact with the probram via Ruby's shell, IRB.

## Technologies used

| Thecnology               | Name               |     |
| ------------------------ | ------------------ | --- |
| **Programming Language** | Ruby               |  <code><img height="30" src="https://user-images.githubusercontent.com/25181517/192603745-7d34df9e-7756-4756-a539-6a61badf7a80.png" alt="Ruby" title="Ruby" /></code>   |
| **Test**                 | RSpec              | <code><img height="40" src="https://user-images.githubusercontent.com/25181517/192603750-4142ae75-10fa-4b61-a773-8b2052834357.png" alt="RubyGems" title="RubyGems" /></code> |
| **Text Editor**          | Visual Studio Code |   <code><img height="30" src="https://user-images.githubusercontent.com/25181517/192108891-d86b6220-e232-423a-bf5f-90903e6887c3.png" alt="Visual Studio Code" title="Visual Studio Code" /></code>  |

## How to run the program

Before running this program make sure you have Ruby installed on your machine by typing in your terminal:

`ruby -v`

Otherwise you can install it by following the instructions reported [on the Ruby website](https://www.ruby-lang.org/en/documentation/installation/)

Once you have done it, you can interact with the program via IRB by simply typing on the terminal:

`irb`

Here is an example on how you can do it from the root directory of the project:

![irb example](images/irb.png)

## Testing

To run the tests it will be necessary to install rspec by typing on your console:

```
gem install bundler
bundle add rspec
```

then you can run the tests by typing:

`rspec`

from the root directory of the project.

![tests outcome](images/tests.png)

## My approach to the problem

I started approaching my problem creating some user stories and highlighting the relevant nouns and verbs.

![User stories](images/user_stories.png)

I then created a diagram with the classes and their method.

![Diagram](images/diagram.png)

## Code structure

As you can see from the diagram above, I thought to create a BankAccount class that is initialised with an empty array, it creates Transaction objects that are then stored in the array. Once the bank statement is requested, BankAccount iterates through the array of Transaction objects to access the date, the amount, the type and from it calculates a balance. The statement is then returned with transactions in reverse chronological order.

## Work in progress

As I first designed my app, I included an extra interface class to allow the program to be run from the command line.
Unfortunately, as the time was running out and the deadline was approaching the class wasn't working as I would have liked to and therefore I decided to remove it to continue to work on that as soon as I'll have the chance.
