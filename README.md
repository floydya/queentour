# queentour

A short description of the project.



See the documentation [here](http://noop.com)

## Features to do

- [ ] Add required dependencies

## Development process

#### Server start

To start to project you have to use a docker.

Installation process descibed here https://docs.docker.com/install/

After installation you can run the project using Makefile. If you're on Windows read here how to use it https://stackoverflow.com/questions/2532234/how-to-run-a-makefile-in-windows, if you're a Linux guy you know what to do.

Run `make start` and magic will happen.

To create a superuser run `make createsuperuser`

There are a few other command in `Makefile`, but they are for extraordinary times.   


If you need some extra environment variables - add them to `docker-compose.yml` 

#### Server dependencies instalation

```bash
cd server/
pipenv --python 3.6
pipenv install --dev
```

#### Client dependencies instalation

```bash
cd client/
npm install
```

##### Environment variables
For platform(user)-specific settings use environment variables.

There is an example file inside server directory - `.env`.

There is a collection of variables that are stored inside file. For a further details you can check [django-environ](https://github.com/joke2k/django-environ) package.

##### Python environment creation

```bash
cd server/
pipenv shell
python manage.py runserver
```

Also there are separate `docs` folder where the simple documentation scaffolding addded.

You will need to install documentation generator requirements from `server/docs/requirements.txt`.

To generate documentation just run: `make html` inside of the `docs` folder.

#### Client workflow start

To start client build tool in development mode:

```
cd client/
npm run dev
```

Before each commit you must run client scripts build(for now). The script will build all static sources and minify them.

```bash
npm run build
```

### Folder structure

#### Server application

```
server/
    app/
        # All the project or "app" configurations stored here.
    apps/
        # This is a place for your project applications.
        # It's nessesary to place them here, to avoid name collisions with an existing python libraries.
    docs/
        # Separate folder for server side documentation.
    markup/
        # All the code from `client` folder villl be built into this application.
        # Also there are a separate view that staticaly renders templates folder. This view is available only in a debug(DEBUG = True) mode.
        # It's here for the front-end developer on an early stages of development. When there is no server-side delveloper at the project.
    shared/
        # An application to store utility code, that will be shared across several applications. For example: base models, base views, some core services functionality.
```

#### Client application

```
client/
    build/
        # Here lies client build configuration.
        config/
        gulp/
        webpack/
    src/
        # Folder where all the code should be located.
        # By default code from here fill be build into the `/server/markup/` application.
        js/
            # Folder for the main.js bundle(by default). You should store all the javascript here.
            # Builded files from here will be build into the `/server/markup/static/js/` folder.
        pug/
            # All the xml/html like files should be placed here.
            mixins/
                # Here you should store all the mixins that you will use throughout the project.
            templates/
                # This is the spacial folder, from where all the `*.pug` files will be build into the django template files.
                # Builded files from here will be build into the `/server/markup/templates/` folder.
        stylus/
            # The same situation for this folder. All your styles should be stored here.
            framework/
                # Utility code for the project should be separeted into this folder.
            project/
                # Project specific code should be located here.
        public/
            # This folder can be used to store some assets(images, fonts, etc.), that shouldn't be built. So you chould only add this files here, and they will be automaticly copied to the django app static root `/server/markup/static/**`.
```
