# 733. Flood Fill My SubmissionsBack to Contest

# An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

# Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

# To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

# At the end, return the modified image.

# Example 1:
# Input: 
#   image = [[1,1,1],[1,1,0],[1,0,1]]
#   sr = 1, sc = 1, newColor = 2
#   Output: [[2,2,2],[2,2,0],[2,0,1]]
# Explanation: 
#   From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected 
#  by a path of the same color as the starting pixel are colored with the new color.
#  Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.

# Note:
# - The length of image and image[0] will be in the range [1, 50].
# - The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
# - The value of each color in image[i][j] and newColor will be an integer in [0, 65535].

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  l = image.length

  (0..l-1).each do |i|
    (0..l-1).each do |j|
      if image[i][j] != 0 && image[i][j] != new_color
        if i == sr && j == sc
          image[i][j] = new_color
#          (0..l-1).each do |k|
#            image[i][k] = new_color if image[i][k] != 0 && image[i][k] != new_color
#          end
        elsif i == sr -1 && j == sc # ue
          image[i][j] = new_color
          image = flood_fill(image, i, j, new_color)
        elsif i == sr +1 && j == sc # shita
          image[i][j] = new_color
          image = flood_fill(image, i, j, new_color)
        elsif i == sr && j == sc -1 # hidari
          image[i][j] = new_color
          image = flood_fill(image, i, j, new_color)
        elsif i == sr && j == sc +1 # migi
          image[i][j] = new_color
          image = flood_fill(image, i, j, new_color)
        end
      end 
    end
  end
  image
end

require 'pp'
image = [[1,1,1],[0,1,1],[1,0,1]]
image = 
sr = 1
sc = 1
newColor = 2
pp flood_fill(image, sr, sc, newColor)
