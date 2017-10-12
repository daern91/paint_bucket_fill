class Paint
  def fill(img, x, y, color)
    # Set starting position
    queue = [[x, y]]
    # Color at starting position
    start_color = img[y][x]

    # Find boundaries
    h = img.length
    w = img[y].length

    until queue.empty?
      x,y = queue.pop
      # If img color is equal to starting position color
      if img[y][x] == start_color
        # Then set it to new color
        img[y][x] = color
        # And add next X and Y to queue if
        # it is within the boundaries
          queue.push([x+1,y+1])   if x+1 < w && y+1 < h
          queue.push([x+1,y])     if x+1 < w
          queue.push([x+1,y-1])   if x+1 < w && y-1 >= 0
          queue.push([x,y+1])     if y+1 < h
          queue.push([x,y-1])     if y-1 >= 0
          queue.push([x-1,y+1])   if x-1 >= 0 && y+1 < h
          queue.push([x-1,y])     if x-1 >= 0
          queue.push([x-1,y-1])   if x-1 >= 0 && y-1 >= 0
      end
    end

    return img
  end
end
