from django import template
import datetime, pytz

register = template.Library()

@register.filter(name='time_since')
def time_since(date, default="Teraz"):
    now = datetime.datetime.utcnow().replace(tzinfo = pytz.utc)
    diff = now - date
    periods = (
        (diff.days / 365, "year", "years"),
        (diff.days / 30, "month", "months"),
        (diff.days / 7, "week", "weeks"),
        (diff.days, "day", "days"),
        (diff.seconds / 3600, "hour", "hours"),
        (diff.seconds / 60, "minute", "minutes"),
        (diff.seconds, "second", "seconds"),
    )
    for period, singular, plural in periods:
        if period:
            return "%d %s temu" % (period, singular if period == 1 else plural)
    return default