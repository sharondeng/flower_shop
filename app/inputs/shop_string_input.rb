class ShopStringInput < FormtasticBootstrap::Inputs::StringInput
  def bootstrap_wrapping(&block)
    form_group_wrapping do
      label_html <<
          template.content_tag(:span, class: 'form-wrapper shop-order') do
            input_content(&block) <<
                hint_html <<
                error_html(:block)
          end
    end
  end
end
