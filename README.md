arkamai
=======

A small command line akamai toolkit.
Fight the CDN with some arkamai awesomeness.

## installation 

```
download the repository.
rake build
gem install gem install arkamai-0.0.1.gem
```

## usage

for help information 

```
arkamai -h
```

to check information related to a url

```
arkamai -u http://www.url.com/using/akamai -i 
```

to verify if the cache key corresponds with the digital property of the url

```
arkamai -u http://www.url.com/using/akamai -kc 
```

to verify if the url is cacheable on the akamai edge

```
arkamai -u http://www.url.com/using/akamai -c 
```

to verify if the edge cache is hitted on that url

```
arkamai -u http://www.url.com/using/akamai -ch 
```

you can also set a list of urls from a file, to have them evaluated with the -f option, i.e a cache hit evaluation on multiple urls could done like this:

```
arkamai -f /path/to/file/with/urls -ch 
```
