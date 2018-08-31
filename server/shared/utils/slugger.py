from django.utils.text import slugify
from unidecode import unidecode


def slugger(text, class_name=None):
    slug = slugify(unidecode(text))
    unique_slug = slug
    num = 1
    if class_name:
        while class_name.objects.filter(slug=unique_slug).exists():
            unique_slug = f'{slug}-{num}'
            num += 1
    return unique_slug

