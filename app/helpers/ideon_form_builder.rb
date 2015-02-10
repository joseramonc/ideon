class IdeonFormBuilder < ActionView::Helpers::FormBuilder

  def label_text_field(attribute, options={})
    options = {
      class: 'form-control'
    }.merge!(options)

    label = label(attribute) + text_field(attribute, options)
  end

  def submit(value='Guardar', options={})
    options = {
      class: 'btn btn-primary'
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
