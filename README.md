 Shopping Cart Application

This is a simple shopping cart application built with Ruby on Rails.

## Requirements

- Ruby 3.0.3 or higher
- Rails 7.1 or higher
- PostgreSQL
- Node.js and Yarn
- Commitlint for commit message validation

## Architecture

This application follows the MVC (Model-View-Controller) architecture pattern. Key components include:

- **Services**: Encapsulate business logic.
- **Models**: Define the data structure and relationships.
- **Views**: Present the user interface.
- **Controllers**: Handle requests and responses.
- **Helpers**: Provide reusable view logic.

### Additional Features

- **CSS**: Uses Sass for styling.
- **Testing**: RSpec for unit tests and Capybara for acceptance tests.
- **Faker**: For generating fake data in tests.
- **FactoryBot**: For setting up test data.
- **Commitlint**: Enforces conventional commit messages.
- **UUID**: Primary keys in the database use UUIDs.

## Usage

The application allows users to:

- View a list of products.
- Add products to a shopping cart.
- Create an order containing the selected products.
- View and delete orders.

## Getting Started

### Setup

1. **Clone the repository:**

```sh
git clone https://github.com/your-username/shopping-cart-app.git
cd shopping-cart-app
```
2. **Install dependencies:**
```sh
bundle install
yarn install
```
3. **Setup the database:**
Make sure you have PostgreSQL installed and running. Then, create and migrate the database:
```sh
rails db:create
rails db:migrate
```
4. **Seed the database with sample data:**
```sh
rails console
FactoryBot.create_list(:product, 10)
```