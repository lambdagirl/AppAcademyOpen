module ApplicationHelper
  def ugly_notes(note)
    formatted_note=""
    note.lines.each do |line|
      formatted_note << "✔️ #{h(line)}"
    end

    "<pre class='note'>#{formatted_note}</pre>".html_safe
  end
end
