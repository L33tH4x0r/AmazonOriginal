module Spree::BaseHelper
  def logo(image_path=Spree::Config[:logo], img_options: {})
    link_to image_tag(image_path, img_options), spree.root_path
  end

  def nav_tree(root_taxon, current_taxon, taxon_parent, max_level = 1)
    return '' if max_level < 1 || root_taxon.children.empty?
    content_tag :div, class: 'dropdown-menu', "aria-labelledby" => taxon_parent do
      taxons = root_taxon.children.map do |taxon|
        link_to(taxon.name, seo_url(taxon), class: "dropdown-item")
      end
      safe_join(taxons, "\n")
    end
  end
end
