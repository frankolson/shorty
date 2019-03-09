# Shorty

This is a simple Rails API for creating [bit.ly](https://bit.ly) like
redirecting short_links.

## System Dependencies

- `Rails 5.2.2`
- `Ruby 2.5.1`
- `Bundler 2.0.1`

## Setup

Use the setup script to install gems and setup your database, then start up the
server to begin tinkering.
```shell
bin/setup
bin/rails s
```

## Usage

### Creating a short link

To create a short link, send a `POST` request to the `/short_link` path like
so:
```shell
POST http://localhost:3000/short_link
{
  "long_url": "<long_url>"
}
```

The response to a successfull creation will look like the following:
```shell
{
  "long_url": "<long_url>",
  "short_link": "<short_link>"
}
```

### Accessing a short link

Using a short link is simple. A `GET` request to the shortlink will return a 301
redirect to the original URL that the shortlink was created with.

```shell
GET http://localhost:3000/a1B2c3D4
```

## Testing

To run unit tests:
```shell
bin/rails test
```
