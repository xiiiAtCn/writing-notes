module ToolBox
    class Ruler
        attr_accessor:length
    end
    end
    module Country
        class Ruler
            attr_accessor:name
        end
    end

    a = ToolBox::Ruler.new
    a.length = 50
    b = Country::Ruler.new
    b.name = 'Ghengis Khan of Moskau'
include ToolBox
    c = Ruler.new
    puts a.class
    puts b.class
    puts c.class