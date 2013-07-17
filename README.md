Jericho
=========
Jericho provides simple and fle	xible HTML, CSS, and Javascript for web apps that wants to use the Stylish UI style. It is built on top of Twitter Bootstrap.

How to use Jericho
---------------

add Jericho as git submodule.

```
git submodule add https://github.com/gengo/jericho.git css/lib/jericho
git submodule init
git submodule update
```

How to setup Jericho's development environment
---------------

install compass.

```
sudo gem install compass
```
install node modules.

```
npm install
```
You should setup path if you did not.

```
export PATH=$PATH:node_modules/.bin
```

run the grunt task.

```
grunt
```

This will start a local server on "localhost:9000" so you can check docs

```
grunt server
```

if you want to minified file. run task for production.

```
grunt build
```


Features
---------------
The framework integrate and extend the work first done by other great people:

+ [Twitter Boottrap](http://twitter.github.io/bootstrap/)
+ [sass-twitter-bootstrap](https://github.com/jlong/sass-twitter-bootstrap)