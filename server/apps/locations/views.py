from django.shortcuts import render_to_response
from django.views import generic

from .models import Country, Resort, Hotel, HotelType


class CountriesView(generic.ListView):
    template_name = 'country_list.jinja'
    model = Country


class CountryDetail(generic.DetailView):
    template_name = 'country_detail.jinja'
    model = Country


class ResortView(generic.DetailView):
    template_name = 'city_detail.jinja'
    model = Resort


class HotelList(generic.ListView):
    template_name = 'hotel_list.jinja'
    model = Hotel
    paginate_by = 6

    def get_queryset(self):
        queryset = super().get_queryset()
        if 'search' in self.request.GET:
            queryset = queryset.filter(name__icontains=self.request.GET['search'])
        if 'star' in self.request.GET:
            queryset = queryset.filter(stars__in=self.request.GET.getlist('star'))
        if 'country' in self.request.GET:
            queryset = queryset.filter(resort__country__slug__in=self.request.GET.getlist('country'))
        if 'resort' in self.request.GET:
            queryset = queryset.filter(resort__slug__in=self.request.GET.getlist('resort'))
        if 'type' in self.request.GET:
            queryset = queryset.filter(type__slug__in=self.request.GET.getlist('type'))
        if 'hot' in self.request.GET:
            queryset = queryset.filter(hot=True)
        return queryset

    def get_paginate_by(self, queryset):
        return self.request.GET.get('paginate_by', self.paginate_by)

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['hotel_types'] = HotelType.objects.all()
        context['resorts'] = Resort.objects.all()
        return context

    def get(self, request, *args, **kwargs):
        if request.is_ajax():
            paginator, page, queryset, is_paginated = self.paginate_queryset(self.get_queryset(), self.get_paginate_by(self.get_queryset()))
            data = {
                'request': request,
                'page_obj': page,
                'paginator': paginator,
                'object_list': queryset,
                'is_paginated': is_paginated
            }
            return render_to_response('includes/hotels__build.jinja', context=data)
        else:
            return super().get(request, *args, **kwargs)


class HotelDetail(generic.DetailView):
    template_name = 'hotel_detail.jinja'
    model = Hotel
