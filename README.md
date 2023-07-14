# Rails API for generating Advertising content for Products

This is a Rails API application that serves as a backend for managing products and their descriptions. The descriptions are automatically generated using the OpenAI GPT-3 language model (davinci-003) through (API calls to ChatGPT)[https://platform.openai.com/docs/api-reference].

## Prerequisites

Before running this application, make sure you have the following installed:

- Ruby (version 2.7.4 or higher)
- Ruby on Rails (version 6.1.4 or higher)
- PostgreSQL (version 9.5 or higher)

## Getting Started

1. Clone this repository to your local machine:

```bash
git clone https://github.com/maclenn77/product-description-back.git
```

2. Navigate to the project's directory:

```bash
cd product-description-back
```

3. Install the required dependencies:

```bash
bundle install
```

4. Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

5. Set up your OpenAI API credentials by creating an account at [https://platform.openai.com/signup](https://platform.openai.com/signup). Once you have your credentials, create a `.env` file in the project's root directory and add the following lines:

```dotenv
OPENAI_API_KEY=your_openai_api_key_here
```

6. Start the Rails server:

```bash
rails s
```

Now, you can access the API endpoints locally at `http://localhost:3000`.

## API Endpoints

### Products

#### `GET /products`

Retrieve a list of all products.

#### `GET /products/:id`

Retrieve details of a specific product.

#### `POST /products`

Create a new product.

##### Request Body

```json
{
  "product": {
    "name": "Product Name", # REQUIRED
    "categories": ["A", "List"],
    "characteristics": "As brand, color or size",
    "base_description": "A short description for inspiration or more details"
  }
}
```

#### `PUT /products/:id`

Update details of a specific product.

##### Request Body

```json
{
  "product": {
    "name": "Product Name", # REQUIRED
    "categories": ["A", "List"],
    "characteristics": "As brand, color or size",
    "base_description": "A short description for inspiration or more details"
  }
}
```

#### `DELETE /products/:id`

Delete a specific product.

### Descriptions

#### `GET /products/:product_id/descriptions`

Retrieve all descriptions for a specific product.

#### `GET /descriptions/:id`

Retrieve details of a specific description.

#### `POST /products/:product_id/descriptions`

Create a new description for a specific product. The description will be generated automatically using the OpenAI GPT-3 model (davinci-003).

##### Request Body

```json
{
    "segment": "Old people",
    "keywords": ["Travel", "Europe"],
    "usage": "Special Offer",
    "season": "Father's Day",
    "creativity": "moderate" # Sets temperature. Options are "high", "moderate-high", "moderate", "moderate-low" and "low"
}
```

#### `PUT /descriptions/:id`

Update details of a specific description.

##### Request Body

```json
{
  "id":6,
  "segment": "Old people",
  "season": "Father's Day",
  "keywords":["Travel", "Europe"],
  "usage": "Special Offer",
  "created_at": "2023-07-14T01:12:29.195Z",
  "updated_at": "2023-07-14T01:12:29.195Z",
  "creativity": "moderate",
  "product_id":1,
  "result": "\n\nLimited Time Offer! Get the new iPhone 9 in the Electronics category to make this Father's Day extra special for your loved one. With its advanced features and compatibility, being able to capture every moment of your upcoming Travel Europe adventure will be effortless. \n\nDon't miss out on this amazing deal! Get your iPhone 9 today!"
}
```

#### `DELETE /descriptions/:id`

Delete a specific description.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
