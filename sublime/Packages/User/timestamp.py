import datetime
import sublime, sublime_plugin

# Sublime Text 3 plug-in to insert current local and UTC timestamps (ISO 8601)
# Type 'date', 'datetime', 'now', 'utcdate', 'utcdatetime', 'utcnow' and then hit TAB.

class TimestampCommand(sublime_plugin.EventListener):
  def on_query_completions(self, view, prefix, locations):
    if prefix in ("date", "datetime", "now"): # 2020-10-30T11:01:33-04:00
      # https://stackoverflow.com/questions/2150739/iso-time-iso-8601-in-python/28147286#28147286
      # Local to ISO 8601 with TimeZone information
      stamp = (
        datetime.datetime.utcnow()
        .replace(tzinfo=datetime.timezone.utc)
        .astimezone()
        .replace(microsecond=0)
        .isoformat()
      )
    elif prefix in ("utcdate", "utcdatetime", "utcnow"): # 2020-10-30T15:01:33-00:00
      # UTC to ISO 8601 with TimeZone information
      stamp = (
        datetime.datetime.utcnow()
        .replace(tzinfo=datetime.timezone.utc, microsecond=0)
        .isoformat()
      )
    else:
      stamp = None

    return [(prefix, prefix, stamp)] if stamp else []
