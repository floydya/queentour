from django.db.models import F
from django.shortcuts import render_to_response, redirect
from django.views import generic
from apps.blog.models import Article, Heading
from apps.core.models.core import EmailDispatch


class ArticleDetail(generic.DetailView):
    model = Article
    template_name = 'blog_detail.jinja'

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['headings'] = Heading.objects.all()

        import random
        valid_articles_id_list = Article.objects.all().values_list('id', flat=True)
        random_articles_id_list = random.sample(list(valid_articles_id_list), min(valid_articles_id_list.count(), 4))
        context['object_list'] = Article.objects.filter(id__in=random_articles_id_list)

        a = self.get_object()
        a.views = F('views') + 1
        a.save()

        return context

    def get_object(self, queryset=None):
        return Article.objects.get(heading__slug=self.kwargs['heading'], slug=self.kwargs['slug'])


class ArticleList(generic.ListView):
    model = Article
    template_name = 'blog_list.jinja'
    paginate_by = 10

    def get_queryset(self):
        GET = self.request.GET.copy()
        if 'page' in GET:
            del GET['page']
        if GET.get('all'):
            queryset = Article.objects.all()
        elif GET:
            queryset = Article.objects.filter(heading__slug__in=GET)
        else:
            queryset = Article.objects.all()
        return queryset

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['headings'] = Heading.objects.all()

        import random
        valid_articles_id_list = Article.objects.all().values_list('id', flat=True)
        random_articles_id_list = random.sample(list(valid_articles_id_list), min(valid_articles_id_list.count(), 3))
        context['random'] = Article.objects.filter(id__in=random_articles_id_list)

        return context

    def get(self, request, *args, **kwargs):
        if request.is_ajax():
            context = self.get_context_data(object_list=self.get_queryset())
            context['request'] = request
            return render_to_response('includes/blog__wrap.jinja',
                                      context=context)
        else:
            return super().get(request, *args, **kwargs)

    def post(self, *args, **kwargs):
        if 'email' in self.request.POST and self.request.POST['email']:
            EmailDispatch.objects.get_or_create(email=self.request.POST['email'])
            return redirect(self.request.META.get('HTTP_REFERER', '/'))
