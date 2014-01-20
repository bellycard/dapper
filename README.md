dapper
======
*Belly's Front-End Framework*

### One time Installation
Install [NVM](https://github.com/creationix/nvm) (Recommended)

    $ curl https://raw.github.com/creationix/nvm/master/install.sh | sh

Install Node using NVM

    $ nvm install 0.10.24

  *...wait a bit...*

    $ nvm alias default 0.10.24

Install global npm packages

    $ npm install -g grunt-cli
    $ npm install -g coffee

### Starting the server

Ensure all package dependencies have been installed

    $ npm install
    $ bower install

Start the server

    $ grunt

### Todo:
- Angular boilerplate
- Some sort of compile step for bower packages
- Consider livereload
- Add server-side component for cacheing and storing presentational content
