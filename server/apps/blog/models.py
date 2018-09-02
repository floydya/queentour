from ckeditor.fields import RichTextField
from django.contrib.contenttypes.fields import GenericRelation
from django.db import models
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _

from apps.core.models import Image
from shared.utils.slugger import slugger


class Heading(models.Model):

    slug = models.SlugField(editable=False, db_index=True)
    name = models.CharField(max_length=50, verbose_name=_("Name"))

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _("Heading")
        verbose_name_plural = _("Headings")

    def save(self, *args, **kwargs):
        self.slug = slugger(self.name)
        super().save(*args, **kwargs)


class Article(models.Model):

    slug = models.SlugField(editable=False, db_index=True)
    title = models.CharField(max_length=144, verbose_name=_("Title"))
    date = models.DateTimeField(auto_now_add=True, verbose_name=_("Date"))
    body = RichTextField(verbose_name=_("Body"))
    heading = models.ForeignKey(Heading, null=True, blank=True, on_delete=models.CASCADE,
                                related_name='articles', verbose_name=_("Heading"))

    views = models.PositiveIntegerField(default=0, editable=False)
    stars = models.PositiveSmallIntegerField(choices=((0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5)),
                                             verbose_name=_("Stars"), default=0)

    images = GenericRelation(Image)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['-date']
        verbose_name = _("Article")
        verbose_name_plural = _("Articles")

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugger(self.title, Article)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('article-detail', args=[self.heading.slug, self.slug])
