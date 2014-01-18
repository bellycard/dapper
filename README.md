dapper
======
*Belly's Front-End Framework*

### One time Installation
Install [NVM](https://github.com/creationix/nvm) (Recommended)
 
    $ curl https://raw.github.com/creationix/nvm/master/install.sh | sh

Install node

    $ brew install node

Install Grunt's command line interface, globally

    $ npm install -g grunt-cli

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
