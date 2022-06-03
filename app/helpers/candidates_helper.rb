module CandidatesHelper
  def candidates_tabs
    tab_data = Struct.new(:link, :content, :active, keyword_init: true)
    tab_type = Struct.new(:one, :two, :three, :four, :five, keyword_init: true)
    tab_type.new(
      one: tab_data.new(link: "#", content: 'Votes stream', active: false),
      two: tab_data.new(link: "#", content: 'Votes bar graph', active: false),
      three: tab_data.new(link: "#", content: 'Votes timeseries', active: false),
      four: tab_data.new(link: "#", content: 'Votes pie graph', active: false),
      five: tab_data.new(link: "#", content: 'Settings', active: false)
    )
  end

  def tab_class(is_active)
    if is_active
      "px-3 border-b-2 border-blue-500 text-blue-500 dark:text-white dark:border-white pb-1.5"
    else
      "px-3 border-b-2 border-transparent text-gray-600 dark:text-gray-400 pb-1.5"
    end
  end

  def candidate_active_main_tab
    ""
  end

  def candidate_active_main_tab_locals
    ""
  end
end
