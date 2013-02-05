# RESTful Obscenity

RESTful Obscenity is an RESTful API wrapper for [Obscenity](https://github.com/tjackiw/obscenity), a profanity filter gem for Ruby.

An instance is currently hosted at http://peaceful-dusk-7667.herokuapp.com. Source code at https://github.com/emilesilvis/restfulobscenity.

## Usage

### Set blacklist

Set up your blacklist with ```/use?list=url_to_yaml_blacklist.yml```.

Example request:

```
http://peaceful-dusk-7667.herokuapp.com/use?list=http://glio.co.za/emile/blacklist.yml
```

Comprehensive blacklists used in [Obscenity](https://github.com/tjackiw/obscenity) can be found [here](https://raw.github.com/tjackiw/obscenity/master/config/blacklist.yml) and [here](https://raw.github.com/tjackiw/obscenity/master/config/international.yml).

### Check a sentence for profanity
Check a sentence for profanity with ```/check?sentence=somesentence```.

Example request:

```
http://peaceful-dusk-7667.herokuapp.com/check?sentence=this%20is%20crap
```

Example response:

```
{"profane":true}
```

### Clean a sentence
Clean a sentence with ```/clean?sentence=somesentence```.

Example request:

```
http://peaceful-dusk-7667.herokuapp.com/clean?sentence=this%20is%20crap
```

Example response:

```
{"cleaned_sentence":"this is ****"}
```

## Authors

* [RESTful Obscenity](https://github.com/emilesilvis/restfulobscenity): Emile Silvis [@emilesilvis](http://twitter.com/emilesilvis)
* [Obscenity](https://github.com/tjackiw/obscenity): Thiago Jackiw: [@tjackiw](http://twitter.com/tjackiw)

## Copyright

Copyright (c) 2012 Thiago Jackiw. See LICENSE.txt for further details.