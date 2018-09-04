import datetime

from django.shortcuts import render_to_response
from django.template import RequestContext
from django.views import generic

from apps.blog.models import Article
from apps.tours.models import Tour, TourType


def handler404(request, *args, **argv):
    response = render_to_response('404.jinja', context=RequestContext(request))
    response.status_code = 404
    return response


class IndexView(generic.TemplateView):
    template_name = 'index.jinja'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['main_blog_article'] = Article.objects.first()
        context['left_blog_articles'] = Article.objects.all().exclude(pk=Article.objects.first().pk).order_by('-date')[0:2]
        context['right_blog_articles'] = Article.objects.all().exclude(pk=Article.objects.first().pk).order_by('-date')[2:4]
        import random
        valid_articles_id_list = Tour.objects. \
            filter(dates__start__gte=datetime.date.today(), dates__hot=True). \
            values_list('id', flat=True)
        random_articles_id_list = random.sample(list(valid_articles_id_list), min(valid_articles_id_list.count(), 3))
        context['object_list'] = Tour.objects.filter(id__in=random_articles_id_list)
        return context
