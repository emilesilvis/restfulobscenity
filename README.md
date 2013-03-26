# RESTful Obscenity

RESTful Obscenity is an RESTful API wrapper for [Obscenity](https://github.com/tjackiw/obscenity), a profanity filter gem for Ruby. A hosted instance is available at at [http://restfulobscenity.herokuapp.com/](http://restfulobscenity.herokuapp.com/). Source code on [GitHub](https://github.com/emilesilvis/restfulobscenity).

## Usage

### Set blacklist

Set up your blacklist with ```/use?list=```.

Example request:

```
http://restfulobscenity.herokuapp.com/use?list=url_to_blacklist.yml
```

If no blacklist is set, the [default Obscenity blacklist](https://raw.github.com/tjackiw/obscenity/master/config/blacklist.yml) is used. There is also an [international flavour](https://raw.github.com/tjackiw/obscenity/master/config/international.yml). These can form the basis of your own blacklists.

### Check a sentence for profanity
Check a sentence for profanity with ```/check?sentence=```.

Example request:

```
http://restfulobscenity.herokuapp.com/check?sentence=this%20is%20crap
```

Example response:

```
{"profane":true}
```

### Clean a sentence
Clean a sentence with ```/clean?sentence=```.

Example request:

```
http://restfulobscenity.herokuapp.com/clean?sentence=this%20is%20crap
```

Example response:

```
{"cleaned_sentence":"this is ****"}
```

## Todo
Cleaner API interface

## Copyright

Copyright (c) 2012 Thiago Jackiw. See LICENSE.txt for further details.