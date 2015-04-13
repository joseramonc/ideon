class IdeonFormBuilder < ActionView::Helpers::FormBuilder

  def label_text_field(attribute, options={})
    options = {
      class: 'form-control'
    }.merge!(options)

    label = label(attribute) + text_field(attribute, options)
  end

  def label_collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
    html_options = {
      class: 'form-control'
    }.merge!(html_options)

    label = label(attribute) + collection_select(attribute, collection, value_method, text_method, options, html_options)
  end

  def label_email_field(attribute, options={})
    options = {
      class: 'form-control'
    }.merge!(options)

    label = label(attribute) + email_field(attribute, options)
  end

  def label_password_field(attribute, options={})
    options = {
      class: 'form-control'
    }.merge!(options)

    label = label(attribute) + password_field(attribute, options)
  end

  def label_text_area(attribute, options={})
    options = {
      class: 'form-control'
    }.merge!(options)

    label = label(attribute) + text_area(attribute, options)
  end

  def check_box(attribute, options={})
    @template.content_tag :div, class: 'checkbox' do
      @template.content_tag :label do
        super(attribute, options) + label(attribute)
      end
    end
  end

  def submit(value='Guardar', options={})
    options = {
      class: 'btn btn-success'
    }.merge!(options)

    container class: 'form-group pull-right' do
      super(value, options)
    end
  end

  def container(options={}, &block)
    options = {
      class: 'form-group'
    }.merge!(options)

    @template.content_tag :div, options do
      yield(:block)
    end
  end
end
