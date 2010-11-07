require_relative 'helpers/example_window'

Fidgit.default_font_size = 24

# Change labels created within packers, just so we can see their shape.
class Fidgit::Packer
  LABEL_BACKGROUND = Gosu::Color.new(50, 0, 50)

  def label(text, options = {})
    options[:background_color] = LABEL_BACKGROUND
    super(text, options)
  end
end

class ExampleState < GuiState
  ROW_BACKGROUND = Gosu::Color.rgb(0, 100, 0)
  CELL_BACKGROUND = Gosu::Color.rgb(100, 0, 0)
  OUTER_BACKGROUND = Gosu::Color.rgb(0, 0, 100)

  def setup
    pack :vertical, align_h: :center, align_v: :center, background_color: OUTER_BACKGROUND do
      label "h => align_h, v => align_v", align_h: :center

      pack :grid, num_columns: 4, cell_background_color: CELL_BACKGROUND, background_color: ROW_BACKGROUND, align_h: :fill do
        label "xxx"
        label "h fill", align_h: :fill
        label "h right", align_h: :right
        label "h center", align_h: :center


        pack :vertical do
          label "xxx"
          label "xxx"
        end
        label "v fill", align_v: :fill
        label "v center", align_v: :center
        label "v bottom", align_v: :bottom

        pack :vertical, align_h: :center do
          label "h center"
          label "h center"
        end
        label "top right", align_h: :right, align_v: :top
        label "bottom left", align_h: :left, align_v: :bottom
        label "h/v fill", align: :fill

        label ""
        label "bottom right", align_h: :right, align_v: :bottom
        label "bottom center", align_h: :center, align_v: :bottom
        pack :vertical, align_h: :right do
          label "h right"
          label "h right"
        end

        label "Blah, bleh!"
        label "Yada, yada, yada"
        label "Bazingo by jingo!"
      end
    end
  end
end

ExampleWindow.new.show