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

### Short link Analytics

This app also provides a simple analytics interface that can be accessed by
appending a `+` character to the end of the short link:

```shell
GET http://localhost:3000/a1B2c3D4+
{
  "response": [
    { 
      "time": "2018-10-01T10:00:00Z", 
      "referrer": "none", 
      "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36" 
    },
    { 
      "time": "2018-10-01T15:30:10Z", 
      "referrer": "none", 
      "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36" 
    }
  ]
}
```

## Testing

To run unit tests:

```shell
bin/rails test
```
