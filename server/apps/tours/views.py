import re
import datetime
from urllib.parse import unquote

from django.db.models import Min
from django.http import HttpResponse
from django.views import generic

from apps.locations.models import Country
from apps.tours.models import Tour, TourType, TourDatePair


class GetFourTours(generic.ListView):
    model = Tour
    template_name = 'includes/city__part.jinja'
    paginate_by = 4

    def get_queryset(self):
        queryset = super().get_queryset().filter(dates__start__gte=datetime.date.today()).distinct()
        if 'country' in self.request.GET:
            queryset = queryset.filter(hotel__resort__country__slug=self.request.GET['country'])
        if 'resort' in self.request.GET:
            queryset = queryset.filter(hotel__resort__slug=self.request.GET['resort'])
        if 'hotel' in self.request.GET:
            queryset = queryset.filter(hotel__slug=self.request.GET['hotel'])
        return queryset


class GetDateCost(generic.DetailView):
    model = TourDatePair

    def get(self, *args, **kwargs):
        if self.request.is_ajax():
            if self.get_object().hot:
                return HttpResponse(f'<span style="color: red;">{self.get_object().uah_cost}</span>')
            else:
                return HttpResponse(f"{self.get_object().uah_cost}")


class TourList(generic.ListView):
    model = Tour
    template_name = 'tours.jinja'
    paginate_by = 12

    def get_queryset(self):
        queryset = super().get_queryset().filter(dates__start__gte=datetime.date.today()).distinct()
        if 'type' in self.request.GET and self.request.GET['type']:
            queryset = queryset.filter(type__slug=self.request.GET['type'])
        if 'country' in self.request.GET and self.request.GET['country']:
            queryset = queryset.filter(hotel__resort__country__slug=self.request.GET['country'])
        if 'price-from' in self.request.GET and self.request.GET['price-from']:
            queryset = queryset.filter(dates__cost__gte=(self.request.GET['price-from']))
        if 'price-to' in self.request.GET and self.request.GET['price-to']:
            queryset = queryset.filter(dates__cost__lte=(self.request.GET['price-to']))
        if 'days' in self.request.GET and self.request.GET['days']:
            queryset = queryset.filter(duration_days=int(self.request.GET['days']))
        if 'nights' in self.request.GET and self.request.GET['nights']:
            queryset = queryset.filter(duration_nights=int(self.request.GET['nights']))
        if 'stars' in self.request.GET and self.request.GET['stars']:
            queryset = queryset.filter(stars=int(self.request.GET['stars']))
        if 'date' in self.request.GET and self.request.GET['date']:
            matching = re.findall(r'(\d{2,})', unquote(self.request.GET['date']))
            if matching:
                matching = [int(match) for match in matching]
                start_date = datetime.date(year=matching[2], day=matching[0], month=matching[1])
                end_date = datetime.date(year=matching[5], month=matching[4], day=matching[3])
                queryset = queryset.filter(dates__start=start_date, dates__end=end_date)
        return queryset

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        cost = self.get_queryset().annotate(Min('dates__cost')).order_by('dates__cost')
        context['tour_count'] = self.get_queryset().count()
        context['min_cost'] = cost[0].dates.all().order_by('cost')[0].uah_cost if cost else 0
        context['tour_types'] = TourType.objects.all()
        context['country_list'] = Country.objects.all()
        return context


class TourDetail(generic.DetailView):
    model = Tour
    template_name = 'tour.jinja'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        import random
        valid_articles_id_list = Tour.objects.\
            filter(dates__start__gte=datetime.date.today()).exclude(pk=self.kwargs['pk']).\
            values_list('id', flat=True)
        random_articles_id_list = random.sample(list(valid_articles_id_list), min(valid_articles_id_list.count(), 3))
        context['object_list'] = Tour.objects.filter(id__in=random_articles_id_list)
        return context
