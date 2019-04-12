class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(value)
        @parent.children.delete(self) unless @parent.nil?
        @parent = value
        @parent.children << self unless @parent.nil? || @parent.children.include?(self)
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
        raise "This node is not a child" if !@children.include?(child)
    end

    def dfs(target)
        return nil if self.nil?
        if self.value == target
            return self 
        end
        self.children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        
        until queue.empty?
            first = queue.shift
            if first.value == target 
                return first
            else
                queue += first.children
            end
        end
        nil
    end

  
end