module ApplicationHelper
  def time_tag(time, format = :short, opts = {})
    opts[:datetime] = time.utc.iso8601
    content_tag(:time, l(time, :format => format), opts)
  end
end
