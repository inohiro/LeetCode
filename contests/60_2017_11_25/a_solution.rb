# An implementation of https://discuss.leetcode.com/topic/112055/java-9-liner-dfs

def flood_fill(image, sr, sc, new_color)
  return image if image[sr][sc] == new_color
  fill(image, sr, sc, image[sr][sc], new_color) 
  image
end

def fill(image, sr, sc, color, new_color)
  if sr < 0 || sr >= image.length ||
     sc < 0 || sc >= image[0].length ||
     image[sr][sc] != color
    return
  end
  image[sr][sc] = new_color
  fill(image, sr+1, sc, color, new_color)
  fill(image, sr-1, sc, color, new_color)
  fill(image, sr, sc+1, color, new_color)
  fill(image, sr, sc-1, color, new_color)
end

require 'pp'
image = [[1,1,1],[0,1,1],[1,0,1]]
sr = 1
sc = 1
newColor = 2
pp flood_fill(image, sr, sc, newColor)
