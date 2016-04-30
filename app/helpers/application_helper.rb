module ApplicationHelper
	def title(page_title)
		content_for(:title) { page_title }
	end

	def active_class(link_path)
 		current_page?(link_path) ? "active" : ""
	end
end
