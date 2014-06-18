# DarrylSnow.com

This is the code base for the personal website of Darryl Snow. The code is open source but the website as a whole is the property of Darryl Snow and under copyright. Please feel free to explore how my website is built and how I like to organise my code.

## Development

Install dependencies:

```
npm install
bower install
```

To compile and watch assets and run a development server which automatically injects changes into the browser without having to reload the page, run:

```
gulp
```

To run tests:

```
karma start karma-unit.coffee
```

To generate a CV:

```
sudo gem install gimli
gimli -f app/darryl-snow-cv--english.md -o app
```
