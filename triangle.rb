# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  valid? a, b, c

  # My solution:
#  if a == b and b == c
#    return :equilateral
#  elsif a == b or b == c or a == c
#    return :isosceles
#  else
#    return :scalene
#  end

  # Slicker solution provided by http://stackoverflow.com/a/4742761/208457
  case [a,b,c].uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    else        :scalene
  end
end

def valid?(a, b, c)
  if a <= 0 or b <= 0 or c <= 0
    raise TriangleError, 'All values must be positive'
  elsif a >= b+c or b >= a+c or c >= a+b
    raise TriangleError, 'A triangle cannot have a side whose length is greater than or equal to the length of the other two sides combined'
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
