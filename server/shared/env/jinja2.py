from jinja2 import Environment


def environment(**options):
    """
    Provdes default environvent for jinja.
    """
    options['cache_size'] = 0

    env = Environment(**options)
    env.globals.update(list=list)
    env.globals.update(zip=zip)
    return env
