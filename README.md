Jericho
=========
Jericho provides a simple and flexible HTML, CSS, and Javascript foundation for web apps that want to use the Stylish UI style. It is built on top of Twitter Bootstrap.

How to use Jericho
---------------

Easy - just add Jericho as a git submodule.

```
git submodule add https://github.com/gengo/jericho.git css/lib/jericho
git submodule init
git submodule update
```

How to setup Jericho's development environment
---------------

1) Install compass:

```
sudo gem install compass
```

2) Install node modules:

```
npm install
```

3) Setup your path if you haven't already:

```
export PATH=$PATH:node_modules/.bin
```

4) Run the grunt task:

```
grunt
```

5) Start a local server on "localhost:9000" so you can check docs:

```
grunt server
```

6) If you want a minified version, run the task for production:

```
grunt build
```


Features
---------------
Jericho would not be without the following great projects:

+ [Twitter Boottrap](http://twitter.github.io/bootstrap/)
+ [sass-twitter-bootstrap](https://github.com/jlong/sass-twitter-bootstrap)

