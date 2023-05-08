module UserBehaviour
  extend ActiveSupport::Concern

  included do
    # Definisci qui le associazioni, le validazioni e gli scope comuni
  end

  # Metodi di istanza comuni
  def some_instance_method
    # logica del metodo
  end

  class_methods do
    # Metodi di classe comuni
    def some_class_method
      # logica del metodo
    end
  end
end
