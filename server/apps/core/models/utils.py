from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.db import models
from django.utils.safestring import mark_safe

from shared.utils.pathrename import path_and_rename
from django.utils.translation import ugettext_lazy as _


class Image(models.Model):
    image = models.ImageField(upload_to=path_and_rename)

    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, related_name='images')
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    def image_tag(self):
        return mark_safe(f'<a target="_blank" href="{self.image.url}"><img src="{self.image.url}" '
                         f'style="border: 1px solid #ddd; border-radius: 4px; padding: 5px; width: 150px;" /></a>')

    image_tag.short_description = _('Image')
