from django.views import generic

from apps.core.models import SertificateSettings, Comment, AboutSettings, DocumentsSettings


class SertificateView(generic.TemplateView):
    template_name = 'sertificate.jinja'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['settings'] = SertificateSettings.objects.get()
        return context


class DocumentsView(generic.TemplateView):
    template_name = 'documents.jinja'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['doc_settings'] = DocumentsSettings.objects.get()
        return context


class CommentView(generic.TemplateView):
    template_name = 'reviews.jinja'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['object_list'] = Comment.objects.all()
        context['youtube_list'] = Comment.objects.filter(type=3)
        context['text_list'] = Comment.objects.filter(type=1)
        context['image_list'] = Comment.objects.filter(type=2)
        return context


class SearchTourView(generic.TemplateView):
    template_name = 'search-tour.jinja'


class SearchAviaView(generic.TemplateView):
    template_name = 'avia.jinja'


class AboutView(generic.TemplateView):
    template_name = 'company.jinja'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['about_settings'] = AboutSettings.objects.get()
        return context


class ContactView(generic.TemplateView):
    template_name = 'contact.jinja'
